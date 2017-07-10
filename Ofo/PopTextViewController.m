//
//  PopTextViewController.m
//  Ofo
//
//  Created by liuwei on 2017/7/7.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PopTextViewController.h"
#import <Masonry.h>
#import <POP.h>
@interface PopTextViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField * mainTextField;
@property (nonatomic, strong) UIButton    * sendBtn;
@property (nonatomic, strong) UIButton    * likeBtn;

@property (nonatomic, strong) UITextField * passTextField;
@property (nonatomic, strong) UIButton    * loginBtn;
@end

@implementation PopTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickDismiss)];
    [self.view addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.mainTextField];
    [self.view addSubview:self.sendBtn];
    [self.view addSubview:self.likeBtn];
    
    
    [_mainTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(self.view.mas_width).offset(-30);
        make.height.mas_equalTo(40);
    }];
    
    [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_mainTextField.mas_bottom).offset(15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.mas_equalTo(_sendBtn);
    }];
}

-(void)clickDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onViewClick:(id)sender{
    if (sender == self.sendBtn) {
        
    }
    if (sender == self.likeBtn) {
        
    }
}

-(UITextField *)mainTextField{
    if (!_mainTextField) {
        _mainTextField = [[UITextField alloc] init];
        _mainTextField.placeholder = @"Input Message";
        _mainTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _mainTextField.layer.borderWidth = 1;
        _mainTextField.delegate = self;
    }
    return _mainTextField;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.layer.cornerRadius = 4;
        _sendBtn.hidden = YES;
        _sendBtn.backgroundColor = [UIColor lightGrayColor];
        [_sendBtn setTitle:@"send" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

-(UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _likeBtn.layer.cornerRadius = 4;
        _likeBtn.hidden= NO;
        _likeBtn.backgroundColor = [UIColor  lightGrayColor];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"QQ20170522-0.jpg"] forState:UIControlStateNormal];
        [_likeBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *comment;
    if(range.length == 0)
    {
        comment = [NSString stringWithFormat:@"%@%@", textField.text, string];
    }
    else
    {
        comment = [textField.text substringToIndex:textField.text.length - range.length];
    }
    
    if (comment.length == 0) {
        //Show like
        [self showlikeBtn];
    }
    else
    {
        //Show Send
        [self showSendBtn];
    }
    return YES;
}

-(void)showlikeBtn{
    if (self.likeBtn.hidden) {
        self.likeBtn.hidden = NO;
        self.sendBtn.hidden = YES;
        POPSpringAnimation * ani = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        ani.fromValue = @(M_PI / 4);
        ani.toValue = @(0);
        ani.springBounciness = 20;
        ani.velocity = @(10);
        [self.likeBtn.layer pop_addAnimation:ani forKey:@"likeAnimation"];
    }
}

-(void)showSendBtn{
    if (self.sendBtn.hidden) {
        self.likeBtn.hidden = YES;
        self.sendBtn.hidden = NO;
        POPSpringAnimation * ani = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        ani.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
        ani.springBounciness =  20;
        [self.sendBtn pop_addAnimation:ani forKey:@"sendAnimation"];
    }
}

-(UITextField *)passTextField{
    if (!_passTextField) {
        _passTextField = [[UITextField alloc] init];
        _passTextField.delegate = self;
        _passTextField.placeholder = @"Input Mseeage";
        _passTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _passTextField.layer.cornerRadius = 4;
    }
    return _passTextField;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.backgroundColor = [UIColor lightGrayColor];
        [_loginBtn setTitle:@"LOGIN" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
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
