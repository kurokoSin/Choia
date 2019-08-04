sqlite> select * from sqlite_master;
table|books|books|3|CREATE TABLE "books" (
	"myId"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Publisher"	TEXT,
	"ComicName"	TEXT,
	"BookName"	TEXT,
	"Author"	TEXT,
	"PublishDate"	TEXT,
	"IsAdult"	INTEGER,
	"BookImage"	BLOB,
	"ISBN_Code"	TEXT,
	"OtherInfo"	TEXT,
	"SeriesName"	TEXT
)
table|sqlite_sequence|sqlite_sequence|4|CREATE TABLE sqlite_sequence(name,seq)

