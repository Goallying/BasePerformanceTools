//
//  ViewController1.m
//  BasePerformanceTools
//
//  Created by 朱来飞 on 2018/6/12.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@property (nonatomic ,copy)void(^block)(void)  ;
@property (nonatomic ,strong)UIView * v ;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _v = [UIView new];
    _block = ^(){
        _v.backgroundColor = [UIColor redColor];
    };
    _block();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
