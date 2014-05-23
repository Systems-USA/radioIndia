//
//  Station.m
//  RadioIndia
//
//  Created by Pepe Ramirez on 20/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import "Station.h"

@implementation Station

/*-(id)initWithName:(NSString *)name City:(NSString *)city Url:(NSString*)url ImageFile:(PFFile*)imageFile
{
    self = [super init];
    if (self) {
        self.name = name;
        self.city = city;
        self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:url]];
        self.imageFile = imageFile;
    }
    return self;
}*/

-(id)initWithName:(NSString *)name City:(NSString *)city Url:(NSString*)url
{
    self = [super init];
    if (self) {
        self.name = name;
        self.city = city;
        self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:url]];
    }
    return self;
}

-(void)playStation
{
    [self.player play];
}

-(void)pauseStation
{
    [self.player pause];
}

@end
