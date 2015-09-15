class LandingsController < ApplicationController
  def index
    @subjects = Subject.all
    
  end
end
