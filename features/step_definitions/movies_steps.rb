
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  @movie_rows = Movie.count
  @all_ratings =Movie.select(:rating).map(&:rating).uniq
end

Then /the director of "([^"]*)" should be "([^"]*)"/ do |tit,dir|
  Movie.find_by_title(tit).director.should == dir
end