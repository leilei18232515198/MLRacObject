//
//  MLBaseViewModel.m
//  MLRacBasicUse
//
//  Created by 268Edu on 2018/12/22.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLBaseViewModel.h"

@implementation MLBaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    MLBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(init)]
     subscribeNext:^(id x) {
         @strongify(viewModel)
         [viewModel initialize];
     }];
    return viewModel;
}

- (void)initialize{
    
}
@end
