//
//  BaseViewPageController.m
//  weibo
//
//  Created by 王 强 on 13-8-12.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "BaseViewPageController.h"

@interface BaseViewPageController ()

@end

@implementation BaseViewPageController


@synthesize titleLable,btn;

- (id)init
{
    self = [super init];
    if (self) {
        baseVeiwSize = self.view.frame.size;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    CGSize viewSize = self.view.bounds.size;
    
    self.view.backgroundColor =  [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    //title标题
    titleLable = [[UILabel alloc ] initWithFrame:CGRectMake(10,10,200,40)];
    titleLable.textAlignment = UITextAlignmentCenter;
    titleLable.backgroundColor = [UIColor clearColor];
    [titleLable setFont:[UIFont systemFontOfSize:18]];
    titleLable.textColor = [UIColor darkTextColor];
    titleLable.text = @"更多";
    self.navigationItem.titleView = titleLable;
    
    
    // 设置按钮 创建
    btn = [[UIButton alloc ]init];
    btn.bounds = CGRectMake(0, 0, 45, 30);
    [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    UIImage *m = [UIImage imageNamed:@"navigationbar_button_background.png"];
    
    
    //设置拉伸范围
    UIImage * dm = [m resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    [btn setBackgroundImage:dm forState:UIControlStateNormal];
    UIBarButtonItem * SettingsButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:SettingsButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
