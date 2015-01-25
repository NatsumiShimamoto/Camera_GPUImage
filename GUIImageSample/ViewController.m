//
//  ViewController.m
//  GUIImageSample
//
//  Created by 嶋本夏海 on 2015/01/12.
//  Copyright (c) 2015年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tap = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//カメラを起動する
-(IBAction)takePhoto{
    
    //画像の取得先をカメラに設定
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    

    //カメラを使用可能かどうか判定する
    if([UIImagePickerController isSourceTypeAvailable:sourceType]){
        
        //UIImagePickerControllerを初期化・生成
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        //画像の取得先をカメラに設定
        picker.sourceType = sourceType;
        
        //デリゲートを設定
        picker.delegate = self;
        
        //カメラをモーダルビューとして表示する
        [self presentViewController:picker animated:YES completion:nil];
        
    }
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


//何らかの画像が取得できた場合
-(void)imagePickerController:(UIImagePickerController *)picker
       didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editingInfo{
    
    //ModalViewControllerのViewを閉じる
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    

    //[self usePhoto];
    
    

    
    //UIImageViewに撮った画像を表示
    //self.imageView.image = image;
    
    /*
     //カメラモードの場合
     if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
     
     //渡されてきた画像をフォトアルバムに保存する
     UIImageWriteToSavedPhotosAlbum(image,//保存する画像
     self,//呼び出されるメソッドを持っているクラス
     @selector(targetImage:didFinishSavingWithError:contextInfo:), //呼び出されるメソッド
     NULL);//呼び出されるメソッドに渡したいもの（今回はなし）
     }
     */
    
}

-(void)usePhoto{
    
    PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    [self presentViewController:photoVC animated:YES completion:nil];
 
    NSLog(@"画面遷移");
}
//キャンセルをした場合
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    //ModalViewControllerのViewを閉じる
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}



@end
