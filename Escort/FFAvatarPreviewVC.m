//
//  FFAvatarPreviewVC.m
//  FFEscort
//
//  Created by fanly frank on 9/21/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/UIImage+AFNetworking.h>

#import "FFAvatarPreviewVC.h"
#import "FFGlobalMacro.h"


#import "MBProgressHUD+Addition.h"

@interface FFAvatarPreviewVC () <UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *avatarImgView;

@property (assign, nonatomic) BOOL isZoomed;
@property (assign, nonatomic) CGRect originalRect;

@end

@implementation FFAvatarPreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isZoomed = NO;
    
    self.title = @"我的头像";
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(doMore:)];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tse1.mm.bing.net/th?&id=OIP.Mc8c03e62f78cbcad0969763649b6f50fo0&w=299&h=299&c=0&pid=1.9&rs=0&p=0&r=0"]]];
    
    [self fillImgeToView:image];
    
    [_scrollView addSubview:_avatarImgView];
    
    _originalRect = _scrollView.frame;
    
    [self.view addSubview:_scrollView];
    
    UITapGestureRecognizer *doubleTapRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
    
    UILongPressGestureRecognizer *longPressRecognizer =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(scrollViewLongPressed:)];
    [self.scrollView addGestureRecognizer:longPressRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(scrollViewTwoFingerTapped:)];
    twoFingerTapRecognizer.numberOfTapsRequired = 1;
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    [self.scrollView addGestureRecognizer:twoFingerTapRecognizer];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 4
    CGRect scrollViewFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    self.scrollView.minimumZoomScale = minScale;
    
    // 5
    self.scrollView.maximumZoomScale = 2.0f;
    self.scrollView.zoomScale = minScale;
    
    // 6
    [self centerScrollViewContents];
}

- (void)fillImgeToView:(UIImage *)image {
    
    if (!_avatarImgView) {
        _avatarImgView = [[UIImageView alloc] initWithImage:image];
    }
    
    else {
        _avatarImgView.image = image;
    }
    
    _avatarImgView.frame = CGRectMake(0, 0, FFScreenW, FFScreenW);
    
    _scrollView.contentSize = _avatarImgView.frame.size;
}

#pragma mark - uiscrollviewdelegate

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that you want to zoom
    return self.avatarImgView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so you need to re-center the contents
    [self centerScrollViewContents];
}

#pragma mark - imagepickerview delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
                  editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    
    UIImage *oImage = [editingInfo objectForKey: @"UIImagePickerControllerEditedImage"];
    
    UIImage *miniImage = [UIImage imageWithData:UIImageJPEGRepresentation(oImage, .1)];
    [self fillImgeToView:miniImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = [info objectForKey: @"UIImagePickerControllerEditedImage"];
    
    UIImage *miniImage = [UIImage imageWithData:UIImageJPEGRepresentation(image, .1)];
    [self fillImgeToView:miniImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods
- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.avatarImgView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f - 64.0;
    } else {
        contentsFrame.origin.y = -64.0f;
    }
    
    self.avatarImgView.frame = contentsFrame;
}

- (void)scrollViewLongPressed:(UILongPressGestureRecognizer *)recognizer {
    
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"选择操作"
                                                                      message:@""
                                                               preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       
                                                       [actionVC dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    
    UIAlertAction *savePhoto = [UIAlertAction actionWithTitle:@"保存图片"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                              UIImageWriteToSavedPhotosAlbum(_avatarImgView.image, self,
                                                                                             @selector(image:didFinishSavingWithError:contextInfo:),
                                                                                             nil);
                                                          });
                                                      }];
    
    [actionVC addAction:savePhoto];
    [actionVC addAction:cancle];
    
    [self presentViewController:actionVC animated:YES completion:nil];

}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer *)recognizer {
    
    if (_isZoomed) {
        _isZoomed = NO;
        [self.scrollView zoomToRect:_originalRect animated:YES];
        return;
    }
    
    _isZoomed = YES;
    // 1
    CGPoint pointInView = [recognizer locationInView:self.avatarImgView];
    
    // 2
    CGFloat newZoomScale = self.scrollView.zoomScale * 2.0f;
    newZoomScale = MIN(newZoomScale, self.scrollView.maximumZoomScale);
    
    // 3
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    // 4
    [self.scrollView zoomToRect:rectToZoomTo animated:YES];
}


- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer *)recognizer {
    _isZoomed = YES;
    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.scrollView.zoomScale / 2.0f;
    newZoomScale = MAX(newZoomScale, self.scrollView.minimumZoomScale);
    [self.scrollView setZoomScale:newZoomScale animated:YES];
}

- (void)doMore:(UIBarButtonItem *)sender {
    
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"选择操作"
                                                                      message:@""
                                                               preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
                                                          pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                          pickerVC.allowsEditing = YES;
                                                          pickerVC.delegate = self;
                                                          
                                                          [self presentViewController:pickerVC animated:YES completion:nil];
    }];
 
    UIAlertAction *choosePhoto = [UIAlertAction actionWithTitle:@"从相册选择"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
        
                                                            UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
                                                            pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                            pickerVC.allowsEditing = YES;
                                                            pickerVC.delegate = self;
                                                            
                                                            [self presentViewController:pickerVC animated:YES completion:nil];
                                                            
    }];
    
    UIAlertAction *savePhoto = [UIAlertAction actionWithTitle:@"保存图片"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
        
                                                          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                              UIImageWriteToSavedPhotosAlbum(_avatarImgView.image, self,
                                                                                             @selector(image:didFinishSavingWithError:contextInfo:),
                                                                                             nil);
                                                          });
    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       
                                                       [actionVC dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [actionVC addAction:takePhoto];
    [actionVC addAction:choosePhoto];
    [actionVC addAction:savePhoto];
    [actionVC addAction:cancle];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error == NULL) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showToastWithTitle:@"保存成功!" success:YES superContainer:self.view];
        });
        
    }
    
    else {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showToastWithTitle:@"保存失败!" success:NO superContainer:self.view];
        });
    }
    
}

@end
