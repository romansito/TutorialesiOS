//
//  VideoCell.h
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/22/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)updateUI:(nonnull Video*)video;

@end
