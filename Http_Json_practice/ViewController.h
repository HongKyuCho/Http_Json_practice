//
//  ViewController.h
//  Http_Json_practice
//
//  Created by 조홍규 on 2017. 2. 2..
//  Copyright © 2017년 조홍규. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) NSArray *jsonArray;
@property (strong, nonatomic) NSMutableData *data;

@end
    
