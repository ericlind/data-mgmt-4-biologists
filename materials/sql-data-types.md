---
layout: page
element: notes
title: Data Types in SQL
language: SQL
---

### [Numeric data types](https://dev.mysql.com/doc/refman/5.7/en/numeric-type-overview.html)

Integers 

- `TINYNINT(M)`
	M = possible length of the integer
- `INT`
- `BOOLEAN`: a special integer

Decimals

- `DOUBLE(M, D)`
	D = number of digits following decimal point
	
### [String data types](https://dev.mysql.com/doc/refman/5.7/en/string-type-overview.html)

Variable-length strings 

- `VARCHAR(M)`

**B**inary **L**arge **OB**ject
- `BLOB`
- `LONGBLOB`
- [Bob Loblaw](https://www.youtube.com/watch?v=mwWAsNZTnug)

### [Date and Time data types](https://dev.mysql.com/doc/refman/5.7/en/date-and-time-type-overview.html)

- `DATE`
	MySQL stores dates as `YYYY-MM-DD`
	
- `DATETIME` 
	Can be precise to 6 decimal points as `YYYY-MM-DD HH:MM:SS[.fraction]`

- `YEAR`
	Four-digit year
	
