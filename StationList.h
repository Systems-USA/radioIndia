//
//  StationList.h
//  RadioIndia
//
//  Created by Pepe Ramirez on 22/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationList : NSObject

@property (strong,nonatomic) NSMutableArray * stations;
@property int selectedStation;

-(id)init;
-(void)playCurrentStation;
-(void)pauseCurrentStation;
-(void)addStation:(Station*)station;
-(void)playNextStation;
-(void)playPreviousStation;
-(void)stopAllStations;

@end
