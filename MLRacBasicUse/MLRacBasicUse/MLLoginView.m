//
//  MLLoginView.m
//  MLRacBasicUse
//
//  Created by 268Edu on 2018/12/21.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLLoginView.h"

@implementation MLLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView{
    
    UITextField *accountTextFile = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, self.frame.size.width-100, 50)];
    accountTextFile.placeholder = @"请输入账号";
    [self addSubview:accountTextFile];
    self.accountTextFile = accountTextFile;
    
    UITextField *passwordTextFile = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(accountTextFile.frame)+10, self.frame.size.width-100, 50)];
    passwordTextFile.placeholder = @"请输入密码";
    [self addSubview:passwordTextFile];
    self.passwordTextFile = passwordTextFile;

    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake((self.frame.size.width-100)/2, CGRectGetMaxY(self.passwordTextFile.frame)+10, 100, 50);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [self addSubview:loginButton];
    self.loginButton = loginButton;
    
}
@end
