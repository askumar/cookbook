# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.destroy_all
user = User.create!(:email => 'admin@cookbook.com', :password => 'password', :password_confirmation => 'password')
user.update_attribute(:admin, true)
User.create!(:email => 'user@cookbook.com', :password => 'password', :password_confirmation => 'password')

Recipe.destroy_all
videos = Dir.glob(Rails.public_path + '/videos/*').collect{ |fn| File.basename(fn) }
names = [ 'Make a pizza', 'Make a pasta', 'Make a burrito', 'Boil an egg', 'Make a taco', 'How to bake a bread', 'Mix a coctail', 'Fry a fish' ]
5.times do
  Recipe.create!(:name => names.sample, :category => Recipe::CATEGORIES.sample, :instructions => 'Instructions to make a pizza', :video => videos.sample )
end
