//
//  TableViewController.h
//  FootBallTime
//
//  Created by Sandeep Adhikari on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewController : UITableViewController {
    NSMutableArray *title;
	NSMutableArray *description;
	NSMutableArray *source;
	NSMutableArray *link;
}

@property (nonatomic, retain) NSMutableArray *title;
@property (nonatomic, retain) NSMutableArray *description;
@property (nonatomic, retain) NSMutableArray *source;
@property (nonatomic, retain) NSMutableArray *link;


@end
