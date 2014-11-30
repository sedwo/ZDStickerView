//
// ViewController.m
// ZDStickerViewApp
//
// Created by zedoul on 5/29/13.
// Copyright (c) 2013 scipi. All rights reserved.
//

#import "ViewController.h"
#import "ZDStickerView.h"




@interface ViewController () <ZDStickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    UIImageView *imageView1 = [[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"sampleImage1.jpg"]];

    UIImageView *imageView2 = [[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"sampleImage2.png"]];
    imageView2.backgroundColor = [UIColor clearColor];
    CGRect gripFrame1 = CGRectMake(50, 50, 140, 140);

    UIView*contentView = [[UIView alloc] initWithFrame:gripFrame1];
    [contentView setBackgroundColor:[UIColor blackColor]];
    [contentView addSubview:imageView1];
    [contentView addSubview:imageView2];


    ZDStickerView *userResizableView1 = [[ZDStickerView alloc] initWithFrame:gripFrame1];
    userResizableView1.tag = 0;
    userResizableView1.stickerViewDelegate = self;
    userResizableView1.contentView = contentView; // contentView;
    userResizableView1.preventsPositionOutsideSuperview = NO;
    [userResizableView1 showEditingHandles];
    [self.view addSubview:userResizableView1];


    CGRect gripFrame2 = CGRectMake(50, 200, 180, 140);
    UITextView *textView = [[UITextView alloc] initWithFrame:gripFrame2];
    textView.text = @"ZDStickerView is Objective-C module for iOS and offer complete configurability, including movement, resizing, rotation and more, with one finger.";
    ZDStickerView *userResizableView2 = [[ZDStickerView alloc] initWithFrame:gripFrame2];
    userResizableView2.tag = 1;
    userResizableView2.stickerViewDelegate = self;
    userResizableView2.contentView = textView;
    userResizableView2.preventsPositionOutsideSuperview = NO;
    userResizableView2.preventsCustomButton = NO;
    [userResizableView2 setButton:ZDSTICKERVIEW_BUTTON_CUSTOM
                            image:[UIImage imageNamed:@"Write.png"]];
    userResizableView2.preventsResizing = YES;
    [userResizableView2 showEditingHandles];
    [self.view addSubview:userResizableView2];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - delegate functions

- (void)stickerViewDidLongPressed:(ZDStickerView *)sticker
{
    NSLog(@"%s [%ld]", __func__, sticker.tag);

    if (sticker.isEditingHandlesHidden)
    {
        [sticker showEditingHandles];
    }
    else
    {
        [sticker hideEditingHandles];
    }
}



- (void)stickerViewDidClose:(ZDStickerView *)sticker
{
    NSLog(@"%s [%ld]", __func__, sticker.tag);
}



- (void)stickerViewDidCustomButtonTap:(ZDStickerView *)sticker
{
    NSLog(@"%s [%ld]", __func__, sticker.tag);
    [((UITextView*)sticker.contentView)becomeFirstResponder];
}



@end