//
//  ViewController.m
//  Test_ofo
//
//  Created by liuwei on 2017/6/30.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import <POP.h>
#import "PreviousViewController.h"
#import "PopViewController.h"

#define screenWidth [[UIScreen mainScreen]bounds].size.width
#define screenHeight [[UIScreen mainScreen]bounds].size.height
@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIButton * opacityBtn;
@property (nonatomic, strong) UIButton * scaleBtn;
@property (nonatomic, strong) UIButton * rotateBtn;
@property (nonatomic, strong) UIButton * changeBackBtn;
@property (nonatomic, strong) UIButton * addKeyAnimationBtn;
@property (nonatomic, strong) UIButton * bezierBtn;
@property (nonatomic, strong) UIView * rollView;

@property (nonatomic, strong) UIButton * previousBtn;

@property (nonatomic, strong) UIButton * pushBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.rollView];
    
    //opacity
    //    [self addOpacity];
}

-(void)viewDidLayoutSubviews{
    [self.view addSubview:self.rollView];
    [self.view addSubview:self.opacityBtn];
    [self.view addSubview:self.scaleBtn];
    [self.view addSubview:self.rotateBtn];
    [self.view addSubview:self.changeBackBtn];
    [self.view addSubview:self.addKeyAnimationBtn];
    [self.view addSubview:self.bezierBtn];
    [self.view addSubview:self.pushBtn];
    [self.view addSubview:self.previousBtn];
    
    [_rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(80);
        make.width.height.mas_equalTo(80);
    }];
    
    [_opacityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_rollView.mas_bottom).offset(15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [_scaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_opacityBtn.mas_bottom).mas_equalTo(15);
        make.width.height.mas_equalTo(_opacityBtn);
    }];
    
    [_rotateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_scaleBtn.mas_bottom).offset(15);
        make.width.height.mas_equalTo(_opacityBtn);
    }];
    
    [_changeBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_rotateBtn.mas_bottom).offset(15);
        make.width.height.mas_equalTo(_opacityBtn);
    }];
    
    [_addKeyAnimationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_changeBackBtn.mas_bottom).offset(15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [_bezierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_addKeyAnimationBtn.mas_bottom).offset(15);
        make.width.height.mas_equalTo(_addKeyAnimationBtn);
    }];
    
    [_pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.height.mas_equalTo(_opacityBtn);
    }];
    
    [_previousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(_pushBtn.mas_top).offset(-15);
        make.width.height.mas_equalTo(_pushBtn);
    }];
}


