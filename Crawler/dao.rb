# -*- coding: utf-8 -*-
require 'rubygems'
require 'dbi'




def Connect
	@dbh = DBI.connect('DBI:SQLite3:../DB/choia.sqlite3')
end

def InsertBook( ComixName, Author, PublishDate, ComixName)

end

def SelectBook()
	dbh.select_all( 'select * from books') do |row|
		print "row = #{row} \n"
	        print "name = #{row[0]} \n"
       		print "name = #{row[1]} \n"
		print "\n"
	end
end

def DisConnect
	dbh.disconnect
end
