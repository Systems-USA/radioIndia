//
//  CityCell.h
//  RadioIndia
//
//  Created by Pepe Ramirez on 23/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import <Parse/Parse.h>

@interface CityCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet PFImageView *imgImage;

@end
