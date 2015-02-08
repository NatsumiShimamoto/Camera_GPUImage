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
    
    
    cameraImage = [UIImage imageNamed:@"camera.png"];
    cameraView = [[UIImageView alloc] initWithImage:cameraImage];
    cameraView.frame = CGRectMake(50, 350, 50, 50);
    cameraView.userInteractionEnabled = YES;
    cameraView.tag = 1;
    [self.view addSubview:cameraView];
    
    libraryImage = [UIImage imageNamed:@"library.png"];
    libraryView = [[UIImageView alloc] initWithImage:libraryImage];
    libraryView.frame = CGRectMake(150, 350, 50, 50);
    libraryView.userInteractionEnabled = YES;
    libraryView.tag = 2;
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
    PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    
       NSLog(@"%d",touch.view.tag);
    switch (touch.view.tag){
         
        case 1:
            //画像の取得先をカメラに設定
            sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:photoVC animated:YES completion:nil];

            NSLog(@"Camera");
            NSLog(@"--ViewController sourceType is %d",sourceType);
    
            break;
            
        case 2:
            //画像の取得先をフォトライブラリに設定
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:photoVC animated:YES completion:nil];
            
            NSLog(@"Library");
            NSLog(@"--ViewController sourceType is %d",sourceType);
            
            break;
            
        default:
            
            break;
    }
    
    NSLog(@"タッチ");
    
    
    
}

@end
