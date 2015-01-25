//
//  ViewController.h
//  GUIImageSample
//
//  Created by 嶋本夏海 on 2015/01/12.
//  Copyright (c) 2015年 嶋本夏海. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import "PhotoViewController.h"


@interface ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    //IBOutlet UIImageView *imageView; //画像を表示するUIImageView
    
    UIImage *originImage; //元の画像
    CIImage *filteredImage; //処理中の画像

    int tap;
    
    UIImage *inputImage;
    UIImage *outputImage;
}


//-(IBAction)pressSaveBtn:(id)sender;
//-(IBAction)blurFilter;


//カメラを起動する
//-(IBAction)takePhoto;

//フォトライブラリを開く
//-(IBAction)openLibrary;

//Twitterへ投稿
//-(IBAction)postToTwitter;

//写真を保存する
//-(IBAction)savePhoto;

//エフェクトをかける
//-(IBAction)effect;


//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property UIImage *image;
@end

