//
//  ViewController.m
//  BasePerformanceTools
//
//  Created by 朱来飞 on 2018/6/12.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)click:(UIButton *)sender {
    
    ViewController1 * vc = [ViewController1 new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
