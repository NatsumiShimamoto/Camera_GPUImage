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

/*
- (IBAction)colorFilterBtn:(UIButton*)filterBtn{
    NSLog(@"ボタンを押した！");
    
    tap++;
    
    
    // GUIで設定した画像を取得する
    inputImage = self.imageView.image;
    
    // 画像をGPUImageのフォーマットに治す
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    
    
    if(tap > 1){
        outputImage = nil;
        //self.imageView.image = nil;
        self.imageView.image = inputImage;
    }
    
    
    if(filterBtn.tag == 1) {
        
        
        // セピアフィルターを作る
        GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
        
        // イメージをセピアフィルターにくっつける
        [imagePicture addTarget:sepiaFilter];
        [sepiaFilter useNextFrameForImageCapture];
        
        // フィルターを実行
        [imagePicture processImage];
        // 実行したフィルターから、画像を取得する
        outputImage = [sepiaFilter imageFromCurrentFramebuffer];
        
        // 取得した画像をセットする
        self.imageView.image = outputImage;
        
    }else if(filterBtn.tag == 2){
        
        //モノクロフィルターを生成
        GPUImageGrayscaleFilter *grayFilter = [[GPUImageGrayscaleFilter alloc] init];
        //画像にモノクロフィルターをくっつける
        [imagePicture addTarget:grayFilter];
        //モノクロフィルター処理を実行
        [imagePicture processImage];
        
        //実行したフィルターから画像を取得
        outputImage = [grayFilter imageByFilteringImage:inputImage];
        //取得した画像をImageViewにセットする
        self.imageView.image = outputImage;
        
    }
    
    
    
}






- (IBAction)pressSaveBtn:(id)sender {
    
    UIImage *image = self.imageView.image;
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:image.CGImage
                                 metadata:nil
                          completionBlock:^(NSURL *assetURL, NSError *error){
                              if (!error) {
                                  NSLog(@"保存成功！");
                              }
                          }
     ];
}

-(IBAction)blurFilter{
    
    //UIImage変数に画像を格納
    UIImage *inputImage = self.imageView.image;
    //画像をGPUImageのフォーマットに変換
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    //ぼかしフィルターを生成
    GPUImageGaussianBlurFilter *gaussianBlurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    
    //[(GPUImageGaussianSelectiveBlurFilter *)gaussianBlurFilter  setExcludeCircleRadius:0.4];
    //[(GPUImageGaussianSelectiveBlurFilter *)gaussianBlurFilter setExcludeCirclePoint:CGPointMake(0.5, 0.5)];
    
    //画像にぼかしフィルターをくっつける
    [imagePicture addTarget:gaussianBlurFilter];
    //フィルター処理を実行
    [imagePicture processImage];
    //実行したフィルターから画像を取得
    UIImage *outputBlurImage = [gaussianBlurFilter imageByFilteringImage:inputImage];
    //取得した画像をImageViewにセットする
    self.imageView.image = outputBlurImage;
}



*/

//カメラを起動する
-(IBAction)takePhoto{
    
    //画像の取得先をカメラに設定
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
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


-(void)imagePickerController:(UIImagePickerController *)picker
       didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editingInfo{
    
    PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    
    [self.navigationController pushViewController:photoVC animated:YES];
    NSLog(@"画面遷移");
    
    

    
    //UIImageViewに撮った画像を表示
    //self.imageView.image = image;
    
    //ModalViewControllerのViewを閉じる
    //[[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
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


/* --- 保存が完了したら呼ばれるメソッド --- */
/*
 -(void)targetImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context{
 
 //保存失敗時
 if(error){
 //アラートの初期化
 UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@""
 message:@"保存できませんでした"
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles: nil];
 //アラートの表示
 [alert show];
 }
 
 //保存成功時
 else{
 //アラートの初期化
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
 message:@"保存を完了しました"
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 //アラートの表示
 [alert show];
 }
 }
 */

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    //ModalViewControllerのViewを閉じる
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}

/*
-(IBAction)postToTwitter{
    
    //ServiceTypeをTwitterに設定
    NSString *serviceType = SLServiceTypeTwitter;
    //Twitterが利用可能かチェック
    if([SLComposeViewController isAvailableForServiceType:serviceType]){
        
        //SLComposeViewControllerを初期化・生成
        SLComposeViewController *twitterpostVC = [[SLComposeViewController alloc] init];
        
        //ServiceTypeをTwitterに設定
        twitterpostVC = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
        //初期テキストの設定
        [twitterpostVC setInitialText:@"#わんだ"];
        
        //画像の追加
        [twitterpostVC addImage:self.imageView.image];
        
        //投稿の可否         //↓ツイート編集終了時
        [twitterpostVC setCompletionHandler:^(SLComposeViewControllerResult result){
            if(result == SLComposeViewControllerResultDone){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:@"投稿を完了しました"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:@"投稿できませんでした"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }
         ];
        
        
        //SLComposeViewControllerのViewを表示
        [self presentViewController:twitterpostVC animated:YES completion:nil];
        
    }
}
*/

@end
