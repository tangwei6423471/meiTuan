//
//  TXWTableViewController.m
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TXWTableViewController.h"
#import "TXWBusiness.h"
#import "TXWJsonParser.h"
#import "TXWTableViewCell.h"
@interface TXWTableViewController ()
// 接收解析的数据
@property (nonatomic,strong) NSArray *business;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@end

@implementation TXWTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置segment字体颜色
     NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"AppleGothic"size:14],NSFontAttributeName ,nil];
     [self.segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    DPAPI *api = [[DPAPI alloc]init];
    // 发出请求 主地址不用写
    [api requestWithURL:@"v1/business/find_businesses" paramsString:@"city=成都&sort=2&limit=40" delegate:self];

}

- (IBAction)segmengChanged:(UISegmentedControl *)sender
{
    DPAPI *api = [[DPAPI alloc]init];
    if(self.segment.selectedSegmentIndex==0)
    {
        [api requestWithURL:@"v1/business/find_businesses" paramsString:@"city=成都&sort=2&limit=40" delegate:self];
    }
    else
    {
        [api requestWithURL:@"v1/business/find_businesses" paramsString:@"city=成都&has_deal=1&sort=2&limit=40" delegate:self];
    }
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    self.business = [TXWJsonParser parseBusinessByDic:result];
    // 得到数据源 刷新界面
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.business.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TXWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    TXWBusiness *model = self.business[indexPath.row];
    
    //控制自定义Cell显示的代码不能写在Controller
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TXWBusiness *model = self.business[indexPath.row];
    // 创建一个空页面
    UIViewController *vc = [[UIViewController alloc]init];
    // 跳转过去吧bar隐藏掉
    vc.hidesBottomBarWhenPushed = YES;
    // 创建一个webview空间
    //创建一个显示网页的控件
    UIWebView *wv = [[UIWebView alloc]initWithFrame:vc.view.bounds];
    NSString *path = model.businessURL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    [wv loadRequest:request];
    [vc.view addSubview:wv];
    // 让加载的网页不显示导航条，但不能去掉哈
    [wv.scrollView setContentInset:UIEdgeInsetsMake(-46, 0, 0, 0)];
    //    跳转页面
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