-(void)onViewClick:(id)sender{
    if (sender == self.opacityBtn) {
        [self addOpacity];
    }
    if (sender == self.scaleBtn) {
        [self addScaleAnimation];
    }
    if (sender == self.rotateBtn) {
        [self addRotateAnimation];
    }
    if (sender == self.changeBackBtn) {
        [self changeBackAnimation];
    }
    if (sender == self.addKeyAnimationBtn) {
        [self keyAnimation];
    }
    if (sender == _bezierBtn) {
        [self pathAnimation];
    }
    if (sender == self.pushBtn) {
        PopViewController * popvc = [[PopViewController alloc] init];
        popvc.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:popvc animated:YES completion:nil];
    }
    if (sender == self.previousBtn) {
        PreviousViewController * vc = [[PreviousViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark addAnimation

-(void)addOpacity{
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
    ani.fromValue = [NSNumber numberWithFloat:1.0f];
    ani.fromValue = [NSNumber numberWithFloat:0.2f];
    ani.duration = 2.0f;
    [self.rollView.layer addAnimation:ani forKey:@"opacityAnimation"];
}

// scale animation
-(void)addScaleAnimation{
    CABasicAnimation * scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.toValue = [NSNumber numberWithFloat:2.0f];
    scaleAni.duration = 1.0f;
    [self.rollView.layer addAnimation:scaleAni forKey:@"scaleAnimation"];
}

// rotate animatiomn
-(void)addRotateAnimation{
    CABasicAnimation * rotateAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAni.toValue = [NSNumber numberWithFloat:2*M_PI];
    rotateAni.duration = 1;
    [self.rollView.layer addAnimation:rotateAni forKey:@"rotateAnimation"];
}

//changeBackground animation
-(void)changeBackAnimation{
    CABasicAnimation * changeAni = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    changeAni.toValue = (id) [UIColor greenColor].CGColor;
    changeAni.duration = 1.0f;
    [self.rollView.layer addAnimation:changeAni forKey:@"backgroundAnimation"];
}

// add keyAnimation
-(void)keyAnimation{
    CAKeyframeAnimation * keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue * value0 = [NSValue valueWithCGPoint:CGPointMake(0, screenHeight / 2 - 50)];
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(screenWidth / 3, screenHeight / 2 - 50)];
    NSValue * value2 = [NSValue valueWithCGPoint:CGPointMake(screenWidth / 3, screenHeight / 2 + 50)];
    NSValue * value3 = [NSValue valueWithCGPoint:CGPointMake(screenWidth / 2, screenHeight / 2 + 50)];
    NSValue * value4 = [NSValue valueWithCGPoint:CGPointMake(screenWidth / 2, screenHeight / 2 - 50)];
    NSValue * value5 = [NSValue valueWithCGPoint:CGPointMake(screenWidth - 80, screenHeight / 2 - 50)];
    keyAni.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    keyAni.duration = 2.0f;
    keyAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    keyAni.delegate = self;
    [self.rollView.layer addAnimation:keyAni forKey:@"keyFrameAnimation"];
}

-(void)pathAnimation{
    CAKeyframeAnimation * pathAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(screenWidth / 2 -100, screenHeight / 2 - 100, 200, 200)];
    pathAni.path = path.CGPath;
    pathAni.duration = 2.0f;
    [self.rollView.layer addAnimation:pathAni forKey:@"pathAnimation"];
}

#pragma mark getter
-(UIView *)rollView{
    if (!_rollView) {
        _rollView = [[UIView alloc] init];
        _rollView.backgroundColor = [UIColor redColor];
    }
    return _rollView;
}

-(UIButton *)opacityBtn{
    if (!_opacityBtn) {
        _opacityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _opacityBtn.layer.cornerRadius = 4;
        _opacityBtn.clipsToBounds = YES;
        _opacityBtn.backgroundColor = [UIColor lightGrayColor];
        [_opacityBtn setTitle:@"opacity" forState:UIControlStateNormal];
        [_opacityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_opacityBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _opacityBtn;
}

-(UIButton *)scaleBtn{
    if (!_scaleBtn) {
        _scaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scaleBtn.layer.cornerRadius = 4;
        _scaleBtn.clipsToBounds = YES;
        _scaleBtn.backgroundColor = [UIColor lightGrayColor];
        [_scaleBtn setTitle:@"scale" forState:UIControlStateNormal];
        [_scaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_scaleBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scaleBtn;
}

-(UIButton *)rotateBtn{
    if (!_rotateBtn) {
        _rotateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rotateBtn.layer.cornerRadius = 4;
        _rotateBtn.clipsToBounds = YES;
        _rotateBtn.backgroundColor = [UIColor lightGrayColor];
        [_rotateBtn setTitle:@"rotate" forState:UIControlStateNormal];
        [_rotateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rotateBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rotateBtn;
}

-(UIButton *)changeBackBtn{
    if (!_changeBackBtn) {
        _changeBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBackBtn.layer.cornerRadius = 4;
        _changeBackBtn.clipsToBounds = YES;
        _changeBackBtn.backgroundColor = [UIColor lightGrayColor];
        [_changeBackBtn setTitle:@"change" forState:UIControlStateNormal];
        [_changeBackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_changeBackBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBackBtn;
}

-(UIButton *)addKeyAnimationBtn{
    if (!_addKeyAnimationBtn) {
        _addKeyAnimationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addKeyAnimationBtn.layer.cornerRadius = 4;
        _addKeyAnimationBtn.clipsToBounds = YES;
        _addKeyAnimationBtn.backgroundColor = [UIColor lightGrayColor];
        [_addKeyAnimationBtn setTitle:@"keyAnimation" forState:UIControlStateNormal];
        [_addKeyAnimationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addKeyAnimationBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addKeyAnimationBtn;
}

-(UIButton *)bezierBtn{
    if (!_bezierBtn) {
        _bezierBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bezierBtn.layer.cornerRadius = 4;
        _bezierBtn.clipsToBounds = YES;
        _bezierBtn.backgroundColor = [UIColor lightGrayColor];
        [_bezierBtn setTitle:@"bezierPath" forState:UIControlStateNormal];
        [_bezierBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_bezierBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bezierBtn;
}

-(UIButton *)pushBtn{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushBtn.layer.cornerRadius = 4;
        _pushBtn.clipsToBounds = YES;
        _pushBtn.backgroundColor = [UIColor lightGrayColor];
        [_pushBtn setTitle:@"push" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pushBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}


-(UIButton *)previousBtn{
    if (!_previousBtn) {
        _previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_previousBtn setTitle:@"Previous" forState:UIControlStateNormal];
        [_previousBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _previousBtn.backgroundColor = [UIColor cyanColor];
        [_previousBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _previousBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
