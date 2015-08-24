//
//  TXWTableViewCell.h
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXWBusiness.h"
@interface TXWTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *businessIV;
@property (weak, nonatomic) IBOutlet UIImageView *gradeIV;
@property (weak, nonatomic) IBOutlet UILabel *businessName;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (nonatomic ,strong) TXWBusiness *model;
@end
