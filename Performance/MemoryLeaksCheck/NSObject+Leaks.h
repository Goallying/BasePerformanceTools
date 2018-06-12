//
//  NSObject+Leaks.h
//  FindLeaks
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (Leaks)

+ (void)swizzleSEL:(SEL)originSEL withSEL:(SEL)swizzlesSEL ;
- (void)willDealloc ;
@end
