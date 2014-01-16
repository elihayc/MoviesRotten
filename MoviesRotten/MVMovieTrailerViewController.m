//
//  MVMovieTrailerViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/16/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieTrailerViewController.h"
#import "MVMovieClip.h"
@interface MVMovieTrailerViewController ()<MVRottenLoadData>
@property (weak, nonatomic) IBOutlet UIWebView *trailerWebView;

@end

@implementation MVMovieTrailerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
     [self.appData.rottenTomatoMgr getMovieClipsByID:self.movieID delegate:self];
}

- (void)operation:(RKObjectRequestOperation*)operation didCompleteWithData:(RKMappingResult*)data
{
    if (data.array.count > 0)
    {
        MVMovieClip *clip = data.array[0];
        NSURL *url = [NSURL URLWithString:clip.links[@"alternate"]];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.trailerWebView loadRequest:requestObj];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (self.trailerWebView.loading)
    {
        [self.trailerWebView stopLoading];
    }
}
@end
