//
//  PopViewController.m
//  Test_ofo
//
//  Created by liuwei on 2017/7/7.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PopViewController.h"
#import "Masonry.h"
#import "PopTableViewCell.h"
#import "PopTextViewController.h"
#import "PopTransitionViewController.h"
#define screenwidth [[UIScreen mainScreen] bounds].size.width
#define screenheight [[UIScreen mainScreen] bounds].size.height


@interface PopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * mainTableView;
@property (nonatomic, strong) NSMutableArray * dataArr1;
@property (nonatomic, strong) NSMutableArray * dataArr2;
@property (nonatomic, strong) UIButton * dismissBtn;
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr1 = [NSMutableArray array];
    _dataArr2 = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        [_dataArr1 addObject:[NSString stringWithFormat:@"cellRow_%ld",(long)i]];
    }
    
    for ( NSInteger i = 0 ; i <10; i++) {
        [_dataArr2 addObject:[NSString stringWithFormat:@"pop_%ld",(long)i]];
    }
    
    [self.view addSubview:self.mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.dismissBtn];
    [_dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(window.mas_centerX);
        make.bottom.mas_equalTo(window.mas_bottom);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    // Do any additional setup after loading the view.
}

#pragma mark  clickaction
-(void)onViewClick:(id)sender{
    if (sender == self.dismissBtn) {
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.dismissBtn removeFromSuperview];
    }
}

-(UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.contentSize = CGSizeMake(screenwidth, screenheight);
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        _mainTableView.contentInset = UIEdgeInsetsMake(25, 0, 0, 0);
    }
    return _mainTableView;
}

-(UIButton *)dismissBtn{
    if (!_dismissBtn) {
        _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dismissBtn.layer.cornerRadius = 4;
        _dismissBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _dismissBtn.backgroundColor = [UIColor lightGrayColor];
        _dismissBtn.clipsToBounds = YES;
        [_dismissBtn setTitle:@"DISMISS" forState:UIControlStateNormal];
        [_dismissBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dismissBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissBtn;
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//    cell.textLabel.text = _dataArr1[indexPath.row];
//    cell.detailTextLabel.text = _dataArr2[indexPath.row];
//    return cell;
    
    static NSString * identif = @"maincell";
    PopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identif];
    if (!cell) {
        __weak __typeof(self)weakself = self;
        cell = [[PopTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identif title:_dataArr1[indexPath.row] detailTitle:_dataArr2[indexPath.row] completion:^(NSString *title) {
           NSInteger index = indexPath.row;
            switch (index) {
                    case 1:
                    [weakself clickPresent1];
                    break;
                    
                    case 2:
                    [weakself clickPresent2];
                    break;
                    
                default:
                    break;
            }
        }];
    }
    return cell;
}

-(void)clickPresent2{
    PopTransitionViewController * vc = [[PopTransitionViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)clickPresent1{
    PopTextViewController * vc = [[PopTextViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
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
