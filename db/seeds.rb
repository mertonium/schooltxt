# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[
  {:name=>"Mt. Pleasant School District"},
  {:name=>"San Francisco Unified"},
  {:name=>"Dickenson County"},
  {:name=>"Wm S. Hart School District"},
  {:name=>"The Logan Hockings School District"},
].each do |attributes|  
  District.find_or_create_by_name(attributes)
end
