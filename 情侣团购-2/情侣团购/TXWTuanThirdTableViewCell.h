//
//  TXWTuanThirdTableViewCell.h
//  情侣团购
//
//  Created by Mac on 14/11/15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXWDeal.h"
@interface TXWTuanThirdTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dealIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;// 团购标题
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;// 团购城市
@property (weak, nonatomic) IBOutlet UILabel *list_price;// 原价格
@property (weak, nonatomic) IBOutlet UILabel *current_price;// 团购价格
@property (weak, nonatomic) IBOutlet UILabel *purchase_count;// 售出数量

@property (nonatomic ,strong) TXWDeal *deal;
@end
