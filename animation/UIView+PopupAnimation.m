//
//  UIView+PopupAnimation.m
//  animation
//
//  Created by Penny on 13-1-16.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import "UIView+PopupAnimation.h"

@implementation UIView(PopupAnimation)

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


- (void)popupAnimation:(PopupAnimationType)type Duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
    switch (type) {
        case popAndFlip: {
            [CATransaction begin];
            [CATransaction setDisableActions: YES];
            [self.layer setBackgroundColor: [UIColor blackColor].CGColor];
            CATransform3D trans3D = CATransform3DIdentity;
            trans3D.m34 = - 1.0 / 1000;
            trans3D = CATransform3DRotate(trans3D, M_PI / 2, 0, -1, 0);
            self.layer.transform = trans3D;
            [CATransaction commit];
            
            //self.alpha = 0.0f;
            self.layer.opacity = 1.0;
            
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                CATransform3D trans3D = CATransform3DIdentity;
                trans3D.m34 = - 1.0 / 1000;
                trans3D = CATransform3DRotate(trans3D, 0, 0, 1, 0);
                self.layer.transform = trans3D;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFade: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0;
                self.alpha = 1.0f;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFlipFromLeftSide:
            self.layer.anchorPoint = CGPointMake(0, .5);
            self.layer.position = CGPointMake(self.frame.origin.x - (self.frame.size.width * .5), self.frame.origin.y + self.frame.size.height * self.layer.anchorPoint.y);
            [CATransaction setDisableActions: YES];
            
            [CATransaction begin];
            [CATransaction setDisableActions: YES];
            CATransform3D trans3D = CATransform3DIdentity;
            trans3D.m34 = - 1.0 / 1000;
            trans3D = CATransform3DRotate(trans3D, M_PI / 2, 0, -1, 0);
            self.layer.transform = trans3D;
            [CATransaction commit];
            
            [CATransaction setDisableActions: NO];
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                
                CATransform3D trans3D = CATransform3DIdentity;
                trans3D.m34 = - 1.0 / 1000;
                trans3D = CATransform3DRotate(trans3D, 0, 0, 1, 0);
                self.layer.transform = trans3D;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
            break;
        case popAndFlipFromRightSide: {
            self.layer.anchorPoint = CGPointMake(1, .5);
            self.layer.position = CGPointMake(self.frame.origin.x + self.frame.size.width * 3 / 2, self.frame.origin.y + self.frame.size.height * self.layer.anchorPoint.y);
            
            [CATransaction begin];
            [CATransaction setDisableActions: YES];
            CATransform3D trans3D = CATransform3DIdentity;
            trans3D.m34 = - 1.0 / 1000;
            trans3D = CATransform3DRotate(trans3D, M_PI / 2, 0, -1, 0);
            self.layer.transform = trans3D;
            [CATransaction commit];
            
            [CATransaction setDisableActions: NO];
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                CATransform3D trans3D = CATransform3DIdentity;
                trans3D.m34 = - 1.0 / 1000;
                trans3D = CATransform3DRotate(trans3D, 0, 0, 1, 0);
                self.layer.transform = trans3D;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndFlipFromTopSide: {
            self.layer.anchorPoint = CGPointMake(.5, 0);
            self.layer.position = CGPointMake(self.center.x, self.frame.origin.y - self.frame.size.height * .5);
            
            [CATransaction begin];
            [CATransaction setDisableActions: YES];
            CATransform3D trans3D = CATransform3DIdentity;
            trans3D.m34 = - 1.0 / 1000;
            trans3D = CATransform3DRotate(trans3D, M_PI / 2, 1, 0, 0);
            self.layer.transform = trans3D;
            [CATransaction commit];
            
            [CATransaction setDisableActions: NO];
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                CATransform3D trans3D = CATransform3DIdentity;
                trans3D.m34 = - 1.0 / 1000;
                trans3D = CATransform3DRotate(trans3D, 0, 0, 1, 0);
                self.layer.transform = trans3D;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFlipFromBottomSide: {
            self.layer.anchorPoint = CGPointMake(.5, 1);
            self.layer.position = CGPointMake(self.center.x, self.frame.origin.y + self.frame.size.height * 3 / 2);
            
            [CATransaction begin];
            [CATransaction setDisableActions: YES];
            CATransform3D trans3D = CATransform3DIdentity;
            trans3D.m34 = - 1.0 / 1000;
            trans3D = CATransform3DRotate(trans3D, M_PI / 2, 1, 0, 0);
            self.layer.transform = trans3D;
            [CATransaction commit];
        
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                CATransform3D trans3D = CATransform3DIdentity;
                trans3D.m34 = - 1.0 / 1000;
                trans3D = CATransform3DRotate(trans3D, 0, 0, 1, 0);
                self.layer.transform = trans3D;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromLeft: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                self.alpha = 1.0f;
                CGRect newFrame = CGRectMake(-self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                CGRect frame = self.frame;
                self.frame = newFrame;
                self.frame = frame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromRight: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                self.alpha = 1.0f;
                CGRect frame = self.frame;
                CGRect newFrame = CGRectMake(self.superview.frame.size.width + self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
                self.frame = frame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromTop: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                self.alpha = 1.0f;
                CGRect frame = self.frame;
                CGRect newFrame = CGRectMake(self.frame.origin.x, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
                self.frame = frame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndMoveFromBottom: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                self.alpha = 1.0f;
                CGRect frame = self.frame;
                CGRect newFrame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height + self.frame.size.width, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
                self.frame = frame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)dismissAnimation:(PopupAnimationType)type Duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
    switch (type) {
        case popAndFlip: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.layer.transform = CATransform3DMakeRotation(-M_PI / 2 , 0, -1, 0);
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFade: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFlipFromLeftSide:
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.layer.transform = CATransform3DMakeRotation(-M_PI / 2, 0, -1, 0);
            } completion:^(BOOL finished) {
                completion(finished);
            }];
            break;
        case popAndFlipFromRightSide: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.layer.transform = CATransform3DMakeRotation(-M_PI / 2, 0, -1, 0);
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndFlipFromTopSide: {
            [CATransaction setDisableActions: NO];
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.layer.transform = CATransform3DMakeRotation(-M_PI / 2, -1, 0, 0);;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndFlipFromBottomSide: {
            [CATransaction setDisableActions: NO];
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.layer.transform = CATransform3DMakeRotation(-M_PI / 2, 1, 0, 0);
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromLeft: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                CGRect newFrame = CGRectMake(-self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromRight: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                CGRect newFrame = CGRectMake(self.superview.frame.size.width + self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            
            break;
        case popAndMoveFromTop: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                CGRect newFrame = CGRectMake(self.frame.origin.x, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        case popAndMoveFromBottom: {
            [UIView animateWithDuration: duration delay: 0.1f options: UIViewAnimationCurveEaseInOut animations:^{
                self.alpha = 0.0f;
                CGRect newFrame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height + self.frame.size.width, self.frame.size.width, self.frame.size.height);
                self.frame = newFrame;
            } completion:^(BOOL finished) {
                completion(finished);
            }];
        }
            break;
        default:
            break;
    }
}
@end
