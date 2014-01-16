//
//  MVUserProfileViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/9/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVUserProfileViewController.h"

#import "MVLoginViewController.h"
#import "MVMovieTableViewCell.h"
#import "MVTableHeaderUserDetailsView.h"

@interface MVUserProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *favoriteMoviesTable;

@property (nonatomic, strong) IBOutlet MVTableHeaderUserDetailsView *tableHeaderView;

@end

@implementation MVUserProfileViewController

NSString * const USER_CELL_IDENTIFIER = @"MovieCell";

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    UINib * nib = [UINib nibWithNibName:NIB_ID_MOVIE bundle:[NSBundle mainBundle]];
    [self.favoriteMoviesTable registerNib:nib forCellReuseIdentifier:USER_CELL_IDENTIFIER];
    
    [self loadtableHeaderFromNib];
       
    self.favoriteMoviesTable.tableHeaderView = self.tableHeaderView;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.tableHeaderView setUserDetails:self.appData.user];
    [self.favoriteMoviesTable reloadData];
}

- (IBAction)logoutClick:(UIButton *)sender
{
    self.appData.user = nil;
    [self.appData.faceBookMgr logout];
    [self showLoginScreen:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:USER_CELL_IDENTIFIER];
    
    MVMovie * movie = self.appData.user.favoriteMovies[indexPath.row];
    [cell SetMovie:movie];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appData.user.favoriteMovies.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVMovieTableViewCell *cell = (MVMovieTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [[MVFlowManager sharedInstance] showMovieDetails:cell.movie];
}

-(void)loadtableHeaderFromNib
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:NIB_ID_TABLE_HEADER_USER owner:self options:nil];
    self.tableHeaderView = topLevelObjects[0];
}
@end
