//
//  TXWJsonParser.h
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXWJsonParser : NSObject
+ (NSArray *)parseBusinessByDic:(NSDictionary *)dic;
+ (NSArray *)parseDealsByDic:(NSDictionary *)dic;
@end
