Rails.application.routes.draw do
  # get 'students/new'
  # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  # get 'students/update'
  # get 'students/delete'
  # get 'students/destroy'
  # get 'students/create'
  # get 'instructors/new'
  # get 'instructors/index'
  # get 'instructors/show'
  # get 'instructors/edit'
  # get 'instructors/update'
  # get 'instructors/delete'
  # get 'instructors/destroy'
  # get 'instructors/create'
  # get 'courses/new'
  # get 'courses/index'
  # get 'courses/show'
  # get 'courses/edit'
  # get 'courses/update'
  # get 'courses/delete'
  # get 'courses/destroy'
  # get 'courses/create'
  # get 'cohorts/new'
  # get 'cohorts/index'
  # get 'cohorts/show'
  # get 'cohorts/edit'
  # get 'cohorts/update'
  # get 'cohorts/delete'
  # get 'cohorts/destroy'
  # get 'cohorts/create'
  resources :students
  resources :instructors
  resources :cohorts
  resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ----- add these lines here: -----

	# Add a root route if you don't have one...
	# We can use users#new for now, or replace this with the controller and action you want to be the site root:
	root to: 'users#new'
  	
  # sign up page with form:
get 'users/new' => 'users#new', as: :new_user

# create (post) action for when sign up form is submitted:
post 'users' => 'users#create'
# log in page with form:
get '/login'     => 'sessions#new'
	
# create (post) action for when log in form is submitted:
post '/login'    => 'sessions#create'

# delete action to log out:
delete '/logout' => 'sessions#destroy'  
  
end
