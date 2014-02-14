NSDateFormatter-A3Addition
==========================

## Usage

	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateStyle:NSDateFormatterStyleFullStyle];
	NSString *resultString = [dateFormatter stringFromDate:[NSDate date]];

	NSString *dateFormat = [dateFormatter formatStringByRemovingYearComponent:dateFormatter.dateFormat];
	[dateFormatter setDateFormat:dateFormat];
	NSString *resultString = [dateFormatter stringFromDate:[NSDate date]];

	NSString *dateFormat = [dateFormatter formatStringByRemovingYearComponent:dateFormatter.dateFormat];
	[dateFormatter setDateFormat:dateFormat];
	NSString *resultString = [dateFormatter stringFromDate:[NSDate date]];

## Output

	Locale: en_US, NSDateFormatterLongStyle
	[ MMMM d, y ]	[ February 14, 2014 ] 	: Original style
	[ MMMM d ]	[ February 14 ]			: Omitting Year
	[ MMMM, y ]	[ February, 2014 ]		: Omitting Day

	Locale: ja_JP, NSDateFormatterLongStyle
	[ y年M月d日 ]	[ 2014年2月14日 ]
	[ M月d日 ]		[ 2月14日 ]
	[ y年M月 ]		[ 2014年2月 ]

	Locale: de_DE
	[ d. MMMM y ]	[ 14. Februar 2014 ]
	[ d. MMMM ]	[ 14. Februar ]
	[ MMMM y ]	[ Februar 2014 ]
