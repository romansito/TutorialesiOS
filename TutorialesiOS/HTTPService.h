//
//  HTTPService.h
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/21/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^onComplete) (NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
