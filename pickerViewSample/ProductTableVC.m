
#import "ProductTableVC.h"
#import "customCell.h"

@interface ProductTableVC ()

@end

@implementation ProductTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"DETAILS";
    _dict = [[NSMutableDictionary alloc]init];
    _arr = [[NSMutableArray alloc]init];
    
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
    NSLog(@"%@",_dict);
    NSLog(@"%@",[NSString stringWithFormat:@"%ld",(long)indexPath.row]);
    
    NSString *oKey = [_dict.allKeys firstObject];
    NSLog(@"%@",oKey);
    if (_dict[[NSString stringWithFormat:@"%ld",(long)indexPath.row]]) {
        //cell1.productvalueTextfield.text = @"";
        // aDic has a entry named "foo"
        cell1.productvalueTextfield.text =[_dict valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    } else {
        // "foo" doesn't exsits
        cell1.productvalueTextfield.text = @"";
        self.downPicker = [[DownPicker alloc] initWithTextField:cell1.productvalueTextfield withData:arrProductVal];
        self.downPicker.tag = indexPath.row;
        
        [self.downPicker addTarget:self action:@selector(measurementSelected:) forControlEvents:UIControlEventValueChanged];
        [cell1.contentView addSubview:self.downPicker];
    }
    
    
    return cell1;
}




-(void)measurementSelected:(id)dp {
    
    NSString* selectedValue = [dp text];
    NSString* selectedIndex = [NSString stringWithFormat:@"%ld",(long)[dp tag]];
    [_dict setValue:[dp text] forKey:selectedIndex];
    NSLog(@"_dict: %@",_dict);
    
    [_arr addObject:_dict];
    NSLog(@"_arr: %@",_arr);
    
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
