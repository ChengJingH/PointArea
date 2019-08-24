//
//  ViewController.m
//  PointArea
//
//  Created by walen on 2019/7/29.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "ViewController.h"
#import "UIWindow+PointArea.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    
    UIButton *subbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 20, 40)];
    subbtn.backgroundColor = [UIColor purpleColor];
    [btn addSubview:subbtn];
    
//    self.pointLabel.text = [NSString stringWithFormat:@"x ~ %lf y ~ %lf",[uiwe]];
}


@end
