//
//  MyTableViewCell.m

//
//  Created by 韩俊强 on 2017/4/11.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIView+Frame.h"

#define KPraiseBtnWH 30
#define KToBrokenHeartWH    120/195

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.praiseBtn];
        [self.contentView addSubview:self.coverBtn];
        [self.contentView insertSubview:self.coverBtn belowSubview:self.praiseBtn];
        [self.contentView addSubview:self.cancelPraiseImg];        
        [self.praiseBtn addTarget:self action:@selector(loveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)loveBtnAction:(UIButton *)sender
{
    if (self.LoveButtonClick) {
        self.LoveButtonClick();
    }
}

- (void)setObjc:(id)objc
{
   
}

- (UIButton*)praiseBtn
{
    if (!_praiseBtn) {
        _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _praiseBtn.frame = CGRectMake(100, 60, KPraiseBtnWH, KPraiseBtnWH);
        [_praiseBtn setImage:[UIImage imageNamed:@"icon_like"] forState:UIControlStateNormal];
        [_praiseBtn setImage:[UIImage imageNamed:@"icon_likeon"] forState:UIControlStateSelected];
    }
    return _praiseBtn;
}

- (UIButton*)coverBtn
{
    if (!_coverBtn) {
        _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _coverBtn.frame = _praiseBtn.frame;
        _coverBtn.alpha = 0;
        [_coverBtn setImage:[UIImage imageNamed:@"big"] forState:UIControlStateSelected];
        [_coverBtn setImage:[UIImage imageNamed:@"big"] forState:UIControlStateNormal];
        
        _cancelPraiseImg = [[UIImageView alloc]initWithFrame:CGRectMake(self.praiseBtn.frame.origin.x-15, self.praiseBtn.frame.origin.y-40, KPraiseBtnWH*1.5, KPraiseBtnWH*1.5*KToBrokenHeartWH)];
        _cancelPraiseImg.hidden = YES;
        _cancelPraiseImg.centerX = _praiseBtn.centerX;
    }
    return _coverBtn;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
