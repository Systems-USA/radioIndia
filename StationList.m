//
//  StationList.m
//  RadioIndia
//
//  Created by Pepe Ramirez on 22/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import "StationList.h"

@implementation StationList

-(id)init
{
    self = [super init];
    if(self)
    {
        // Register observer to be notified when download of data is complete
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pauseCurrentStation)
                                                     name:@"PlayerInstantiated" object:nil];
        self.stations = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)playCurrentStation
{
    [self stopAllStations];
    [[self.stations objectAtIndex:self.selectedStation] playStation];
}

-(void)pauseCurrentStation
{
    [[self.stations objectAtIndex:self.selectedStation] pauseStation];
}

-(void)addStation:(Station*)station
{
    [self.stations addObject:station];
}

-(void)playNextStation
{
    [self pauseCurrentStation];
    self.selectedStation ++;
    if(self.selectedStation < 0)
    {
        self.selectedStation = (int)[self.stations count]; //[[NSNumber numberWithDouble:[self.stations count]] intValue];
    }
    else if(self.selectedStation > [self.stations count]-1)
    {
        self.selectedStation = 0;
    }
    [self playCurrentStation];
}

-(void)playPreviousStation
{
    [self pauseCurrentStation];
    self.selectedStation --;
    if(self.selectedStation < 0)
    {
        self.selectedStation = (int)[self.stations count]-1; //[[NSNumber numberWithDouble:[self.stations count]] intValue];
    }
    else if(self.selectedStation > [self.stations count])
    {
        self.selectedStation = 0;
    }
    [self playCurrentStation];
}

-(void)stopAllStations
{
    [self.stations enumerateObjectsUsingBlock:^(Station* object, NSUInteger idx, BOOL *stop) {
        [object.player pause];
    }];
}

-(BOOL)isStationCurrentlyPlaying
{
    return [[self.stations objectAtIndex:self.selectedStation] isCurrentlyPlaying];
}

@end
