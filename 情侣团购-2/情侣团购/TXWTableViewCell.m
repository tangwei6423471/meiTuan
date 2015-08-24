//
//  TXWTableViewCell.m
//  情侣团购
//
//  Created by Tarena on 14-11-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TXWTableViewCell.h"

@implementation TXWTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.businessName.text = self.model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"%ld",self.model.avg_price];
    self.areaLabel.text = [self.model.regions lastObject];
    self.classLabel.text = [self.model.categories lastObject];
    // 图片多线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.s_photo_url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.businessIV.image = [UIImage imageWithData:data];
            [self.businessIV setNeedsLayout];
        });
        
    });
    // 假数据
    self.gradeIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"16_%dstar",arc4random()%3+3]];
    //[self.gradeIV setNeedsDisplay];

        

}

@end
