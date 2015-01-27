//
//  ViewController.m
//  GUIImageSample
//
//  Created by 嶋本夏海 on 2015/01/12.
//  Copyright (c) 2015年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize sourceType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    cameraView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 80, 80)];
    libraryView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    
    cameraView.backgroundColor = [UIColor blackColor];
    libraryView.backgroundColor = [UIColor redColor];
    
    cameraView.userInteractionEnabled = YES;
    libraryView.userInteractionEnabled = YES;
    
    cameraView.tag = 1;
    libraryView.tag = 2;
    
    [self.view addSubview:cameraView];
    [self.view addSubview:libraryView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];

    switch (touch.view.tag){
    
        case 1:
            //画像の取得先をカメラに設定
            sourceType = UIImagePickerControllerSourceTypeCamera;
            
            break;
            
        case 2:
            //画像の取得先をフォトライブラリに設定
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            break;
            
        default:
            break;
    }
    
    NSLog(@"タッチ");
    NSLog(@"%d",touch.view.tag);
    
    
    PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    [self presentViewController:photoVC animated:YES completion:nil];
    
    NSLog(@"画面遷移");
}

@end
