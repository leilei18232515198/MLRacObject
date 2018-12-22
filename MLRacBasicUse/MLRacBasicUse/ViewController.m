//
//  ViewController.m
//  MLRacBasicUse
//
//  Created by 268Edu on 2018/12/21.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "ViewController.h"
#import "MLLoginView.h"
#import "MLLoginViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ViewController ()
@property (nonatomic,strong)MLLoginView *loginView;
@property (nonatomic,strong)MLLoginViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MLLoginView *loginView = [[MLLoginView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:loginView];
    self.loginView = loginView;
    
    MLLoginViewModel *viewModel = [[MLLoginViewModel alloc]init];
    self.viewModel = viewModel;
    
//    数据绑定
    RAC(self.viewModel,account) = [RACSignal merge:@[RACObserve(self.loginView.accountTextFile, text),self.loginView.accountTextFile.rac_textSignal]];
    
    RAC(self.viewModel,password) = [RACSignal merge:@[RACObserve(self.loginView.passwordTextFile, text),self.loginView.passwordTextFile.rac_textSignal]];

    RAC(self.loginView.loginButton,enabled) = self.viewModel.validSignal;
    
//    登录按钮点击事件
    @weakify(self);
    [[[self.loginView.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.view endEditing:YES];
    }] subscribeNext:^(__kindof UIControl * _Nullable x) {
//    进行登录的一些操作
//      执行登录操作
        @strongify(self);
        [self.viewModel.loginCommand execute:nil];
    }];
    
//    点击登录(网络请求成功回调)
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"===============%@",x);
    }];
    
//    网络请求失败回调
    [self.viewModel.loginCommand.errors subscribeNext:^(NSError * _Nullable x) {
//        解析error
        if ([x.domain isEqualToString:@"error"]&&x.code == 110) {
            NSDictionary *dict = x.userInfo;
            NSLog(@"===========%@",dict[@"error"]);
        }
    }];
}


@end
