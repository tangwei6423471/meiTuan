//
//  TXWDeal.h
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXWDeal : NSObject

@property (nonatomic ,copy)NSString *deal_id; // 团购单ID
@property (nonatomic ,assign) float list_price; //团购包含商品原价值
@property (nonatomic ,copy)NSString *title;	//团购标题
//@property (nonatomic ,copy)NSString *description;	//团购描述
@property (nonatomic ,copy)NSString *city;	//城市名称，city为＂全国＂表示全国单，其他为本地单，城市范围见相关API返回结果
@property (nonatomic ,assign) float current_price;	//团购价格
@property (nonatomic ,strong) NSArray *regions;	//团购适用商户所在行政区
@property (nonatomic ,strong) NSArray *categories;	//团购所属分类
@property (nonatomic ,assign) NSInteger purchase_count;	//团购当前已购买数
@property (nonatomic ,copy)NSString *publish_date;	//团购发布上线日期
@property (nonatomic ,copy)NSString *purchase_deadline;	//团购单的截止购买日期
@property (nonatomic ,assign) NSInteger distance;	//团购单所适用商户中距离参数坐标点最近的一家与坐标点的距离，单位为米；如不传入经纬度坐标，结果为-1；如团购单无关联商户，结果为MAXINT
@property (nonatomic ,copy)NSString *image_url;	//团购图片链接，最大图片尺寸450×280
@property (nonatomic ,copy)NSString *s_image_url;	//小尺寸团购图片链接，最大图片尺寸160×100
@property (nonatomic ,copy)NSString *deal_url;	//团购Web页面链接，适用于网页应用
@property (nonatomic ,copy)NSString *deal_h5_url;	//团购HTML5页面链接，适用于移动应用和联网车载应用
@property (nonatomic ,assign) float commission_ratio;//当前团单的佣金比例
@property (nonatomic ,strong) NSArray *businesses;//团购所适用的商户列表
//businesses.name;	//商户名
//businesses.id;//商户ID
//businesses.url;//商户页链接
@end


/*

获取指定城市当前在线的全部团购ID列表 请求URL：http://api.dianping.com/v1/deal/get_all_id_list?city=上海&appkey=[appkey]&sign=[signature]
获取指定城市每日新增团购ID列表 http://api.dianping.com/v1/deal/get_daily_new_id_list?city=上海&date=2013-04-10&appkey=[appkey]&sign=[signature]
根据团购ID获取指定团购单的详细信息 http://api.dianping.com/v1/deal/get_single_deal?deal_id=1-5097286&appkey=[appkey]&sign=[signature]
*/