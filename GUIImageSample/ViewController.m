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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tap = 0;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//カメラを起動する
-(IBAction)takePhoto{
    
     PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    [self presentViewController:photoVC animated:YES completion:nil];
    
    NSLog(@"画面遷移");
}


//フォトライブラリを開く
-(IBAction)openLibrary{
    //画像の取得先をフォトライブラリに設定
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //フォトライブラリを使用可能かどうか判定する
    if([UIImagePickerController isSourceTypeAvailable:sourceType]){
        
        //UIImagePickerControllerを初期化・生成
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        //画像の取得先をフォトライブラリに設定
        picker.sourceType = sourceType;
        
        //デリゲートを設定
        picker.delegate = self;
        
        //フォトライブラリをモーダルビューとして表示する
        [self presentViewController:picker animated:YES completion:nil];
    }
}


@end
