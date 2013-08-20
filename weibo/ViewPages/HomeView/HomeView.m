//
//  HomeView.m
//  weibo
//
//  Created by 王 强 on 13-8-10.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "HomeView.h"
#import "TSPopoverController.h"

@interface HomeView ()

@end

@implementation HomeView

@synthesize rightBtn,leftBtn,titleButton;

@synthesize popover;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    keyBoardController = [[UIKeyboardViewController alloc]initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //标题
    titleButton = [[UIButton alloc ]init];
    titleButton.bounds = CGRectMake(0, 0, 150, 40);
    titleButton.backgroundColor = [UIColor clearColor];
    UIImage * im = [UIImage imageNamed:@"navigationbar_background.png"];
    UIImage * dm = [im resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
    [titleButton setBackgroundImage:dm forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [titleButton setTitle:@"飞天暴暴龙" forState:UIControlStateNormal];
    [titleButton.titleLabel setFont:[UIFont systemFontOfSize:18.0f]];
    self.navigationItem.titleView = titleButton;
    
    
    //左按钮
    leftBtn = [[UIButton alloc ]init];
    leftBtn.frame = CGRectMake(100, 100, 40, 40);
    UIImage * leftimg1 = [UIImage imageNamed:@"navigationbar_compose.png"];
    UIImage * leftimg2 = [UIImage imageNamed:@"navigationbar_compose_highlighted.png"];
    [leftBtn setImage:leftimg1 forState:UIControlStateNormal];
    [leftBtn setImage:leftimg2 forState:UIControlStateHighlighted];
    UIBarButtonItem * lbtn = [[UIBarButtonItem alloc ] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:lbtn];
    
    //右按钮
    rightBtn = [[UIButton alloc ]init];
    rightBtn.frame = CGRectMake(100, 100, 40, 40);
    UIImage * lrightimg1 = [UIImage imageNamed:@"navigationbar_pop.png"];
    UIImage * lrightimg2 = [UIImage imageNamed:@"navigationbar_pop_highlighted.png"];
    [rightBtn addTarget:self action:@selector(popWindow: forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:lrightimg1 forState:UIControlStateNormal];
    [rightBtn setImage:lrightimg2 forState:UIControlStateHighlighted];
    UIBarButtonItem * rbtn = [[UIBarButtonItem alloc ] initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rbtn];
    
    //其他内容
    
    UITextField * lb = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    lb.backgroundColor = [UIColor whiteColor];
    lb.text = @"输入";
    
    [self.view addSubview:lb];
    
    
}
-(void)popWindow:(id)sender forEvent:(UIEvent *) event
{
    RightPopViewController * rpvc = [[RightPopViewController alloc ]init];
    TSPopoverController *popoverController = [[TSPopoverController alloc] initWithContentViewController:rpvc];
    popoverController.popoverBaseColor = [UIColor lightGrayColor];
    [popoverController showPopoverWithTouch:event];

    
}

#pragma make -
#pragma make UIKeyboardViewControllerDelegate
-(void)alttextFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textField : %@" , textField.text);
}
-(void)alttextViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"textView: %@",textView.text);
}




@end
