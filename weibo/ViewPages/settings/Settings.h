//
//  Settings.h
//  weibo
//
//  Created by 王 强 on 13-8-9.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewPageController.h"

@interface Settings : BaseViewPageController<UITableViewDataSource>
{
}

@property (nonatomic,retain) UITableView * tv;


@end
