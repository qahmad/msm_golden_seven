class MoviesController < ApplicationController

  def new_form
    render("movie_templates/new_form.html.erb")
  end

  def create_row

    movie = Movie.new
    movie.title = params["movie_title"]
    movie.year = params["movie_year"]
    movie.duration = params["movie_duration"]
    movie.description = params["movie_description"]
    movie.image_url = params["movie_image"]
    movie.save

    redirect_to("/movies")
    
  end
    
  def index
    @movies = Movie.all.order('created_at DESC')

    render("movie_templates/index.html.erb")
  end 

  def show
    @movie = Movie.find_by({ :Id => params["an_id"] })
    render("movie_templates/show.html.erb")
  end
  
  def edit_form
    @movie = Movie.find_by({ :Id => params["some_id"] })
    render("movie_templates/edit_form.html.erb")
  end
  
  def update_row
    movie = Movie.find_by({ :Id => params["the_id"] })
    movie.title = params["movie_title"]
    movie.year = params["movie_year"]
    movie.duration = params["movie_duration"]
    movie.description = params["movie_description"]
    movie.image_url = params["movie_image"]
    movie.save
    
    redirect_to("/movies/" + movie.id.to_s)
  end 
  
  def destroy_row
    movie = Movie.find_by({ :Id => params["toast_id"] })
    movie.destroy

    redirect_to("/movies")
  end 

end
