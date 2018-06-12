//
//  UIViewController+Leaks.h
//  FindLeaks
//
//  Created by 朱来飞 on 2018/6/6.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const char * popedKey ;

@interface UIViewController (Leaks)
@property (nonatomic ,assign)BOOL memoryLeaksCheckDisable ;
@end
