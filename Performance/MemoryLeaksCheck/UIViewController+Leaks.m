
//
//  UIViewController+Leaks.m
//  FindLeaks
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "UIViewController+Leaks.h"
#import "NSObject+Leaks.h"

const char * popedKey = "popedKey";
static void * leaksKey = "leaksKey";
@implementation UIViewController (Leaks)

- (void)setMemoryLeaksCheckDisable:(BOOL)memoryLeaksCheckDisable{
    objc_setAssociatedObject(self, leaksKey, @(memoryLeaksCheckDisable), OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)memoryLeaksCheckDisable{
    return [objc_getAssociatedObject(self, leaksKey) boolValue];
}
+ (void)load {
    
#if !Distribution
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(viewWillAppear:) withSEL:@selector(hook_viewWillAppear:)] ;
        [self swizzleSEL:@selector(viewDidDisappear:) withSEL:@selector(hook_viewDidDisappear:)];
    });
#endif
    
}
- (void)hook_viewWillAppear:(BOOL)animated{
    [self hook_viewWillAppear:animated];
    objc_setAssociatedObject(self, popedKey, @(NO), OBJC_ASSOCIATION_RETAIN);
}
- (void)hook_viewDidDisappear:(BOOL)animated{
    [self hook_viewDidDisappear:animated];
    if ([objc_getAssociatedObject(self, popedKey) boolValue] && !self.memoryLeaksCheckDisable) {
        [self willDealloc];
    }
}
- (void)willDealloc{
    __weak id weakSelf = self ;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong id strongSelf = weakSelf;
        [strongSelf assertFailedDealloc];
    });
}
- (void)assertFailedDealloc {
    NSLog(@"######%@没有释放######",self.class);
}
@end
