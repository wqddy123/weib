//
//  MsgView.h
//  weibo
//
//  Created by 王 强 on 13-8-10.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "BaseViewPageController.h"
#import "EGORefreshTableHeaderView.h"

@interface MsgView : BaseViewPageController<UITableViewDataSource
        ,UITableViewDelegate,EGORefreshTableHeaderDelegate
         >
{
    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL _reloading;
}


@property(nonatomic,retain)UITableView * tv;


- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
-(void) ViewFrashData:(id) target Action:(SEL) action;
@end
