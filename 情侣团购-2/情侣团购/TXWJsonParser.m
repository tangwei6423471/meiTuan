//
//  TXWJsonParser.m
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TXWJsonParser.h"
#import "TXWBusiness.h"
#import "TXWDeal.h"
@implementation TXWJsonParser
+ (NSArray *)parseBusinessByDic:(NSDictionary *)dic
{
    NSMutableArray *businesses = [NSMutableArray array];// 空数组
    NSArray *businessesArr = [dic objectForKey:@"businesses"];
    for (NSDictionary *dict in businessesArr)
    {
        TXWBusiness *model = [[TXWBusiness alloc]init];
        model.business_id = [[dict objectForKey:@"business_id"] integerValue];
        model.avg_price = [[dict objectForKey:@"avg_price"] floatValue] ;
        model.name = [dict objectForKey:@"name"];
        model.rating_s_img_url = [dict objectForKey:@"rating_s_img_url"];
        model.s_photo_url = [dict objectForKey:@"s_photo_url"];
        model.regions = [dict objectForKey:@"regions"];
        model.categories = [dict objectForKey:@"categories"];
        model.businessURL = [dict objectForKey:@"review_list_url"];
        model.avg_rating = [[dict objectForKey:@"avg_rating"] floatValue];
        [businesses addObject:model];

    }
    return businesses;
}

+ (NSArray *)parseDealsByDic:(NSDictionary *)dic
{
    NSMutableArray *deals = [NSMutableArray array];
    NSArray *dealsArr = [dic objectForKey:@"deals"];
    for (NSDictionary *dict in dealsArr)
    {
        TXWDeal *deal = [[TXWDeal alloc]init];
        deal.s_image_url = [dict objectForKey:@"s_image_url"];
        deal.title = [dict objectForKey:@"title"];
        deal.city = [dict objectForKey:@"city"];
        deal.current_price = [[dict objectForKey:@"current_price"] integerValue];
        deal.list_price = [[dict objectForKey:@"list_price"]integerValue];
        deal.purchase_count = [[dict objectForKey:@"purchase_count"]integerValue];
        deal.deal_url = [dict objectForKey:@"deal_url"];
        [deals addObject:deal];
    }
    return deals;
}
@end
