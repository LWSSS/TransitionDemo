//
//  PresentingAnimation.m
//  Ofo
//
//  Created by liuwei on 2017/7/8.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PresentingAnimation.h"

@interface PresentingAnimation()

@end

@implementation PresentingAnimation


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView * fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
//    fromView.userInteractionEnabled = NO;
    
    UIView * toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView.bounds) - 100.f, CGRectGetHeight(transitionContext.containerView.bounds) - 280.f);
    
    CGPoint p = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    toView.center = p;
    
    [transitionContext.containerView addSubview:toView];
    POPSpringAnimation * positionAni = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAni.toValue = @(transitionContext.containerView.center.y);
    positionAni.springBounciness = 10;
    [positionAni setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation * scaleAni = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAni.springBounciness = 20;
    scaleAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    
    [toView.layer pop_addAnimation:positionAni forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAni forKey:@"scaleAnimation"];
    
}
@end
