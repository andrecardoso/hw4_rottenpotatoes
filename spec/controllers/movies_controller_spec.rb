require "spec_helper"

describe MoviesController do
  describe "search movies from same director" do
    
    before :each do
      @movie1 = Movie.new
      @movie1.director = "director"
      @fake_results = [mock('movie2'), mock('movie3')]
      @movie1.stub(:similar).and_return(@fake_results)
    end
    
    it "should load the current movie" do
      Movie.should_receive(:find).with("1").and_return(@movie1)
      get :similar, :id => 1
    end
    
    it "should call model method to get the movies from the same director" do
      @movie1.should_receive(:similar).and_return(@fake_results)    
      Movie.stub(:find).with("1").and_return(@movie1)

      get :similar, :id => 1      
    end
    
    it "should render the similar movies template" do
      Movie.stub(:find).with("1").and_return(@movie1)

      get :similar, :id => 1

      response.should render_template('similar')
    end
    
    it "should make the movies available to the template" do
      Movie.stub(:find).with("1").and_return(@movie1)

      get :similar, :id => 1
      
      assigns(:movies).should == @fake_results
    end
    
    it "should redirect to home if there is no director" do
      movie4 = Movie.new
      Movie.stub(:find).with("4").and_return(movie4)

      get :similar, :id => 4
      
      response.should redirect_to movies_path
    end
    
  end
end