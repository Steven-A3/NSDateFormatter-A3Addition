//
//  NSDateFormatter(A3Addition)
//  AppBox3
//
//  Created by Byeong Kwon Kwak on 2/8/14 3:40 PM.
//  Copyright (c) 2012 ALLABOUTAPPS. All rights reserved.
//

#import "NSDateFormatter+A3Addition.h"


@implementation NSDateFormatter (A3Addition)

- (NSString *)formatStringByRemovingYearComponent:(NSString *)originalFormat {
	NSArray *replaceArray = @[
			@"y 'm'. ", @"'de' y", @"y 'оны' ", @" y 'г'.", @" y 'ж'.", @" 'di' y", @"y년 ", @" y 'р'.",
			@"G y د ", @" G y", @" y G", @"y年", @"སྤྱི་ལོ་y ", @"y թ., ", @" 'lia' y", @" 'năm' y",
			@"y. 'gada' ", @"G y د ", @"G y "
	];

	for (NSString *yearComponent in replaceArray) {
		NSRange range = [originalFormat rangeOfString:yearComponent];
		if (range.location != NSNotFound) {
			return [originalFormat stringByReplacingOccurrencesOfString:yearComponent withString:@""];
		}
	}

	NSRange range = [originalFormat rangeOfString:@"MMMM y,"];
	if (range.location != NSNotFound) {
		return [originalFormat stringByReplacingOccurrencesOfString:@"MMMM y," withString:@"MMMM,"];
	}

	return [self formatStringByRemovingComponent:@"y" formFormat:originalFormat];
}

- (NSString *)formatStringByRemovingDateComponent:(NSString *)originalFormat {
	// Group 1, just removing specific component
	NSArray *replaceArray = @[
			@"dd/", @"/dd", @"/d", @"d. ", @"d.", @"dd.", @"d/", @"-dd", @"dd-", @"d-", @"d日", @"dd日",
			@"dd.", @"dད", @"d 'de' ", @"dd 'de' ",  @"d 'di' ", @" d일", @" d 'd'.",
			@"d 'ta'’ ",  @"d 'de' ", @"d 'da' ", @"ཙེས་d", @" ཚེས་dd",
	];

	for (NSString *yearComponent in replaceArray) {
		NSRange range = [originalFormat rangeOfString:yearComponent];
		if (range.location != NSNotFound) {
			return [originalFormat stringByReplacingOccurrencesOfString:yearComponent withString:@""];
		}
	}

	NSRange range = [originalFormat rangeOfString:@" d,"];
	if (range.location != NSNotFound) {
		return [originalFormat stringByReplacingOccurrencesOfString:@" d," withString:@","];
	}
	range = [originalFormat rangeOfString:@"'Ngày' dd 'tháng' M"];
	if (range.location != NSNotFound) {
		return [originalFormat stringByReplacingOccurrencesOfString:@"'Ngày' dd 'tháng' M" withString:@"'Tháng' M"];
	}

	return [self formatStringByRemovingComponent:@"d" formFormat:originalFormat];
}

- (NSString *)formatStringByRemovingComponent:(NSString *)componentSpecifier formFormat:(NSString *)originalFormat {
	NSMutableArray *formatComponents = [[originalFormat componentsSeparatedByString:@" "] mutableCopy];
	NSUInteger indexOfComponent = [formatComponents indexOfObjectPassingTest:^BOOL(NSString *obj, NSUInteger idx, BOOL *stop) {
		return [obj rangeOfString:componentSpecifier].location != NSNotFound;
	}];
	if (indexOfComponent != NSNotFound) {
		[formatComponents removeObjectAtIndex:indexOfComponent];
	}
	NSInteger idx = 0;
	NSMutableString *convertedFormat = [NSMutableString new];
	for (NSString *component in formatComponents) {
		[convertedFormat appendFormat:@"%@%@", component, idx == [formatComponents count] - 1 ? @"" : @" "];
		idx++;
	}
	return [convertedFormat stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",.، "]];
}

@end
