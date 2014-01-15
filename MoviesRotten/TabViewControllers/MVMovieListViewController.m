//
//  MVMovieListViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/13/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieListViewController.h"
#import "MVMovieTableViewCell.h"
#import "MVFlowManager.h"

@interface MVMovieListViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MVMovieListViewController
NSString * const CELL_IDENTIFIER = @"MovieCell";

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if(cell == nil)
    {
        //not added in viewdidLoad beacuse this class cannot access to tableview
        [tableView registerNib:[self createMovieTableCellNib] forCellReuseIdentifier:CELL_IDENTIFIER];
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    }
    
    if (self.movies)
    {
        MVMovie * movie = self.movies[indexPath.row];
        [cell SetMovie:movie];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UINib *)createMovieTableCellNib
{
   return [UINib nibWithNibName:NIB_ID_MOVIE bundle:[NSBundle mainBundle]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     MVMovieTableViewCell *cell = (MVMovieTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [[MVFlowManager sharedInstance] showMovieDetails:cell.movie];
}
@end
