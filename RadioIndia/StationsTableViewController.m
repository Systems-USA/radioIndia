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
#import "PlayerViewController.h"

@interface StationsTableViewController ()

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

/*
- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    [query whereKey:@"ProvZip" containedIn:_userZips];
    [query whereKey:@"Service" containsString:_service];
    [query whereKey:@"Type" containsString:_type];
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    [query orderByAscending:@"NetPaid"];
    return query;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"StationCell";
    
    StationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[StationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.station = [[Station alloc] initWithName:[object objectForKey:@"name"] City:[object objectForKey:@"city"] Url:[object objectForKey:@"url"] ImageFile:[object objectForKey:@"image"]];
    
    // Configure the cell
    cell.lblName.text = cell.station.name;
    
    cell.lblCity.text = cell.station.city;
    
    cell.imgImage.image = [UIImage imageNamed:@"cities.png"];
    cell.imgImage.file = cell.station.imageFile;
    [cell.imgImage loadInBackground];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"stationsSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * selectedRow = [self.tableView indexPathForSelectedRow];
    StationCell * stationRow = (StationCell *) [self.tableView cellForRowAtIndexPath:selectedRow];
    PlayerViewController * destinationViewController = segue.destinationViewController;
    
    destinationViewController.station = stationRow.station;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
