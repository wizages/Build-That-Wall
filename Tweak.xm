static NSInteger totalCount = 0;

@interface PSSwitchTableCell : UITableViewCell
-(void)setCellEnabled:(BOOL)arg1;
-(id)initWithStyle:(long long)arg1 reuseIdentifier:(id)arg2 specifier:(id)arg3;
-(void)setValue:(id)arg1;
@end

%hook PSUIPrivacyController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
    	totalCount = %orig;
    	return totalCount + 3;
    } else{
    	return %orig;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0 && indexPath.row >= totalCount){

		PSSwitchTableCell *cell = [[%c(PSSwitchTableCell) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"toggler" specifier:nil];
		if (indexPath.row == totalCount){
			cell.textLabel.text = @"CIA";
			cell.imageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/buildthatwallimages.bundle/cia.png"];
			CGSize itemSize = CGSizeMake(32, 32);
		    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
		    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		    [cell.imageView.image drawInRect:imageRect];
		    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		    UIGraphicsEndImageContext();
		}
		else if (indexPath.row == totalCount+1){
			cell.textLabel.text = @"FBI";
			cell.imageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/buildthatwallimages.bundle/fbi.png"];
			CGSize itemSize = CGSizeMake(32, 32);
		    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
		    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		    [cell.imageView.image drawInRect:imageRect];
		    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		    UIGraphicsEndImageContext();
		}
		else if (indexPath.row == totalCount+2){
			cell.textLabel.text = @"NSA";
			cell.imageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/buildthatwallimages.bundle/nsa.png"];
			CGSize itemSize = CGSizeMake(32, 32);
		    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
		    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		    [cell.imageView.image drawInRect:imageRect];
		    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		    UIGraphicsEndImageContext();
		}
		cell.imageView.frame = CGRectMake(0,0,32,32);

		[cell setValue:[NSNumber numberWithBool:true]];
		cell.accessoryType = UITableViewCellAccessoryNone;
		return cell;
	} else {
		return %orig;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row >= totalCount){
		
	} else {
		%orig;
	}
    
}


%end