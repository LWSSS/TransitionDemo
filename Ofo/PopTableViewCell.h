//
//  PopTableViewCell.h
//  Test_ofo
//
//  Created by liuwei on 2017/7/7.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PopTableViewCellCompletion)(NSString * title);
@interface PopTableViewCell : UITableViewCell
@property (nonatomic, copy)PopTableViewCellCompletion completion;
@property (nonatomic, strong) NSString  * title;
@property (nonatomic, strong) NSString * subTitle;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title detailTitle:(NSString *)detailTitle completion:(PopTableViewCellCompletion)completion;
@end
