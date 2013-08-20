//
//  MainViewController.h
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CTTabBarView.h"
#import "CTTabBarItem.h"
#import "Navigation.h"


#import "Settings.h"
#import "HomeView.h"
#import "MsgView.h"

@interface MainViewController : UIViewController <CTTabBarViewDelegate>

@property (nonatomic,retain)CTTabBarView * tbc;
@property(nonatomic,retain)MsgView *msgView;



@end
