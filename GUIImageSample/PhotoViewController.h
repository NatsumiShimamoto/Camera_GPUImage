//
//  PhotoViewController.h
//  GUIImageSample
//
//  Created by 嶋本夏海 on 2015/01/25.
//  Copyright (c) 2015年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface PhotoViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

{
    AppDelegate *delegate;
    
    UIImageView *imgView;
  
}

@end
