//
//  XMGLoginRegisterField.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGLoginRegisterField.h"

@implementation XMGLoginRegisterField

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 修改光标颜色
    self.tintColor = [UIColor lightGrayColor];
    
    // 监听文本框什么时候开始编辑 1.代理 2.通知 3.target
    // 最好不要自己成为自己代理
    // 监听文本框开始编辑
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    // 监听文本框开始编辑
    [self addTarget:self action:@selector(textEnd:) forControlEvents:UIControlEventEditingDidEnd];
    
    //[self addTarget:self action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>]
    
    // 能不能快速去设置占位文字颜色
    // 以后只要想查看某一个view是什么类型,使用小面包
    // 猜测占位文字控件 => 验证UILabel => 获取占位文字label => 获取label属性名 => 能不能拿私有属性名(runtime) => 查看一个类有哪些属性 请用断点
    
    // 获取占位文字label
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];

}

// 文本框开始编辑的时候调用
- (void)textBegin
{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];

}

// 文本框结束编辑就会调用
- (void)textEnd:(UITextField *)textField
{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    
    
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self resignFirstResponder];
//}

@end
