//
//  StationList.m
//  RadioIndia
//
//  Created by Pepe Ramirez on 22/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import "StationList.h"

@implementation StationList

-(void)playCurrentStation
{
    [[[self.stations objectAtIndex:self.selectedStation] player] play];
}

-(void)addStation:(Station*)station
{
    [self.stations addObject:station];
}

-(void)playNextStation
{
    int selSt = self.selectedStation ++;
    if(selSt < 0)
    {
        selSt = (int)[self.stations count]; //[[NSNumber numberWithDouble:[self.stations count]] intValue];
    }
    else if(selSt > [self.stations count])
    {
        selSt = 0;
    }
    [[[self.stations objectAtIndex:selSt] player] play];
}

-(void)playPreviousStation
{
    int selSt = self.selectedStation --;
    if(selSt < 0)
    {
        selSt = (int)[self.stations count]; //[[NSNumber numberWithDouble:[self.stations count]] intValue];
    }
    else if(selSt > [self.stations count])
    {
        selSt = 0;
    }
    [[[self.stations objectAtIndex:selSt] player] play];
}

-(void)flushList
{
    [self.stations removeAllObjects];
}

@end
