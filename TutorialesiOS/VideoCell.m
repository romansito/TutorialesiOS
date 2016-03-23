//
//  VideoCell.m
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/22/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;
@property (weak, nonatomic) IBOutlet UIView *contectView;

@end

@implementation VideoCell

- (void)awakeFromNib {
	self.layer.cornerRadius = 2.0;
	self.layer.shadowColor =
	[UIColor colorWithRed: 157.0 / 255.0 green: 157.0 / 255.0 blue: 157.0 / 255/0 alpha: 0.8].CGColor;
	self.layer.shadowOpacity = 0.8;
	self.layer.shadowRadius = 5.0;
	self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

- (void)updateUI:(nonnull Video*)video {
	
	self.titleLabel.text = video.videoTitle;
	self.DescriptionLabel.text = video.videDescription;
	
	UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailURL]]];
	self.imageLabel.image = image;
	NSLog(@"IMAGE: %@", image);
}


@end
