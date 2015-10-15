//
//  ViewController.h
//  location
//
//  Created by Bindx on 10/10/15.
//  Copyright (c) 2015 Bindx. All rights reserved.
//

#import <UIKit/UIKit.h>

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define TARGET_OS 0
#endif

@interface ViewController : UIViewController


@end

