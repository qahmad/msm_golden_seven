class ActorsController < ApplicationController

  def new_form
    render("actor_templates/new_form.html.erb")
  end

  def create_row

    actor = Actor.new
    actor.name = params["actor_name"]
    actor.bio = params["actor_bio"]
    actor.dob = params["actor_dob"]
    actor.image_url = params["actor_image"]
    actor.save

    redirect_to("/actors")
    
  end
    
  def index
    @actors = Actor.all.order('created_at DESC')

    render("actor_templates/index.html.erb")
  end 

  def show
    @actor = Actor.find_by({ :Id => params["an_id"] })
    render("actor_templates/show.html.erb")
  end
  
  def edit_form
    @actor = Actor.find_by({ :Id => params["some_id"] })
    render("actor_templates/edit_form.html.erb")
  end
  
  def update_row
    actor = Actor.find_by({ :Id => params["the_id"] })
    
    actor.name = params["actor_name"]
    actor.bio = params["actor_bio"]
    actor.dob = params["actor_dob"]
    actor.image_url = params["actor_image"]
    actor.save
    
    redirect_to("/actors/" + actor.id.to_s)
  end 
  
  def destroy_row
    actor = Actor.find_by({ :Id => params["toast_id"] })
    actor.destroy

    redirect_to("/actors")
  end 

end
