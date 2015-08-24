//
//  TXWTuanThirdTableViewCell.m
//  情侣团购
//
//  Created by Mac on 14/11/15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TXWTuanThirdTableViewCell.h"

@implementation TXWTuanThirdTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.current_price.text = [NSString stringWithFormat:@"%.1lf",self.deal.current_price];
    self.titleLabel.text = self.deal.title;
    self.cityLabel.text = self.deal.city;
    // 中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.1lf",self.deal.list_price] attributes:attribtDic];
    self.list_price.attributedText = attribtStr;
    
    self.purchase_count.text = [NSString stringWithFormat:@"%ld",(long)self.deal.purchase_count];
    // 图片多线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.deal.s_image_url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dealIV.image = [UIImage imageWithData:data];
            [self.dealIV setNeedsLayout];
        });
        
    });
}



@end



