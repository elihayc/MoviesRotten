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
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@end

@implementation MVSearchMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center =self.moviesTable.center;
    [self.view addSubview: self.spinner];
    
}

- (void)operation:(RKObjectRequestOperation *)operation didCompleteWithData:(RKMappingResult *)data
{
    self.movies = data.array;
    [self.moviesTable reloadData];
    
    [self.spinner stopAnimating];
    
}

#pragma mark - UISearchDisplayController Delegate Methods
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.appData.rottenTomatoMgr searchMovie:self.searchBar.text delegate:self];
    [self.searchBar resignFirstResponder];
    
    [self.spinner startAnimating];
}

@end
