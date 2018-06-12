//
//  UINavigationController+Leaks.m
//  FindLeaks
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "UINavigationController+Leaks.h"
#import "NSObject+Leaks.h"
@implementation UINavigationController (Leaks)


+ (void)load {
    
#if !Distribution
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(popViewControllerAnimated:) withSEL:@selector(hook_popViewControllerAnimated:)];
    });
#endif
    
}
- (UIViewController *)hook_popViewControllerAnimated:(BOOL)animated{
   UIViewController * popedVC =  [self hook_popViewControllerAnimated:animated];
    extern const char * popedKey ;
    objc_setAssociatedObject(popedVC, popedKey, @(YES), OBJC_ASSOCIATION_RETAIN);
    
    return popedVC;
}

@end
