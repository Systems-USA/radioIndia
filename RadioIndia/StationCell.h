//
//  StationCell.h
//  RadioIndia
//
//  Created by Pepe Ramirez on 19/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorite;
//@property (weak, nonatomic) IBOutlet PFImageView *imgImage;
//@property (strong, nonatomic) Station * station;

@end
