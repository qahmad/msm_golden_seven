Rails.application.routes.draw do

  get("/",                           { :controller => "actors", :action => "index" })

  ############## ACTORS ##############

  # CREATE
  get("/actors/new",                 { :controller => "actors", :action => "new_form" })
  get("/create_actor",              { :controller => "actors", :action => "create_row" })

  # READ
  get("/actors",                     { :controller => "actors", :action => "index" })
  get("/actors/:an_id",              { :controller => "actors", :action => "show" })

  # UPDATE
  get("/actors/:some_id/edit",       { :controller => "actors", :action => "edit_form" })
  get("/update_actors/:the_id",      { :controller => "actors", :action => "update_row" })

  # DELETE
  get("/delete_actor/:toast_id",     { :controller => "actors", :action => "destroy_row" })


  ############## DIRECTORS ##############
  
  # CREATE
  get("/directors/new",              { :controller => "directors", :action => "new_form" })
  get("/create_director",            { :controller => "directors", :action => "create_row" })

  # READ
  get("/directors",                  { :controller => "directors", :action => "index" })
  get("/directors/:an_id",           { :controller => "directors", :action => "show" })

  # UPDATE
  get("/directors/:some_id/edit",    { :controller => "directors", :action => "edit_form" })
  get("/update_directors/:the_id",   { :controller => "directors", :action => "update_row" })

  # DELETE
  get("/delete_director/:toast_id",  { :controller => "directors", :action => "destroy_row" })


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
