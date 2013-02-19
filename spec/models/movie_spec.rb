require "spec_helper"

describe Movie do
  describe "director empty" do
    it "should return true when nil" do
      movie = Movie.new
      movie.director = nil
      movie.director_empty?.should eq(true)
    end
    
    it "should return true when empty" do
      movie = Movie.new
      movie.director = ''
      movie.director_empty?.should eq(true)
    end
     
    it "should return false when fill" do
      movie = Movie.new
      movie.director = 'Spielberg'
      movie.director_empty?.should eq(false)
    end 
  end
  
  describe "similar" do
    it "should return similar movies" do
      movie = Movie.new
      movie.director = 'director'
      
      Movie.should_receive(:find_all_by_director).with(movie.director)
      
      movie.similar
    end
  end
end