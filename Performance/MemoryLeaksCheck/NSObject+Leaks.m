//
//  NSObject+Leaks.m
//  FindLeaks
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "NSObject+Leaks.h"

//目前只针对导航视图内存检测。
@implementation NSObject (Leaks)

+ (void)swizzleSEL:(SEL)originSEL withSEL:(SEL)swizzlesSEL{
    Method m0 = class_getInstanceMethod(self, originSEL);
    Method m1 = class_getInstanceMethod(self, swizzlesSEL);
    
    BOOL addedSuccessed = class_addMethod(self, originSEL, method_getImplementation(m1), method_getTypeEncoding(m1));
    if (addedSuccessed) {
        class_replaceMethod(self, originSEL, method_getImplementation(m1), method_getTypeEncoding(m1));
    }else{
        method_exchangeImplementations(m0, m1);
    }
}
- (void)willDealloc{}

@end
