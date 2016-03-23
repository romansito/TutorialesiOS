//
//  ViewController.m
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/21/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *videoList;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	
	self.videoList = [[NSArray alloc]init];
	
	[[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
		if (dataArray) {
			
			// turn data in to a class to use
			
			NSMutableArray *arr = [[NSMutableArray alloc]init];
			
			for (NSDictionary *d in dataArray) {
				Video *vid = [[Video alloc] init];
				vid.videoTitle = [d objectForKey:@"title"];
				vid.videDescription = [d objectForKey:@"description"];
				vid.thumbnailURL = [d objectForKey:@"thumbnail"];
				vid.videoIframe = [d objectForKey:@"iframe"];
				
				[arr addObject:vid];
			}
			
			self.videoList = arr;
			[self updateTableData];
			
		} else if (errMessage) {
			// Display alert to user
		}
	}];
}

- (void) updateTableData {
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.tableView reloadData];
	});
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
	
	if (!cell) {
		cell = [[VideoCell alloc]init];
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	Video *video = [self.videoList objectAtIndex:indexPath.row];
	VideoCell *vidCell = (VideoCell*) cell;
	[vidCell updateUI:video];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Video *video = [self.videoList objectAtIndex:indexPath.row];

	[self performSegueWithIdentifier:@"VideoVC" sender:video];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.videoList.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

	VideoViewController *vc = (VideoViewController*)segue.destinationViewController;
	Video *video = (Video*)sender;
	
	vc.video = video;
	
}


@end
