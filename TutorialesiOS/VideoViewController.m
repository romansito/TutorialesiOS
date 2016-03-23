//
//  VideoViewController.m
//  TutorialesiOS
//
//  Created by Roman Salazar Lopez on 3/22/16.
//  Copyright © 2016 Roman Salazar Lopez. All rights reserved.
//

#import "VideoViewController.h"
#import "Video.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoViewController
- (IBAction)doneButton:(id)sender {
	
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.webView.delegate = self;
	
	self.titleLabel.text = self.video.videoTitle;
	self.descriptionLabel.text = self.video.videDescription;
	[self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	
	NSString *css = @" .container { position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
	
	NSString* js = [NSString stringWithFormat:
					@"var styleNode = document.createElement('style');\n"
					"styleNode.type = \"text/css\";\n"
					"var styleText = document.createTextNode('%@');\n"
					"styleNode.appendChild(styleText);\n"
					"document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
	NSLog(@"js:\n%@",js);
	[self.webView stringByEvaluatingJavaScriptFromString:js];
	
}


@end
