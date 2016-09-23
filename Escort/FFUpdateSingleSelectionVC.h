//
//  FFUpdateSingleSelectionVC.h
//  FFEscort
//
//  Created by fanly frank on 9/21/16.
//  Copyright © 2016 Dazzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FFUpdateSingleSelectionVCDelegate <NSObject>

@required
- (void)updateSingleSelectionVCDidSelectValue:(NSString *)value for:(NSIndexPath *)indexPath;

@end

@interface FFUpdateSingleSelectionVC : UITableViewController

@property (strong, nonatomic) NSArray *datas;

@property (copy, nonatomic) NSString *selectedStr;

@property (strong, nonatomic) NSIndexPath *indexPath;

@property (copy, nonatomic) NSString *currentSelectedStr;

@property (weak, nonatomic) id<FFUpdateSingleSelectionVCDelegate> delegate;

@end
