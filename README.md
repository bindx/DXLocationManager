# DXLocationManager


##使用方法


####导入头文件 #import "DXLocationManager.h"

###Block

    [DXLocationManager getlocationWithBlock:^(double longitude, double latitude) {

     }];
     
###Delegate
    [GetLocationManger getMyLocationWithDelegate:YES];
      
    GetLocationManger.delegate = self;

####实现代理 --LocationManagerDelegate 


    - (void)locationManager:(DXLocationManager *)manager   didGetLocation(CLLocationCoordinate2D)coordinate success:(BOOL)success{
    
    }