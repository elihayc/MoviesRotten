//
//  MVMovieListViewController.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/13/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovieListViewController.h"
#import "MVMovieTableViewCell.h"

@interface MVMovieListViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MVMovieListViewController
NSString * const CELL_IDENTIFIER = @"MovieCell";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if(cell == nil)
    {
        //not in viewdidLoad beacuse this class cannot access to tableview
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
    NSString *nibIdentifier = @"MVMovieTableViewCell";
    return [UINib nibWithNibName:nibIdentifier bundle:[NSBundle mainBundle]];
}

@end
