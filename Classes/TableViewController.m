//
//  TableViewController.m
//  FootBallTime
//
//  Created by Sandeep Adhikari on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "XMLReader.h"
#import "DetailViewController.h"


@implementation TableViewController

@synthesize title, description,source, link;
- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    description = [[NSMutableArray alloc] init];
	title = [[NSMutableArray alloc] init];
	source = [[NSMutableArray alloc] init];
	link = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"http://www.nfl.com/rss/rsslanding?searchString=team&abbr=WAS"];
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
	NSURLResponse *response = NULL;
	NSError *requestError = NULL;
	
	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&requestError];	
	NSString *responseString  = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	
	NSError *parserError = NULL;
	NSDictionary *xmlDict = [XMLReader dictionaryForXMLString:responseString error:&parserError];
	
	//NSLog(@"%@", xmlDict);
    //NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++");

    
    for ( NSDictionary *dict in [[xmlDict objectForKey:@"feed"] objectForKey:@"entry"]){
		
		//NSLog(@"%@", dict);
        NSLog(@"-------------------------------------------------");
		
		NSString *titleStr = [[NSString alloc] initWithFormat:@"%@", [[dict objectForKey:@"title"] objectForKey:@"text"]];
        NSLog(@"%@", titleStr);
		[title addObject:titleStr];
		[titleStr release];
		
		NSString *descStr = [[NSString alloc] initWithFormat:@"%@", [[dict objectForKey:@"summary"] objectForKey:@"text"]];
        NSLog(@"%@", descStr);
		[description addObject:descStr];
		[descStr release];
		
		NSString *sourceStr = [[NSString alloc] initWithFormat:@"%@", [[dict objectForKey:@"dc:source"] objectForKey:@"text"]];
        NSLog(@"%@", sourceStr);
		[source addObject:sourceStr];
		[sourceStr release];
		
		NSString *linkStr = [[NSString alloc] initWithFormat:@"%@", [[dict objectForKey:@"link"] objectForKey:@"href"]];
        NSLog(@"%@", linkStr);
		[link addObject:linkStr];
		[linkStr release];
	}
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    return [title count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [title objectAtIndex:indexPath.row];
    //cell.textLabel.text = @"NICE";

    cell.detailTextLabel.text = [description objectAtIndex:indexPath.row];
    
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     DetailViewController *detailViewController = [[DetailViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
     detailViewController.link = [link objectAtIndex:indexPath.row];
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


@end
