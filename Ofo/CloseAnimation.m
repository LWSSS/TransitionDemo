//
//  CloseAnimation.m
//  Ofo
//
//  Created by liuwei on 2017/7/8.
//  Copyright © 2017年 liuwei. All rights reserved.
//





#import "CloseAnimation.h"

@implementation CloseAnimation


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView * toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    toView.userInteractionEnabled = YES;
    
    UIView * fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    
    POPBasicAnimation * closeAni = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    closeAni.toValue = @(-fromView.layer.position.y);
    [closeAni setCompletionBlock:^(POPAnimation * anim, BOOL finish){
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation * scaleAni = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAni.springBounciness = 20;
    scaleAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    
    [fromView.layer pop_addAnimation:closeAni forKey:@"positionAnimation"];
    [fromView.layer pop_addAnimation:scaleAni forKey:@"scaleAnimation"];
    
}
@end
