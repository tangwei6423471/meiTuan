//
//  TXWTuanTableViewController.m
//  情侣团购
//
//  Created by Mac on 14/11/15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TXWTuanTableViewController.h"
#import "TXWTuanFirstTableViewCell.h"
#import "TXWTuanSecondTableViewCell.h"
#import "TXWTuanThirdTableViewCell.h"
#import "TXWDeal.h"
#import "TXWJsonParser.h"
#import "TXWClassTableViewController.h"
@interface TXWTuanTableViewController ()

// 接受数据的数组
@property (nonatomic ,strong) NSArray *movieTuans;
@end

@implementation TXWTuanTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置tabbar点击的颜色
     [self.tabBarController.tabBar setSelectedImageTintColor:[UIColor colorWithRed:95/255.0f green:207/255.0f blue:182/255.0f alpha:1.0]];
    
    // 获取数据
    DPAPI *api = [[DPAPI alloc]init];
    [api requestWithURL:@"v1/deal/find_deals" paramsString:@"city=成都&limit=40&page=1" delegate:self];
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    self.movieTuans = [TXWJsonParser parseDealsByDic:result];
    // 得到数据源 刷新界面
    [self.tableView reloadData];
    NSLog(@"========%@",self.movieTuans);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 团购分类按钮
- (IBAction)classTuan:(UIButton *)sender
{

    if(sender.tag)
        [self performSegueWithIdentifier:@"classTV1"sender:sender];
    if(sender.tag == 1)
        [self performSegueWithIdentifier:@"classTV2"sender:sender];
    if(sender.tag == 2)
        [self performSegueWithIdentifier:@"classTV3"sender:sender];
    if(sender.tag == 3)
        [self performSegueWithIdentifier:@"classTV4"sender:sender];
    if(sender.tag == 4)
        [self performSegueWithIdentifier:@"classTV5"sender:sender];
    if(sender.tag == 5)
        [self performSegueWithIdentifier:@"classTV6"sender:sender];
    if(sender.tag == 6)
        [self performSegueWithIdentifier:@"classTV7"sender:sender];
    if(sender.tag == 7)
        [self performSegueWithIdentifier:@"classTV8"sender:sender];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }

    else if(section==1)
    {
        return 1;
    }
    else
    {
        return self.movieTuans.count;
        //return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        TXWTuanFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellone" forIndexPath:indexPath];
        return cell;
    }
    else if(indexPath.section==1)
    {
        TXWTuanSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celltwo" forIndexPath:indexPath];
        return cell;
    }
    else
    {
        TXWTuanThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellthree" forIndexPath:indexPath];
        TXWDeal *deal = self.movieTuans[indexPath.row];
        cell.deal = deal;


        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==2)
    {
        TXWDeal *deal = self.movieTuans[indexPath.row];
        // 创建空页面
        UIViewController *vc =[[UIViewController alloc]init];
        // 跳过去把tabbar隐藏掉
        vc.hidesBottomBarWhenPushed = YES;
        // 创建webView控件
        UIWebView *wv = [[UIWebView alloc]initWithFrame:vc.view.bounds];
        NSString *path = deal.deal_url;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
        [wv loadRequest:request];
        [vc.view addSubview:wv];
        // 让加载的网页不显示导航条，但不能去掉哈
        [wv.scrollView setContentInset:UIEdgeInsetsMake(-46, 0, 0, 0)];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

// 距离上面的高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 2.0;
}

// 分区距离????meiyong
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    return 100.0;
}

// 分区直接的间隔
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 4;
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 134.0;
    }
    if (indexPath.section==1)
    {
        return 100.0;
    }
    else
        return 79.0;
    
}

// segue传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TXWClassTableViewController *ctv = segue.destinationViewController;
    // 接受一下，不能直接用sender
    UIButton *btn = sender;
    if (btn.tag == 0)
        ctv.classInfo = @"美食";
    if (btn.tag == 1)
        ctv.classInfo = @"电影";
    if (btn.tag == 2)
        ctv.classInfo = @"酒店";
    if (btn.tag == 3)
        ctv.classInfo = @"休闲娱乐";
    if (btn.tag == 4)
        ctv.classInfo = @"旅游";
    if (btn.tag == 5)
        ctv.classInfo = @"丽人";
    if (btn.tag == 6)
        ctv.classInfo = @"生活服务";
    if (btn.tag == 7)
        ctv.classInfo = @"购物";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
