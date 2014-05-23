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
    [self ibaPlayTapped:self.btnPlay];
}

- (IBAction)ibaPlayTapped:(UIButton *)sender {
    
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
