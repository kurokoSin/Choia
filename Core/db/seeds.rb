# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comix.create(:name => 'Helck', :publisher => 'SHOUGAKUKAN', :comic_name => 'URA-SANDY', :book_name => 'Helck 12', :author => 'Nanao Nanaki', :publish_date => '20180516', :is_adult => 0, :isbn_code => 'ISBN978-4-09-128294-1' );
Comix.create(:name => 'Helck', :publisher => 'SHOUGAKUKAN', :comic_name => 'URA-SANDY', :book_name => 'Helck 11', :author => 'Nanao Nanaki', :publish_date => '20171120', :is_adult => 0, :isbn_code => 'ISBN978-4-09-128025-1' );
Comix.create(:name => 'MADE IN ABYSS', :publisher => 'Take SHOBO', :comic_name => 'Web Comic Ganma', :book_name => 'MADE IN ABYSS 1', :author => 'Tsukushi Akihito', :publish_date => '20130814', :is_adult => 0, :isbn_code => 'ISBN978-4-8124-8380-0' );

