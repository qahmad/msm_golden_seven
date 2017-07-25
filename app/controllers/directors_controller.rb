class DirectorsController < ApplicationController

  def new_form
    render("director_templates/new_form.html.erb")
  end

  def create_row

    director = Director.new
    director.name = params["director_name"]
    director.bio = params["director_bio"]
    director.dob = params["director_dob"]
    director.image_url = params["director_image"]
    director.save

    redirect_to("/directors")
    
  end
    
  def index
    @directors = Director.all.order('created_at DESC')

    render("director_templates/index.html.erb")
  end 

  def show
    @director = Director.find_by({ :Id => params["an_id"] })
    render("director_templates/show.html.erb")
  end
  
  def edit_form
    @director = Director.find_by({ :Id => params["some_id"] })
    render("director_templates/edit_form.html.erb")
  end
  
  def update_row
    director = Director.find_by({ :Id => params["the_id"] })
    
    director.name = params["director_name"]
    director.bio = params["director_bio"]
    director.dob = params["director_dob"]
    director.image_url = params["director_image"]
    director.save
    
    redirect_to("/directors/" + director.id.to_s)
  end 
  
  def destroy_row
    director = Director.find_by({ :Id => params["toast_id"] })
    director.destroy

    redirect_to("/directors")
  end 

end
