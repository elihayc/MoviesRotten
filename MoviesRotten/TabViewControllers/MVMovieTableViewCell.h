//
//  MVMovieTableViewCell.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/13/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVMovie.h"
@interface MVMovieTableViewCell : UITableViewCell
@property(nonatomic, strong) MVMovie * movie;
-(void)SetMovie:(MVMovie *)movie;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end
