//
//  PopTransitionViewController.m
//  Ofo
//
//  Created by liuwei on 2017/7/8.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PopTransitionViewController.h"
#import "PopCloseTransitionViewController.h"
#import "PresentingAnimation.h"
#import "CloseAnimation.h"
@interface PopTransitionViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIButton * presentBtn;
@end

@implementation PopTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.presentBtn];
    [_presentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
}

-(void)onViewClick:(id)sender{
    PopCloseTransitionViewController * vc = [[PopCloseTransitionViewController alloc] init];
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle =  UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark getter
-(UIButton *)presentBtn{
    if (!_presentBtn) {
        _presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_presentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_presentBtn setTitle:@"PRESENT" forState:UIControlStateNormal];
        _presentBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _presentBtn.backgroundColor = [UIColor lightGrayColor];
        [_presentBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentBtn;
}

#pragma mark UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[PresentingAnimation alloc] init];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[CloseAnimation alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
