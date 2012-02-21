    
#import "UIQueryTableView.h"


@implementation UIQueryTableView

-(UIQuery *)scrollDown:(int)numberOfRows {
	//NSLog(@"scrollDown %d", numberOfRows);
	UITableView *table = self;
	NSArray *indexPathsForVisibleRows = [table indexPathsForVisibleRows];
	NSArray *rowIndexPathList = [self rowIndexPathList];
	
	//NSLog(@"indexPathsForVisibleRows = %@", indexPathsForVisibleRows);
	NSIndexPath *indexPathForLastVisibleRow = [indexPathsForVisibleRows lastObject];
	
	int indexOfLastVisibleRow = [rowIndexPathList indexOfObject:indexPathForLastVisibleRow];
	//NSLog(@"indexOfLastVisibleRow = %d", indexOfLastVisibleRow);
	int scrollToIndex = indexOfLastVisibleRow + numberOfRows;
	if (scrollToIndex >= rowIndexPathList.count) {
		scrollToIndex = rowIndexPathList.count - 1;
	}
	NSIndexPath *scrollToIndexPath = [rowIndexPathList objectAtIndex:scrollToIndex];
	[table scrollToRowAtIndexPath:scrollToIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollUp:(int)numberOfRows {
	//NSLog(@"scrollUp %d", numberOfRows);
   	UITableView *table = self;
   	NSArray *indexPathsForVisibleRows = [table indexPathsForVisibleRows];
   	NSArray *rowIndexPathList = [self rowIndexPathList];

   	//NSLog(@"indexPathsForVisibleRows = %@",indexPathsForVisibleRows);
   	NSIndexPath *indexPathForFirstVisibleRow = [indexPathsForVisibleRows firstObject];

   	int indexOfFirstVisibleRow = [rowIndexPathListindexOfObject:indexPathForFirstVisibleRow];

   	//NSLog(@"indexOfLastVisibleRow = %d", indexOfFirstVisibleRow);
   	int scrollToIndex = indexOfFirstVisibleRow - numberOfRows;
   	if (scrollToIndex >= rowIndexPathList.count) {
       		scrollToIndex = rowIndexPathList.count - 1 ;
    	}
   	NSIndexPath *scrollToIndexPath = [rowIndexPathList objectAtIndex:scrollToIndex];
   	[table scrollToRowAtIndexPath:scrollToIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        return [UIQuery withViews:views className:className];
}

-(NSArray *)rowIndexPathList {
	UITableView *table = (UITableView *)self;
	NSMutableArray *rowIndexPathList = [NSMutableArray array];
	int numberOfSections = [table numberOfSections];
	for(int i=0; i< numberOfSections; i++) {
		int numberOfRowsInSection = [table numberOfRowsInSection:i];
		for(int j=0; j< numberOfRowsInSection; j++) {
			[rowIndexPathList addObject:[NSIndexPath indexPathForRow:j inSection:i]];
		}
	}
	//NSLog(@"sectionList size = %d", sectionList.count);
	return rowIndexPathList;
}

@end
