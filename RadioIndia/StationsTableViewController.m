//
//  StationsTableViewController.m
//  RadioIndia
//
//  Created by Pepe Ramirez on 17/05/14.
//  Copyright (c) 2014 Systems USA. All rights reserved.
//

#import "StationsTableViewController.h"
#import "StationCell.h"
#import "Station.h"
#import "StationList.h"
#import "PlayerViewController.h"

@interface StationsTableViewController ()

@property StationList * stationList;

@end

@implementation StationsTableViewController

-  (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"Station";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 25;
    }
    return self;
}

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    /*[query whereKey:@"ProvZip" containedIn:_userZips];
    [query whereKey:@"Service" containsString:_service];
    [query whereKey:@"Type" containsString:_type];*/
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    }
    [query orderByAscending:@"name"];
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"StationCell";
    
    StationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[StationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //Station* station = [[Station alloc] initWithName:[object objectForKey:@"name"] City:[object objectForKey:@"city"] Url:[object objectForKey:@"url"] ImageFile:[object objectForKey:@"image"]];
    
    Station* station = [[Station alloc] initWithName:[object objectForKey:@"name"] City:[object objectForKey:@"city"] Url:[object objectForKey:@"url"]];
    
    // Configure the cell
    cell.lblName.text = station.name;
    cell.lblCity.text = station.city;
    //cell.imgImage.image = [UIImage imageNamed:@"cities.png"];
    //cell.imgImage.file = station.imageFile;
    //[cell.imgImage loadInBackground];
    
    //Add station to StationList
    [self.stationList addStation:station];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"stationsSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * selectedRow = [self.tableView indexPathForSelectedRow];
    PlayerViewController * destinationViewController = segue.destinationViewController;
    
    self.stationList.selectedStation = selectedRow.row;
    destinationViewController.stationList = self.stationList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.stationList = [[StationList alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
