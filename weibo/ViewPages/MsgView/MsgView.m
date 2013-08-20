//
//  MsgView.m
//  weibo
//
//  Created by 王 强 on 13-8-10.
//  Copyright (c) 2013年 王 强. All rights reserved.
//

#import "MsgView.h"

@interface MsgView ()

@end

@implementation MsgView

@synthesize tv;
-(id)init
{
    if(self = [super init])
    {
        tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, baseVeiwSize.width,baseVeiwSize.height-90)style:UITableViewStylePlain];
        
        tv.delegate = self;
        tv.dataSource = self;
        
        [self.view addSubview:tv];
        
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0.0f, 0.0f-baseVeiwSize.height, baseVeiwSize.width, baseVeiwSize.height)];
        _refreshHeaderView.delegate = self;
        [tv addSubview:_refreshHeaderView];
         
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    
    UIImageView * v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"messagescenter_at.png"]];
    v.frame = CGRectMake(10, 5, 48.5f, 48.5f);
    UILabel * lb = [[UILabel alloc ]initWithFrame:CGRectZero];
    lb.text = @"提到我的";
    lb.textColor = [UIColor blackColor];
    lb.frame = CGRectMake(10.0f+48.5f+10.0f, 5.0f, 100, 48.5f);
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [cell addSubview:lb];
    [cell addSubview:v];
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 9) {
        
        
        CGRect footerRect = CGRectMake(0, 0, 320, 40);
        
        UILabel *tableFooter = [[UILabel alloc] initWithFrame:footerRect];
        tableFooter.textAlignment = UITextAlignmentCenter;
        
        tableFooter.textColor = [UIColor blueColor];
        
        tableFooter.backgroundColor = [self.tv backgroundColor];
        
        tableFooter.opaque = YES;
        
        tableFooter.font = [UIFont boldSystemFontOfSize:15];
        
        tableFooter.text = @"点击加载";
        
        self.tv.tableFooterView = tableFooter;
        
        if (true) {
            
            
        }else{
            self.tv.tableFooterView = nil;
            
        }
        
        
    }
    
}
-(void)ViewFrashData:(id)target Action:(SEL)action
{
    
    

    [self.tv setContentOffset:CGPointMake(0, -75) animated:YES];
    
    [self performSelector:@selector(doneManualRefresh) withObject:nil afterDelay:0.4];
    [target performSelector:action];
}

-(void)doneManualRefresh
{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:self.tv];
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:self.tv];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLable.text = @"消息";
    [self.btn setTitle:@"写私信" forState:UIControlStateNormal];
    
    
//    [self.view addSubview:_refreshTableHeaderView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
-(void)reloadTableViewDataSource
{
    _reloading = YES;
    //这里引用你加载数据的方法
}
-(void)doneLoadingTableViewData
{
    
    //  model should call this when its done loading
    
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tv];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];

}
#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

@end
