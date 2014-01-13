//
//  MVSearchMovieViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/9/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVSearchMovieViewController.h"

@interface MVSearchMovieViewController ()<MVRottenLoadData, UISearchBarDelegate, UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *moviesTable;
@end

@implementation MVSearchMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTableView:self.moviesTable];

    [self.appData.rottenTomatoMgr searchMovie:@"kill bill" delegate:self];
}

- (void)operation:(RKObjectRequestOperation *)operation didCompleteWithData:(RKMappingResult *)data
{
    self.movies = data.array;
    [self.moviesTable reloadData];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self.appData.rottenTomatoMgr searchMovie:searchString delegate:self];
    
    return YES;
}
@end
