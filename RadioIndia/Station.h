//
//  Station.h
//  RadioIndia
//
//  Created by Pepe Ramirez on 20/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Station : NSObject

@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) PFFile * imageFile;
@property (nonatomic,strong) AVPlayer * player;

-(id)initWithName:(NSString *)name City:(NSString *)city Url:(NSString*)url ImageFile:(PFFile*)imageFile;

@end
