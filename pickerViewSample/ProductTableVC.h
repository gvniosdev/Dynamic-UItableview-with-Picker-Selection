

#import <UIKit/UIKit.h>
#import "DownPicker.h"

@interface ProductTableVC : UITableViewController<UITableViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray *arrProductTitle, *arrProductVal;
}
@property (strong, nonatomic) DownPicker *downPicker;
@property (strong, nonatomic) NSMutableDictionary *dict;
@property (strong, nonatomic) NSMutableArray *arr;
@end

