//
//  CTTabBarButton.h
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTTabBarItem : NSObject
{

}

@property (nonatomic,retain) NSString * name;
@property (nonatomic,retain) UIImage * img;
@property (nonatomic,readonly) UIFont *fontSize;
@property (nonatomic,retain) UIImage * checkedimg;
@property (nonatomic,readonly) UIViewController * viewController;



-(id)initWithName:(NSString *) aname
             aImg:(UIImage *) aimag
       checkedImg:(UIImage *) acheckedimg;

/**
    aname 按钮标题
    aimg  按钮图标
    checkedImg 选中时的图标
    viewController 选中时视图区域的显示。
 */
-(id)initWithName:(NSString *) aname
             aImg:(UIImage *) aimag
       checkedImg:(UIImage *) acheckedimg
  ViewController :(UIViewController *) aviewController;


// 设置选中时的视图区域

-(void)setViewController:(UIViewController *)aviewController;

@end
