//
//  CTTabBarViewController.m
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "CTTabBarView.h"

@interface CTTabBarView ()

@end

@implementation CTTabBarView

@synthesize buttons,checkView,superView;
@synthesize delegate;


-(id) initWithColor:(UIColor *)color Buttons:(NSArray *)btns SuperView:(UIView *)asuperView
{
    if(self = [super init])
    {
        //背景初始化
        self.superView = asuperView;
        self.backgroundColor = color;
        //按钮数据初始化
        self.buttons = [[NSMutableArray alloc]initWithArray:btns];
        _showbtn =  [[NSMutableArray alloc ]init];

        //背景位置
        CGRect frame = CGRectMake(0, 416, 320, 45);
        self.frame = frame;
        
        // 选中的视图初始化
        checkView = [[UIView alloc ]init];
        
        selectedIndex = 0;
        itemcount = [buttons  count];
        foolWidth  = self.frame.size.width;
        avgWidth = foolWidth / itemcount - 0;
        
        [self selectedViewStyle];
        [self putButtons];
        [self showButtons];
        
        CTTabBarItem * tmpb =  buttons[selectedIndex];
        [superView addSubview:tmpb.viewController.view];

//        [self changeTab:1];
        

        
    }
    return self;
}
-(id)initWithImage:(UIImage *)aimg Buttons:(NSArray *)abuttons SuperView:(UIView *)asuperView
{
    UIColor * c = [[UIColor alloc ] initWithPatternImage:aimg];
    if(self = [self initWithColor:c Buttons:abuttons SuperView:asuperView])
    {
        
    }
    return self;
}
-(void) selectedViewStyle
{
    UIImage *  im = [UIImage imageNamed:@"tabbar_slider.png"];
    CGRect frame = CGRectMake(avgWidth * selectedIndex, 0, avgWidth, 44);
    checkView.frame = frame;
    UIColor * c = [[UIColor alloc ]initWithPatternImage:im];
    checkView.backgroundColor = c;
//    checkView.alpha = 0.4;
    [self  addSubview:self.checkView];
    
    


}

/**
    装载buttons
 */
-(void) putButtons
{
    
    for (int i = 0; i<itemcount; i++) {
        CTTabBarItem * tmpb  = [self.buttons objectAtIndex:i];
        UIButton * btn = [[UIButton alloc ] initWithFrame:CGRectMake(avgWidth * i, 0, avgWidth, 44)];
        [btn setImage:tmpb.img forState:UIControlStateNormal];
        [btn setImage:tmpb.checkedimg forState:UIControlStateHighlighted];

        btn.tag = i;
        [btn setTitle:tmpb.name forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(checkedButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn.titleLabel setFont:tmpb.fontSize];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-15, 14, 0, 16)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(20, -36, 0, -5)];
        [_showbtn  addObject:btn];
    }
    CTTabBarItem * tmpb =  buttons[selectedIndex];
    [_showbtn[selectedIndex] setImage: tmpb.checkedimg forState:UIControlStateNormal];
    

}
/**
    show出buttons
 */
-(void)showButtons
{
    
    for (id o in _showbtn) {
        //        [self.view addSubview:];
        [self addSubview:o];
    }
}
/**
    buttons的触发事件
 */
-(void)checkedButton : (UIButton *) sender
{
    
   
    [self changeTab:sender.tag];


    [delegate clickButton:sender TabBarButton:buttons[sender.tag]];
    
}
-(void)changeTab:(int) index
{
    
    CTTabBarItem * tmpb1 =  buttons[selectedIndex];
    [_showbtn[selectedIndex]  setImage:tmpb1.img forState:UIControlStateNormal];
    
    selectedIndex = index;
    
    CTTabBarItem * tmpb2 =  buttons[selectedIndex];
    [_showbtn[selectedIndex]  setImage:tmpb2.checkedimg forState:UIControlStateNormal];
    
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:0.1f];
    
    CGRect frame = CGRectMake(avgWidth * selectedIndex, 0, avgWidth, 44);
    checkView.frame = frame;
    
    [UIView commitAnimations];     //动画结束 

    [superView addSubview:tmpb2.viewController.view];
    //[superView presentModalViewController:tmpb2.viewController animated:NO];


    

}

@end
