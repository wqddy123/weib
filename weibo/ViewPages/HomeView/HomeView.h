//
//  HomeView.h
//  weibo
//
//  Created by 王 强 on 13-8-10.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "BaseViewPageController.h"
#import "RightPopViewController.h"
#import "UIKeyboardViewController.h"

@interface HomeView : BaseViewPageController<UIKeyboardViewControllerDelegate>
{
    UIKeyboardViewController *keyBoardController;
}

@property(nonatomic,retain) UIButton * leftBtn;
@property(nonatomic,retain) UIButton * rightBtn;
@property(nonatomic,retain) UIButton * titleButton;


@property(nonatomic,retain) UIPopoverController  * popover;

-(void)popWindow:(id)sender forEvent:(UIEvent *) event;


@end
