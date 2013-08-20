//
//  CTTabBarButton.m
//  weibo
//
//  Created by 王 强 on 13-8-8.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "CTTabBarItem.h"

@implementation CTTabBarItem

@synthesize img,checkedimg,name,fontSize,viewController;
-(id)initWithName:(NSString *)aname aImg:(UIImage *)aimag checkedImg:(UIImage *)acheckedimg 
{
    if(self = [super init]){
        img = aimag;
        name = aname;
        fontSize = [UIFont systemFontOfSize:10.0f];
        checkedimg = acheckedimg;
        viewController = [[UIViewController  alloc] init];
        viewController.view.backgroundColor = [UIColor whiteColor];
        viewController.view.frame = CGRectMake(0, 0, 320, 416);
    }
    
    return self;
}
-(id)initWithName:(NSString *)aname aImg:(UIImage *)aimag checkedImg:(UIImage *)acheckedimg ViewController:(UIViewController *)aviewController
{
    if(self = [super init]){
        img = aimag;
        name = aname;
        fontSize = [UIFont systemFontOfSize:10.0f];
        checkedimg = acheckedimg;
        viewController = aviewController;
        viewController.view.frame = CGRectMake(0, 0, 320, 416);
    }
    
    return self;
}
-(void)setViewController:(UIViewController *)aviewController
{
    viewController = aviewController;
    viewController.view.frame = CGRectMake(0, 0, 320, 416);
}


@end
