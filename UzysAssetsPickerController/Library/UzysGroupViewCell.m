//
//  uzysGroupViewCell.m
//  UzysAssetsPickerController
//
//  Created by Uzysjung on 2014. 2. 13..
//  Copyright (c) 2014년 Uzys. All rights reserved.
//
#import "UzysAssetsPickerController_Configuration.h"
#import "UzysGroupViewCell.h"
#import "UzysAppearanceConfig.h"
@implementation UzysGroupViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.font = [UIFont systemFontOfSize:17];
//        self.detailTextLabel.font = [UIFont systemFontOfSize:17];
        UzysAppearanceConfig *appearanceConfig = [UzysAppearanceConfig sharedConfig];
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage Uzys_imageNamed:appearanceConfig.assetsGroupSelectedImageName]];
        self.selectedBackgroundView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor=kRGBA(48, 48, 48, 1);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if(selected)
    {
        self.accessoryView.hidden = NO;
    }
    else
    {
        self.accessoryView.hidden = YES;
    }

}


- (void)applyData:(ALAssetsGroup *)assetsGroup
{
    self.assetsGroup            = assetsGroup;
    
    CGImageRef posterImage      = assetsGroup.posterImage;
    size_t height               = CGImageGetHeight(posterImage);
    float scale                 = height / kThumbnailLength;
    
    self.imageView.image        = [UIImage imageWithCGImage:posterImage scale:scale orientation:UIImageOrientationUp];
    
    self.textLabel.attributedText = [self buildAttributedString:assetsGroup];
//
//    self.detailTextLabel.text   = [NSString stringWithFormat:@"%ld", (long)[assetsGroup numberOfAssets]];
    self.accessoryType          = UITableViewCellAccessoryDisclosureIndicator;
}

- (NSMutableAttributedString*)buildAttributedString:(ALAssetsGroup*)assetsGroup{
    NSString *title = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    NSString *detail = [NSString stringWithFormat:@"%ld", (long)[assetsGroup numberOfAssets]];
    NSString *str = [NSString stringWithFormat:@"%@(%@)",title,detail];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, str.length)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    [attrString addAttribute:NSForegroundColorAttributeName value:kRGBA(153, 153, 153, 1) range:NSMakeRange(title.length, detail.length+2)];
    return attrString;
}
@end
