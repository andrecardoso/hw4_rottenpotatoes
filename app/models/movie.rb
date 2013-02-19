class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def similar
    Movie.find_all_by_director(director)
  end
  
  def director_empty?
    director == nil || director.empty?
  end
end
