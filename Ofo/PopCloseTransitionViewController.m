//
//  PopCloseTransitionViewController.m
//  Ofo
//
//  Created by liuwei on 2017/7/8.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PopCloseTransitionViewController.h"

@interface PopCloseTransitionViewController ()
@property (nonatomic, strong) UIButton * dismissBtn;
@end

@implementation PopCloseTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.view.layer.cornerRadius = 8.f;
    
    [self.view addSubview:self.dismissBtn];
    [_dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    // Do any additional setup after loading the view.
}

-(void)onViewClick:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark getter
-(UIButton *)dismissBtn{
    if (!_dismissBtn) {
        _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dismissBtn setTitle:@"dismiss" forState:UIControlStateNormal];
        [_dismissBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _dismissBtn.layer.borderWidth = 1;
        _dismissBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _dismissBtn.backgroundColor = [UIColor lightGrayColor];
        [_dismissBtn addTarget: self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissBtn;
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
