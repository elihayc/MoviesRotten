//
//  MVMovieReviewsViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/16/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieReviewsViewController.h"
#import "MVMovieReview.h"
#import "MVMovieReviewCell.h"

@interface MVMovieReviewsViewController () <UITableViewDataSource, UITableViewDelegate,MVRottenLoadData>

@property (weak, nonatomic) IBOutlet UITableView *reviewsTable;

@property (strong, nonatomic) NSArray * movieReviews;

@end

@implementation MVMovieReviewsViewController

NSString * const MOVIE_REVIEW_CELL = @"reviewCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.appData.rottenTomatoMgr getMovieReviewsByID:self.movieID delegate:self];
}

- (void)operation:(RKObjectRequestOperation*)operation didCompleteWithData:(RKMappingResult*)data
{
    self.movieReviews = data.array;
    [self.reviewsTable reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVMovieReviewCell * cell = [tableView dequeueReusableCellWithIdentifier:MOVIE_REVIEW_CELL];
    
    MVMovieReview * review = self.movieReviews[indexPath.row];
    [cell setMovieReview:review];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieReviews.count;
}

@end
