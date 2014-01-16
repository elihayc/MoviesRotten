//
//  MVMovieTableViewCell.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/13/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieTableViewCell.h"

@interface MVMovieTableViewCell()
@property (nonatomic, weak) IBOutlet UILabel * movieName;
@property (weak, nonatomic) IBOutlet UITextView *movieDescription;
@end

@implementation MVMovieTableViewCell

//TODO: DELETE initWithStyle
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//        [self.movieDescription setUserInteractionEnabled:NO];
//    }
//    return self;
//}

-(void)SetMovie:(MVMovie *)movie
{
    self.movieName.text = [NSString stringWithFormat:@"%@ (%d)", movie.title, (int)movie.year];
    self.movieDescription.text = movie.synopsis.length <= 190 ? movie.synopsis :[NSString stringWithFormat:@"%@...", [movie.synopsis substringToIndex:190]];
    
    
    
    self.movie = movie;
}


@end
