//
//  Navigation.h
//  weibo
//
//  Created by 王 强 on 13-8-9.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface Navigation : UINavigationController


@property (nonatomic,retain) UILabel * titleLable;

-(id)initWithRootViewController:(UIViewController *)rootViewController;
@end
