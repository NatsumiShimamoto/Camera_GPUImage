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
#import <AssetsLibrary/AssetsLibrary.h>
//#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    
   // UIImage *originImage; //元の画像
   // CIImage *filteredImage; //処理中の画像

    //int tap;
    
   // UIImage *inputImage;
   // UIImage *outputImage;
    
    UIImageView *cameraView;
    UIImageView *libraryView;
    
    UIImage *cameraImage;
    UIImage *libraryImage;
}

@property UIImagePickerControllerSourceType sourceType;

@end

