//
//  PopTableViewCell.m
//  Test_ofo
//
//  Created by liuwei on 2017/7/7.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "PopTableViewCell.h"
#import "Masonry.h"
#import <POP.h>

@interface PopTableViewCell()
@property (nonatomic, strong) UILabel * titleLbl;
@property (nonatomic, strong) UILabel * subTitleLbl;
@end

@implementation PopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title detailTitle:(NSString *)detailTitle completion:(PopTableViewCellCompletion)completion{
    
    self = [super init];
    if (self) {
        self.completion = completion;
        [self initView];
        
        self.titleLbl.text = title;
        self.subTitleLbl.text = detailTitle;
    }
    return self;
}



#pragma mark initView
-(void)initView{
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.subTitleLbl];
    
    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(12);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(self.contentView.mas_height);
    }];
    
    [_subTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(_titleLbl.mas_height);
    }];
}

#pragma mark getter
-(UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.backgroundColor = [UIColor whiteColor];
        _titleLbl.font = [UIFont systemFontOfSize:14];
        _titleLbl.textColor = [UIColor redColor];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLbl;
}

-(UILabel *)subTitleLbl{
    if (!_subTitleLbl) {
        _subTitleLbl = [[UILabel alloc] init];
        _subTitleLbl.backgroundColor = [UIColor whiteColor];
        _subTitleLbl.font =[UIFont systemFontOfSize:14];
        _subTitleLbl.textColor = [UIColor blackColor];
        _subTitleLbl.textAlignment = NSTextAlignmentRight;
    }
    return _subTitleLbl;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    if ([self.titleLbl.text isEqualToString:@"cellRow_0"]) {
        if (self.highlighted) {
            POPBasicAnimation * scaleAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            scaleAni.duration = 0.1;
            scaleAni.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
            [self.titleLbl pop_addAnimation:scaleAni forKey:@"scalingUp"];
            [self.subTitleLbl pop_addAnimation:scaleAni forKey:@"scalingUp"];
        }else{
            POPSpringAnimation * springAni = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            springAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
            springAni.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
            springAni.springBounciness = 20.f;
            [self.titleLbl pop_addAnimation:springAni forKey:@"springAnimation"];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (self.selected) {
        if (self.completion) {
            self.completion(self.titleLbl.text);
        }
    }
    // Configure the view for the selected state
}

@end
