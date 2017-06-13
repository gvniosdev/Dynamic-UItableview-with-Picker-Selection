
#import "ProductTableVC.h"
#import "customCell.h"

@interface ProductTableVC ()

@end

@implementation ProductTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"DETAILS";
    
    arrProductTitle = [[NSMutableArray alloc]initWithObjects:@"title0",@"title1",@"title2",@"title3",@"title4",@"title5",@"title6",@"title7",@"title8",@"title9",@"title10",@"title11",@"title12",@"title13",@"title14",@"title15", nil];
    
    //arrProductVal = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
    arrProductVal = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrProductTitle.count-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    
    customCell *cell1=[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell1 == nil)
    {
        cell1 = [[customCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell1.productTitleLabel.text =[arrProductTitle objectAtIndex:indexPath.row];
    
    self.downPicker = [[DownPicker alloc] initWithTextField:cell1.productvalueTextfield withData:arrProductVal];
    
    [self.downPicker addTarget:self action:@selector(measurementSelected:) forControlEvents:UIControlEventValueChanged];
    [cell1.contentView addSubview:self.downPicker];
    
    return cell1;
}




-(void)measurementSelected:(id)dp {
    NSString* selectedValue = [dp text];
    //    selectedIndex
    NSLog(@"SELECTED TAG:::::::%ld",[dp tag]);
    NSLog(@"SELECTED VALUE:::::::%@",selectedValue);
    NSLog(@"SELECTED INDEX VALUEEEEEEEEEEE:::::::%ld",[dp selectedIndex]);
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
