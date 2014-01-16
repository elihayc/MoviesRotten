//
//  MVMovieDetailViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/14/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieDetailViewController.h"

@interface MVMovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;
@property (nonatomic) BOOL isFavorite;
@end

@implementation MVMovieDetailViewController

- (void)setIsFavorite:(BOOL)isFavorite
{
    _isFavorite = isFavorite;
    NSString* iconImageName = isFavorite ? @"favoriteOn" : @"favoriteOff";
    [self.favoriteBtn setBackgroundImage:[UIImage imageNamed:iconImageName] forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    self.movieName.text = [NSString stringWithFormat:@"%@ (%d)", self.movie.title, self.movie.year];
    
    //containObject is using isEqual method.
    self.isFavorite = [self.appData.user.favoriteMovies containsObject:self.movie];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (IBAction)favoriteBtnClick:(UIButton *)sender
{
    self.isFavorite = !self.isFavorite;
    if(self.isFavorite)
    {
        [self.appData.user.favoriteMovies addObject:self.movie];
    }
    else
    {
        [self.appData.user.favoriteMovies removeObject:self.movie];
    }
    
    // save the favorite movies changes
    [[MVUserRepository sharedInstance] saveUser:self.appData.user];
}

@end
