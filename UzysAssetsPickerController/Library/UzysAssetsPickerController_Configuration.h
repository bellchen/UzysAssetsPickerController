//
//  UzysAssetsPickerController_configuration.h
//  UzysAssetsPickerController
//
//  Created by Uzysjung on 2014. 2. 12..
//  Copyright (c) 2014년 Uzys. All rights reserved.
//
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
typedef void (^intBlock)(NSInteger);
typedef void (^voidBlock)(void);

#define kGroupViewCellIdentifier           @"groupViewCellIdentifier"
#define kAssetsViewCellIdentifier           @"AssetsViewCellIdentifier"

#define kThumbnailLength    49.7f
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define kTagButtonClose 101
#define kTagButtonCamera 102
#define kTagButtonGroupPicker 103
#define kTagButtonDone 104
#define kTagNoAssetViewImageView 30
#define kTagNoAssetViewTitleLabel 31
#define kTagNoAssetViewMsgLabel 32

#define kGroupPickerViewCellLength 67.5f
#define kRGBA(__r, __g, __b, __a)        [UIColor colorWithRed:(1.0*(__r)/255) green:(1.0*(__g)/255) blue:(1.0*(__b)/255) alpha:1.0*(__a)]
#define FontDesign(__v)                 (ceil((__v)*(1080.0/(kDevice_Is_iPhone6Plus?1080:1280))/2.0*72/96))


#ifdef DEBUG
// for debug mode
#ifndef DLog
#define DLog(f, ...) NSLog(f, ##__VA_ARGS__)
#endif

#else

// for release mode
#ifndef DLog
#define DLog(f, ...) /* noop */
#endif

#endif
