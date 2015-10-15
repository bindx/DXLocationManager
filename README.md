# DXLocationManager


####使用CocoaPods
</p>

    pod 'DXLocationManager',:git=>"https://github.com/bindx/DXLocationManager.git"

##使用方法
<p></p>
######iOS 6 & 7

如果你是在 iOS6 & 7中使用,在Info.plist文件中添加NSLocationUsageDescription Boolean YES

######iOS 8 & 9

在info.plist表里面添加两条
<p>NSLocationAlwaysUsageDescription Boolean YES</p>
<p>NSLocationWhenInUseUsageDescription Boolean YES</p>
用于提示用户授权使用地理定位功能时的提示语。


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