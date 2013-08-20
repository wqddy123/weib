//
//  MainViewController.m
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tbc;
@synthesize msgView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    Navigation * n1 = [[Navigation alloc ]initWithRootViewController:[[HomeView alloc]init]];

    CTTabBarItem * tb1 = [[CTTabBarItem alloc]initWithName:@"首页"
                                                          aImg:[UIImage imageNamed:@"tabbar_home.png"]
                                                    checkedImg:[UIImage imageNamed:@"tabbar_home_selected.png"]
                                                ViewController:n1];
    
    msgView = [[MsgView alloc]init];
    Navigation * n2 = [[Navigation alloc ]initWithRootViewController:msgView];

    CTTabBarItem * tb2 = [[CTTabBarItem alloc]initWithName:@"消息"
                                                          aImg:[UIImage imageNamed:@"tabbar_message_center.png"]
                                                    checkedImg:[UIImage imageNamed:@"tabbar_message_center_selected.png"]
                                                ViewController:n2];
    
   
    
    UIViewController * v3 = [[UIViewController alloc ]init];
    v3.view.backgroundColor = [UIColor yellowColor];
    CTTabBarItem * tb3 = [[CTTabBarItem alloc]initWithName:@"我的"
                                                          aImg:[UIImage imageNamed:@"tabbar_profile.png"]
                                                    checkedImg:[UIImage imageNamed:@"tabbar_profile_selected.png"]
                                                ViewController:v3];
    
   
    
    CTTabBarItem * tb4 = [[CTTabBarItem alloc]initWithName:@"广场"
                                                          aImg:[UIImage imageNamed:@"tabbar_discover.png"]
                                                    checkedImg:[UIImage imageNamed:@"tabbar_discover_selected.png"]];
    
    
   Navigation * n5 = [[Navigation alloc ]initWithRootViewController:[[Settings alloc]init]];

    CTTabBarItem * tb5 = [[CTTabBarItem alloc]initWithName:@"更多"
                                                          aImg:[UIImage imageNamed:@"tabbar_more.png"]
                                                    checkedImg:[UIImage imageNamed:@"tabbar_more_selected.png"]ViewController:n5];
    
    
    NSArray * array = [NSArray arrayWithObjects:tb1,tb2,tb3,tb4,tb5, nil];
    
    tbc = [ [CTTabBarView alloc ]initWithImage:[UIImage imageNamed:@"toolbar_background.png"] Buttons:array SuperView:self.view];
    tbc.delegate = self;
    
    [self.view addSubview:tbc];
    
//    UIButton * btn1 = [[UIButton alloc]ini];
	// Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make -
#pragma make the CTTabBarView delegate
-(void)clickButton:(UIButton *)btn TabBarButton:(CTTabBarItem *)item
{
    if ([item.name isEqualToString:@"首页"]) {
        
    }else if ([item.name isEqualToString:@"消息"]) {
        
        [msgView ViewFrashData:self Action:@selector(msgbtn)];
        
    }else if ([item.name isEqualToString:@"我的"]) {
        
    }else if ([item.name isEqualToString:@"广场"]) {
        
    }else if ([item.name isEqualToString:@"更多"]) {
        
    }
        
}
-(void)msgbtn
{
    NSLog(@"MainViewController:消息模块刷新触发");
}
@end
