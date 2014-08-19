//
//  PlayerViewController.m
//  RadioIndia
//
//  Created by Pepe Ramirez on 20/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@end

@implementation PlayerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PlayerInstantiated" object:nil];
    [self ibaPlayTapped:self.btnPlay];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self updateUI];
}

-(void)updateUI
{
    if([self.stationList isStationCurrentlyPlaying])
    {
        self.btnPlay.selected = YES;
    }else
    {
        self.btnPlay.selected = NO;
    }
}

- (IBAction)ibaPlayTapped:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PlayerInstantiated" object:nil];
    if(!sender.selected)
    {
        [self.stationList playCurrentStation];
        sender.selected = YES;
    }
    else
    {
        [self.stationList pauseCurrentStation];
        sender.selected = NO;
    }
}

- (IBAction)btnNext:(UIButton *)sender {
    [self.stationList playNextStation];
}

- (IBAction)btnPrev:(UIButton *)sender {
    [self.stationList playPreviousStation];
}

@end
