//
//  FFUpdateSingleTextVC.m
//  FFEscort
//
//  Created by fanly frank on 9/21/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import "FFUpdateSingleTextVC.h"
#import "FFGlobalMacro.h"

@interface FFUpdateSingleTextVC () <UITextFieldDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UITextField *textField;

@end

@implementation FFUpdateSingleTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, FFScreenW, FFScreenH)];
    _scrollView.contentSize = CGSizeMake(FFScreenW, FFScreenH - 64);
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, FFScreenW, 40)];
    _backView.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, FFScreenW - 20, 40)];
    _textField.text = _originalText;
    _textField.font = FFNormalFont;
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    _textField.delegate = self;
    
    [_scrollView addSubview:_backView];
    [_backView addSubview:_textField];
    
    [self.view addSubview:_scrollView];
    
    self.view.backgroundColor = FFBackColor;
    
    [_textField becomeFirstResponder];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(cancle:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(update:)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (string && string.length > 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
    return YES;
}

- (void)cancle:(UIBarButtonItem *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateSingleTextVCDidCancle)]) {
        [self.delegate updateSingleTextVCDidCancle];
    }
}

- (void)update:(UIBarButtonItem *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateSingleTextVCDidUpdateTextTo:for:)]) {
        [self.delegate updateSingleTextVCDidUpdateTextTo:_textField.text for:self.indexPath];
    }
}

@end
