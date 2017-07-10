//
//  PreviousViewController.m
//  Ofo
//
//  Created by liuwei on 2017/7/8.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PreviousViewController.h"
#import "PreviousBlueViewController.h"
#import "PreviousRedViewController.h"


@interface PreviousViewController ()
@property (nonatomic, strong) PreviousRedViewController * redViewController;
@property (nonatomic, strong) PreviousBlueViewController * blueViewController;

@property (nonatomic, assign) BOOL  isRed;
@end

@implementation PreviousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
//    self.navigationItem.rightBarButtonItems = [[UIBarButtonItem alloc]initWithCustomView:self.changeBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"change" style:UIBarButtonItemStylePlain target:self action:@selector(clickChange)];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addRedViewController:NO];
}

-(void)clickChange{
    if (self.isRed) {
        [self addBlueViewController];
    }else{
        [self addRedViewController:YES];
    }
}

-(void)addBlueViewController{
    self.isRed = NO;
    
    PreviousBlueViewController * blueViewController = [[PreviousBlueViewController alloc] init];
    [self addChildViewController:blueViewController];
    [self.view addSubview:blueViewController.view];
    [blueViewController willMoveToParentViewController:self];
    
    __weak __typeof(self)weakself = self;
    [self transitionFromViewController:self.redViewController
                      toViewController:blueViewController
                              duration:.5f
                               options:UIViewAnimationOptionTransitionCurlUp
                            animations:^{
                                
                            } completion:^(BOOL finished) {
                                [weakself.redViewController removeFromParentViewController];
                                [weakself.redViewController.view removeFromSuperview];
                                [blueViewController didMoveToParentViewController:weakself];
                            }];
    
    self.blueViewController = blueViewController;
}

-(void)addRedViewController:(BOOL)animated{
    self.isRed = YES;
    PreviousRedViewController * redViewController = [[PreviousRedViewController alloc] init];
    [self addChildViewController:redViewController];
    [self.view addSubview:redViewController.view];
    [redViewController willMoveToParentViewController:self];
    
    __weak __typeof(self)weakself = self;
    if (animated) {
        [self transitionFromViewController:self.blueViewController
                          toViewController:redViewController
                                  duration:.5f
                                   options:UIViewAnimationOptionTransitionCurlUp
                                animations:^{
                                    
                                } completion:^(BOOL finished) {
                                    [weakself.blueViewController removeFromParentViewController];
                                    [weakself.blueViewController.view removeFromSuperview];
                                    [redViewController didMoveToParentViewController:weakself];
                                }];
    }else{
        [redViewController didMoveToParentViewController:self];
    }
    self.redViewController = redViewController;
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
