//
//  DetailViewController.h
//  FootBallTime
//
//  Created by Sandeep Adhikari on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
    UIWebView *webView;
    NSString *link;
    
}

@property (nonatomic, retain) NSString *link;

@end
