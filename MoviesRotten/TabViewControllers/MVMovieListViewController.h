//
//  MVMovieListViewController.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/13/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVBaseViewController.h"

@interface MVMovieListViewController : MVBaseViewController
- (UINib *)createMovieTableCellNib;

@property (nonatomic, strong) NSArray * movies;

@end
