//
//  OSCityShowViewController.h
//  oops
//
//  Created by sean on 15-4-1.
//  Copyright (c) 2015年 sean. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NSIndexPath;
@interface OSCityShowViewController : UIViewController{
    NSIndexPath *index;
    IBOutlet UITextField *descriptionView;
    IBOutlet UIImageView *pictureView;
}
- (id)initWithIndexPath:(NSIndexPath *)indexPath;
@end
