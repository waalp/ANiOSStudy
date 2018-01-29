//
//  FirstTableView.m
//  ANiOSStudy
//
//  Created by Anson on 2017/1/17.
//  Copyright © 2017年 An. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "ANFirstPage.h"
#import "ANBaseViewController.h"
#import "UIKit/UIKit.h"

@interface ViewController()

@end

@implementation ViewController

@synthesize tableview;
@synthesize array;
@synthesize arrayImage;
@synthesize arrayImage1;


-(void)viewDidLoad
{
    [super viewDidLoad];
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height ) style:UITableViewStyleGrouped];
 
    tableview.dataSource = self;
    tableview.delegate = self;
    
    tableview.backgroundView = [[UIView alloc]init];
    tableview.backgroundColor = [UIColor clearColor];
    
    
    [self.view addSubview:tableview];
    
    

    NSMutableArray *arrayValue = [[NSMutableArray alloc]init];
    NSMutableArray *arrayImageValue = [[NSMutableArray alloc]init];
    NSMutableArray *arrayImageValue2 = [[NSMutableArray alloc]init];
    
    
    for (int i = 0; i < 5; i++) {
        NSString *value = [NSString stringWithFormat:@"%d",i];
        NSString *imageName = [NSString stringWithFormat:@"image%@.jpg",value];
        UIImage *image = [UIImage imageNamed:imageName];
        NSLog(@"imageName == %@",imageName);
        [arrayImageValue addObject:image];
        [arrayValue addObject:value];
        //NSLog(@"%@",imageName);
    }
    
    for (int i = 5; i <= 9; i++) {
        NSString *value = [NSString stringWithFormat:@"%d",i];
        NSString *imageName = [NSString stringWithFormat:@"image%@.jpg",value];
        UIImage *image = [UIImage imageNamed:imageName];
        NSLog(@"image2Name == %@",imageName);
        [arrayImageValue2 addObject:image];
    }
    array = arrayValue;
    arrayImage = arrayImageValue;
    arrayImage1 = arrayImageValue2;
    
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc]initWithTitle:@"移动" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMove)];
    self.navigationItem.rightBarButtonItem = moveButton;
    UIImage *backImageName = [UIImage imageNamed:@"timg.jpg"];
    UIImageView *taleviewBackImageView = [[UIImageView alloc]initWithImage:backImageName];
    [self.tableview setBackgroundView:taleviewBackImageView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Hello I am First Footer";
    }
    else
    {
        return @"Hello I am second Footer";
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Nice to meet you,I am first Header";
    }
    else
    {
        return @"Nice to meet you,I am second Header";
    }
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"I am button 1" forState:UIControlStateNormal];
        return button;
    }
    else
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"I am button 2" forState:UIControlStateNormal];
        return button;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"%ld",(long)section);
    if (section == 0) {
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
        label1.text = @"I am a good man";
        label1.backgroundColor = [UIColor yellowColor];
        return label1;
    }
    else
    {
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
        label2.text = @"我是程序员";
        label2.backgroundColor = [UIColor blueColor];
        return label2;
    }
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 10;
    }
    else{
        return 0;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
//    UIImageView *cellimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timg.jpg"]];
//    cell.selectedBackgroundView = cellimageView;
    if (cell == nil) {
       cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier];
        cell.showsReorderControl = YES;  ///重新排序控件
    }
    
    if (indexPath.section == 0) {
        cell.imageView.image = [arrayImage objectAtIndex:[indexPath row]];
    }
    
    else
    {
        cell.imageView.image = [arrayImage1 objectAtIndex:[indexPath row]];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = [array objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text = [array objectAtIndex:[indexPath row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *titleString = [array objectAtIndex:[indexPath row]];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:titleString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
    ANFirstPage *commentVC = [[ANFirstPage alloc]init];
    [self.navigationController pushViewController:commentVC animated:YES];
}

-(void)toggleMove
{
    [self.tableview setEditing:!self.tableview.editing animated:YES];///初始化时默认不可编辑 点击事件的时候取反为真！可编辑。
    if (self.tableview.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"移动"];
    }
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath{
    NSUInteger fromRow = [sourceIndexPath row];  //要移动的那个cell integer
    NSUInteger toRow = [destinationIndexPath row]; //要移动位置的那个clell integer
    ///arrayValue 添加数据的那个可变数组
    id object = [array objectAtIndex:fromRow];
    [array removeObserver:object fromObjectsAtIndexes:object forKeyPath:0 context:toRow];
    
}


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.array removeObjectAtIndex:[indexPath]];
//        [tableView delete]
    }
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
