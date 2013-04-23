//
//  UIView+PopupAnimation.h
//  animation
//
//  Created by Penny on 13-1-16.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
/*
 "popAndFlip" => "弹出浮层--翻转",
 "popAndFade" => "弹出浮层--渐变",
 "popAndFlipFromLeftSide" => "弹出浮层--从左侧翻转",
 "popAndFlipFromRightSide" => "弹出浮层--从右侧翻转",
 "popAndFlipFromTopSide" => "弹出浮层--从上方翻转",
 "popAndFlipFromBottomSide" => "弹出浮层--从下方翻转",
 "popAndMoveFromLeft" => "弹出浮层--从左侧滑出",
 "popAndMoveFromRight" => "弹出浮层--从右侧滑出",
 "popAndMoveFromTop" => "弹出浮层--从上方滑出",
 "popAndMoveFromBottom" => "弹出浮层--从下方滑出",
 */

typedef enum {
    popAndFlip = 0,
    popAndFade,
    popAndFlipFromLeftSide,
    popAndFlipFromRightSide,
    popAndFlipFromTopSide,
    popAndFlipFromBottomSide,
    popAndMoveFromLeft,
    popAndMoveFromRight,
    popAndMoveFromTop,
    popAndMoveFromBottom
} PopupAnimationType;

@interface UIView(PopupAnimation)

- (void)popupAnimation:(PopupAnimationType)type Duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;
- (void)dismissAnimation:(PopupAnimationType)type Duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;
@end
