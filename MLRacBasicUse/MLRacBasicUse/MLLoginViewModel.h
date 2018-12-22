//
//  MLLoginViewModel.h
//  MLRacBasicUse
//
//  Created by 268Edu on 2018/12/21.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLBaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MLLoginViewModel : MLBaseViewModel
@property (nonatomic,copy)NSString *account;
@property (nonatomic,copy)NSString *password;
@property (nonatomic,strong)RACSignal *validSignal;
@property (nonatomic,strong)RACCommand *loginCommand;
@end

NS_ASSUME_NONNULL_END
