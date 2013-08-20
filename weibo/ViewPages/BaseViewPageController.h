//
//  BaseViewPageController.h
//  weibo
//
//  Created by 王 强 on 13-8-12.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewPageController : UIViewController
{
    CGSize  baseVeiwSize;

}
@property (nonatomic,retain)UILabel *titleLable;
@property (nonatomic,retain)UIButton *btn;

-(id)init;
@end
