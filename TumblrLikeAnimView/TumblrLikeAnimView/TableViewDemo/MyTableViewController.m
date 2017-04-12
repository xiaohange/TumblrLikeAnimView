//
//  MyTableViewController.m

//
//  Created by 韩俊强 on 2017/4/11.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "UIView+Frame.h"

#define KPraiseBtnWH          30
#define KBorkenTime          0.8f
#define KToBrokenHeartWH    120/195

@interface MyTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"myCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.objc = nil;
    
    cell.LoveButtonClick = ^(){
        [self loveButtonBy:indexPath];
    };
 
    return cell;
}

- (void)loveButtonBy:(NSIndexPath*)indexPath
{
    [self playAnimation:indexPath];
    MyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    cell.praiseBtn.userInteractionEnabled = NO;
    cell.praiseBtn.selected = !cell.praiseBtn.selected;
}

-(void)playAnimation:(NSIndexPath*)indexpath{
    MyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexpath.row inSection:indexpath.section]];
    
    if (!cell.praiseBtn.selected) {
        cell.coverBtn.alpha = 1;
        [UIView animateWithDuration:1.0f animations:^{
            cell.coverBtn.frame = CGRectMake(cell.praiseBtn.frame.origin.x, cell.praiseBtn.frame.origin.y-70, KPraiseBtnWH*2, KPraiseBtnWH*2);
            
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
            NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*5];
            NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*5];
            NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*5];
            anima.values = @[value1,value2,value3];
            anima.repeatCount = MAXFLOAT;
            [cell.coverBtn.layer addAnimation:anima forKey:nil];
            
            cell.coverBtn.alpha = 0;
            cell.coverBtn.centerX = cell.praiseBtn.centerX;
        } completion:^(BOOL finished) {
            cell.coverBtn.frame = cell.praiseBtn.frame;
            cell.praiseBtn.userInteractionEnabled = YES;
        }];
    } else {
        cell.cancelPraiseImg.hidden = NO;
        NSArray *imgArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"icon_like_broken1"],[UIImage imageNamed:@"icon_like_broken2"],[UIImage imageNamed:@"icon_like_broken3"],[UIImage imageNamed:@"icon_like_broken4"], nil];
        cell.cancelPraiseImg.animationImages = imgArr;
        cell.cancelPraiseImg.animationDuration = KBorkenTime;
        cell.cancelPraiseImg.animationRepeatCount = 1;
        [cell.cancelPraiseImg startAnimating];
        
        [UIView animateWithDuration:KBorkenTime animations:^{
            cell.cancelPraiseImg.frame = CGRectMake(cell.praiseBtn.frame.origin.x-15, cell.praiseBtn.frame.origin.y, KPraiseBtnWH*2, KPraiseBtnWH*2*KToBrokenHeartWH);
            cell.cancelPraiseImg.alpha = 0;
        }completion:^(BOOL finished) {
            cell.cancelPraiseImg.frame = CGRectMake(cell.praiseBtn.frame.origin.x-15, cell.praiseBtn.frame.origin.y-40, KPraiseBtnWH*2, KPraiseBtnWH*2*KToBrokenHeartWH);
            cell.cancelPraiseImg.alpha = 1;
            cell.praiseBtn.userInteractionEnabled = YES;
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
