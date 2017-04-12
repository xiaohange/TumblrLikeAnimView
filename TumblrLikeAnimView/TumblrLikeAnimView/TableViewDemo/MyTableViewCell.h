//
//  MyTableViewCell.h

//
//  Created by 韩俊强 on 2017/4/11.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) void (^LoveButtonClick)();

@property (nonatomic, strong) UIButton *praiseBtn;

@property (nonatomic, strong) UIButton *coverBtn;

@property (nonatomic, strong) UIImageView *cancelPraiseImg;

@property (nonatomic, strong) id objc;

@end
