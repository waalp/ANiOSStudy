//
//  ViewController.h
//  ANiOSStudy
//
//  Created by Anson on 2017/1/17.
//  Copyright © 2017年 An. All rights reserved.
//

#ifndef ViewController_h
#define ViewController_h


#endif /* ViewController_h */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    NSArray *array;
    NSArray *arrayImage;
    NSArray *arrayImage1;
    UITableViewCellEditingStyle _editingStyle;
}

@property(strong,nonatomic)UITableView *tableview;
@property(strong,nonatomic)NSArray *array;
@property(strong,nonatomic)NSArray *arrayImage;
@property(strong,nonatomic)NSArray *arrayImage1;
@property(nonatomic,retain)NSMutableArray *data;

@end
