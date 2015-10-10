//
//  GetLocation.h
//  OWS
//
//  Created by Bindx on 9/16/14.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#define GetLocationManger [DXLocationManager sharedLocationManager]

static NSString *const Location = @"Location";

@protocol LocationManagerDelegate;

@interface DXLocationManager : NSObject<CLLocationManagerDelegate>

+ (DXLocationManager *)sharedLocationManager;

typedef void(^CLLocationBlock)(double longitude,double latitude);

@property(nonatomic,  copy) CLLocationBlock cblock;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,assign) CLLocationCoordinate2D curLocation;
@property(nonatomic,assign) BOOL getLocation;
@property(nonatomic,assign) id<LocationManagerDelegate>delegate;
@property(nonatomic,assign) BOOL locationServicesEnabled;

//获取定位
- (void)getMyLocation;
+ (void)getlocationWithBlock:(CLLocationBlock) block;

@end

@protocol LocationManagerDelegate <NSObject>

@optional

- (void)locationManager:(DXLocationManager *)manager didGetLocation:(CLLocationCoordinate2D)coordinate success:(BOOL)success;
- (void)locationManager:(DXLocationManager *)manager  didShowIndelegate:(NSString *)addre;

@end