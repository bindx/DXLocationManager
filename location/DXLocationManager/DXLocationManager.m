//
//  DXLocationManager.m
//  Location
//
//  Created by Bindx on 9/16/14.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import "DXLocationManager.h"
#import <QuartzCore/QuartzCore.h>
#import <arpa/inet.h>

@implementation DXLocationManager

static DXLocationManager *sharedLocationManager = nil;

+ (DXLocationManager *)sharedLocationManager{
    @synchronized(self){
        if(sharedLocationManager == nil){
            sharedLocationManager = [[self alloc] init];
            [sharedLocationManager initRaysource];
            // 开启定位服务
            [sharedLocationManager getMyLocationWithDelegate:NO];
        }
    }
    return sharedLocationManager;
}


- (void)initRaysource{
    if(_locationManager == nil)
//        _locationManager = [[CLLocationManager alloc] init];
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    
    if (![CLLocationManager locationServicesEnabled]){
        self.locationServicesEnabled = NO;
    }
    
    _locationManager.distanceFilter = 100.0f;
    CGPoint point = CGPointFromString([[NSUserDefaults standardUserDefaults] valueForKey:Location]);
    _curLocation = CLLocationCoordinate2DMake(point.x, point.y);
}

- (void)getMyLocationWithDelegate:(BOOL)bl{
    self.getLocation = YES;
    if (!bl) {
        GetLocationManger.delegate = self;
    }
    [_locationManager startUpdatingLocation];
}

+ (void)getlocationWithBlock:(CLLocationBlock) block{
    [GetLocationManger getMyLocationWithDelegate:YES];
    if (block) {
        GetLocationManger.cblock = [block copy];
    }
}

#pragma CLLocationManager delegate method
- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    self.locationServicesEnabled = YES;
    _curLocation = [newLocation coordinate];
    
    if(!_curLocation.latitude)
        _curLocation = CLLocationCoordinate2DMake(40.199230,118.331400);
    
    [[NSUserDefaults standardUserDefaults] setValue:NSStringFromCGPoint(CGPointMake(_curLocation.latitude, _curLocation.longitude)) forKey:Location];
    
    [manager stopUpdatingLocation];
    
    if(self.getLocation){
        self.getLocation = NO;
        if([_delegate respondsToSelector:@selector(locationManager:didGetLocation:success:)]){
            [_delegate locationManager:self didGetLocation:_curLocation success:YES];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    self.locationServicesEnabled = NO;
    [manager stopUpdatingLocation];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status){
        if([_delegate respondsToSelector:@selector(locationManager:didShowIndelegate:)]&&_delegate){
            [_delegate locationManager:self didShowIndelegate:@"error"];
        }
    }
    
    if(self.getLocation){
        self.getLocation = NO;
        if([_delegate respondsToSelector:@selector(locationManager:didGetLocation:success:)])
            [_delegate locationManager:self didGetLocation:_curLocation success:NO];
    }
}

- (void)locationManager:(DXLocationManager *)manager didGetLocation:(CLLocationCoordinate2D)coordinate success:(BOOL)success{
    if(success){
        if (_cblock) {
            _cblock(coordinate.longitude,coordinate.latitude);
        }
    }else{
        if (_cblock) {
            _cblock(0,0);
        }
    }
}

@end
