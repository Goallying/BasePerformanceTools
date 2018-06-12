//
//  WeakProxy.m
//  App_iOS
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 上海递拎宝网络科技有限公司. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    return [[WeakProxy alloc]initWithTarget:target];
}
- (instancetype)initWithTarget:(id)target{
    _target = target ;
    return self ;
}
- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

@end
