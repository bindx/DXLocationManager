//
//  ViewController.m
//  location
//
//  Created by Bindx on 10/10/15.
//  Copyright (c) 2015 Bindx. All rights reserved.
//

#import "ViewController.h"
#import "DXLocationManager.h"

@interface ViewController ()<LocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)getlocation:(UIButton *)sender{
    if (sender.tag == 1) {//Block
        [DXLocationManager getlocationWithBlock:^(double longitude, double latitude) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"位置信息" message:[NSString stringWithFormat:@"经度:%f \n纬度:%f",longitude,latitude] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            NSLog(@"%f",longitude);
            [alert show];
        }];
    }else{//Delegate
        [GetLocationManger getMyLocationWithDelegate:YES];
        GetLocationManger.delegate = self;
    }
}

#pragma --mark DXLocation Delegate

- (void)locationManager:(DXLocationManager *)manager didGetLocation:(CLLocationCoordinate2D)coordinate success:(BOOL)success{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"位置信息" message:[NSString stringWithFormat:@"经度:%f \n纬度:%f",coordinate.longitude,coordinate.latitude] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
