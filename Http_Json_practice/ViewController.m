//
//  ViewController.m
//  Http_Json_practice
//
//  Created by 조홍규 on 2017. 2. 2..
//  Copyright © 2017년 조홍규. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
    NSURL *url = [NSURL URLWithString:@"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=18d789995cb2a9451b1627f5774bb9e3&targetDt=20170101"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_jsonArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [[_jsonArray objectAtIndex:indexPath.row]objectForKey:@"movieNm"];
    
    return  cell;
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _data = [[NSMutableData alloc]init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    _jsonArray = [NSJSONSerialization JSONObjectWithData:_data options:nil error:nil];
    [_mainTableView reloadData];
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please check the connection" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [myAlertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [myAlertController addAction:ok];
    [self presentViewController:myAlertController animated:YES completion:nil];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}



@end
