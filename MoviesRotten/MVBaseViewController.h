//
//  MVBaseViewController.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/10/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVFlowManager.h"
#import "MVUserRepository.h"

@interface MVBaseViewController : UIViewController
@property (nonatomic, weak,readonly) MVAppData * appData;

-(void)showLoginScreen:(BOOL)asRoot;
@end
