//
//  TXWDetail.h
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXWDetail : NSObject

@end

/**
 *
 deal_id	 string	 团购单ID
 title	 string	 团购标题
 description	 string	 团购描述
 city	 string	 城市名称，city为＂全国＂表示全国单，其他为本地单，城市范围见相关API返回结果
 list_price	 float	 团购包含商品原价值
 current_price	 float	 团购价格
 regions	 list	 团购适用商户所在商区
 categories	 list	 团购所属分类
 purchase_count	 int	 团购当前已购买数
 publish_date	 string	 团购发布上线日期
 details	 string	 团购详情
 purchase_deadline	 string	 团购单的截止购买日期
 image_url	 string	 团购图片链接，最大图片尺寸450×280
 s_image_url	 string	 小尺寸团购图片链接，最大图片尺寸160×100
 more_image_urls	 list	 更多大尺寸图片
 more_s_image_urls	 list	 更多小尺寸图片
 is_popular	 int	 是否为热门团购，0：不是，1：是
 restrictions	 list	 团购限制条件
 restrictions.is_reservation_required	 int	 是否需要预约，0：不是，1：是
 restrictions.is_refundable	 int	 是否支持随时退款，0：不是，1：是
 restrictions.special_tips	 string	 附加信息(一般为团购信息的特别提示)
 notice	 string	 重要通知(一般为团购信息的临时变更)
 deal_url	 string	 团购Web页面链接，适用于网页应用
 deal_h5_url	 string	 团购HTML5页面链接，适用于移动应用和联网车载应用
 commission_ratio	 float	 当前团单的佣金比例
 businesses	 list	 团购所适用的商户列表
 businesses.name	 string	 商户名
 businesses.id	 int	 商户ID
 businesses.address	 string	 商户地址
 businesses.latitude	 float	 商户纬度
 businesses.longitude	 float	 商户经度
 businesses.url	 string	 商户页链接
 */