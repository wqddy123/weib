//
//  Navigation.m
//  weibo
//
//  Created by 王 强 on 13-8-9.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "Navigation.h"

@interface Navigation ()

@end

@implementation Navigation

@synthesize titleLable;

-(id) initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {

        //背景设置
        UIImage * img = [UIImage imageNamed:@"navigationbar_background.png"];
        [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
