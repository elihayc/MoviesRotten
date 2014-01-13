//
//  MVTheatersMoviesViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/9/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVTheatersMoviesViewController.h"

@interface MVTheatersMoviesViewController () <MVRottenLoadData>
@property (weak, nonatomic) IBOutlet UITableView *moviesTable;
@end

@implementation MVTheatersMoviesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.appData.rottenTomatoMgr loadTheatersMovies:self];
}

- (void)operation:(RKObjectRequestOperation*)operation didCompleteWithData:(RKMappingResult*)data
{
    self.movies = data.array;
    [self.moviesTable reloadData];
}


@end
