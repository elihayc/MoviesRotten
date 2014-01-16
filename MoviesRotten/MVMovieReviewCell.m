//
//  MVMovieReviewCell.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/16/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieReviewCell.h"

@interface MVMovieReviewCell()
@property (weak, nonatomic) IBOutlet UITextView *reviewQuote;
@property (weak, nonatomic) IBOutlet UILabel *reviewCritic;
@end

@implementation MVMovieReviewCell

- (void)setMovieReview:(MVMovieReview*)movieReview
{
    self.reviewQuote.text = movieReview.quote;
    self.reviewCritic.text = [NSString stringWithFormat:@"%@ (%@)",movieReview.critic, movieReview.date];
}

@end
