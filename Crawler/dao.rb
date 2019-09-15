# -*- coding: utf-8 -*-
require 'rubygems'
require 'dbi'



# Connect -> Disconnect
def Connect
	@dbh = DBI.connect('DBI:SQLite3:../DB/choia.sqlite3')
end
def DisConnect
	@dbh.disconnect
end

# Transaction Begin, Commit, RollBack
def TransactionBegin()
	@dbh.do("BEGIN")
end
def TransactionCommit()
	@dbh.do("COMMIT")
end
def TransactionRollBack()
	@dbh.do("ROLLBACK")
end

# Each Tables 
def InsertBook( ComixName, Author, PublishDate, ComixName)
	@dbh.do("INSERT INTO books (id, name, height) VALUES (?, ?, ? )",
		ComixName, Author, PublishDate, ComixName)
end

def SelectBook()
	@dbh.select_all( 'select * from books') do |row|
		print "row = #{row} \n"
	        print "name = #{row[0]} \n"
       		print "name = #{row[1]} \n"
		print "\n"
	end
end

