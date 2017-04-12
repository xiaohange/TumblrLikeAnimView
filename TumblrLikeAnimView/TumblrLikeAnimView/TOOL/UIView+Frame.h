//
//  UIView+Frame.h
//  Demo-WeChat
//
//  Created by Sun on 15/10/13.
//  Copyright (c) 2015年 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** uiview的左边界 */
@property(nonatomic,assign) CGFloat left;
/** uiview的右边界 */
@property(nonatomic,assign) CGFloat right;
/** uiview的上边界 */
@property(nonatomic,assign) CGFloat top;
/** uiview的下边界 */
@property(nonatomic,assign) CGFloat bottom;

@property(nonatomic,assign) CGFloat width;

@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat centerX;

@property(nonatomic,assign) CGFloat centerY;

@end
