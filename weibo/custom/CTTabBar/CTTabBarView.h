//
//  CTTabBarViewController.h
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTTabBarItem.h"

@protocol CTTabBarViewDelegate <NSObject>

//btn 被点击的button item 被点击button的 数据源
@required
-(void) clickButton : (UIButton *) btn TabBarButton : (CTTabBarItem *) item;
@end

@interface CTTabBarView : UIView
{
    NSMutableArray * _showbtn;
    float avgWidth;
    int itemcount;
    int selectedIndex;
    float foolWidth;
}

@property(nonatomic,retain) NSMutableArray * buttons;
@property(nonatomic,retain) UIView * superView;


@property(nonatomic,retain)UIView * checkView;
@property(nonatomic,retain)id <CTTabBarViewDelegate> delegate;

-(id)initWithColor  :(UIColor *) color
           Buttons  :(NSArray *)buttons
        SuperView   :(UIView *) asuperView;

-(id)initWithImage  :(UIImage *) aimg
           Buttons  :(NSArray *)abuttons
        SuperView   :(UIView *) asuperView;

-(void)checkedButton:(UIButton *) sender;

@end
