//
//  Video.h
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/22/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnailURL;

@end
