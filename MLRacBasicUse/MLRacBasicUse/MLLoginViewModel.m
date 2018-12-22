//
//  MLLoginViewModel.m
//  MLRacBasicUse
//
//  Created by 268Edu on 2018/12/21.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLLoginViewModel.h"

@implementation MLLoginViewModel

- (void)initialize{
    self.validSignal = [[RACSignal
                              combineLatest:@[
                                              RACObserve(self, account),
                                              RACObserve(self, password)
                                              ]
                              reduce:^(NSString *account, NSString *password){
                                  return @(account.length > 0 && password.length > 0);
                              }] distinctUntilChanged];

//  执行登录方法
    @weakify(self);
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            @strongify(self);
//            有网络请求(成功调用)
            [subscriber sendNext:nil];
//            失败调用
            [subscriber sendError:[NSError errorWithDomain:@"error" code:110 userInfo:@{@"error":@"网络请求失败"}]];
            return nil;
        }];
    }];
}
@end
