//
//  secondPage.h
//  ANiOSStudy
//
//  Created by Anson on 2017/2/10.
//  Copyright © 2017年 An. All rights reserved.
//

#import "ANBaseViewController.h"
/**
 * secondPage
 */
@interface secondPageVC : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *secondPageview;
}

@property(strong,nonatomic)UITableView *secondPageview;
@end
