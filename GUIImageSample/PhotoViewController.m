//
//  PhotoViewController.m
//  GUIImageSample
//
//  Created by 嶋本夏海 on 2015/01/25.
//  Copyright (c) 2015年 嶋本夏海. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 320, 320)];
    imgView.image = image;
    [self.view addSubview:imgView];
    
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
