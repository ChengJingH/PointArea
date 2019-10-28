//
//  ViewController.m
//  PointArea
//
//  Created by walen on 2019/7/29.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "ViewController.h"
#import "UIWindow+PointArea.h"
#import "GradualLabel.h"

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
    
    GradualLabel *label = [[GradualLabel alloc] initWithFrame:CGRectMake(20, 100, 360, 30)];
    label.text = @"来得及弗兰克斯江东父老开价是独立开发尽量快单数据分离控件都是";
    label.font = [UIFont systemFontOfSize:16.0];
    [self.view addSubview:label];
        
    //    self.pointLabel.text = [NSString stringWithFormat:@"x ~ %lf y ~ %lf",[uiwe]];
}


@end
