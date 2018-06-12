//
//  WeakProxy.h
//  App_iOS
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 上海递拎宝网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy : NSProxy
@property (nonatomic, weak, readonly) id target;
+ (instancetype)proxyWithTarget:(id)target;
@end
