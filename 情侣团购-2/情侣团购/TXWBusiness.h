//
//  TXWBusiness.h
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXWBusiness : NSObject
@property(nonatomic,assign)float latitude;
@property(nonatomic,assign)float longitude;

@property (nonatomic,copy)NSString *businessImageURL;
@property (nonatomic,copy)NSString *businessRateImageURL;
@property (nonatomic,copy)NSString *businessURL;
@property (nonatomic,copy)NSNumber *distance;

@property(nonatomic,assign)NSInteger business_id;
@property(nonatomic,assign)NSInteger avg_price;     //人均价格

@property(nonatomic,retain)NSString *name;              //商户名称
@property(nonatomic,retain)NSString *rating_s_img_url;  //评分图片
@property(nonatomic,retain)NSString *s_photo_url;       //商户图片

@property(nonatomic,retain)NSMutableArray *regions;     //地区
@property(nonatomic,retain)NSMutableArray *categories;  //分类
@property(nonatomic,assign)float avg_rating;// 商户评分
@property (nonatomic) float rating;
@end
