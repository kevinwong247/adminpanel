class CohortsController < ApplicationController
  def new
    @cohort = Cohort.new
  end

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
      # loads the user with id of params[:id]
    #   from the database
    cohort = Cohort.find(params[:id])

    # updates the user that was currently loaded
    #   with the information retrieved from the
    #   form

    # user.update(
    #   username: params[:user][:username],
    #   password: params[:user][:password]
    # )
    cohort.update(user_params)

    # goes to show page
    redirect_to cohort_path(user)
  end

  def delete
  
  end

  def destroy
    # this loads the user first
    cohort = Cohort.find(params[:id])

    # this uses the information inside the user
    #   object and deletes the user
    cohort.destroy
    # User.destroy(params[:id])

    redirect_to cohorts_path
  end
    
  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.save

  respond_to do |format|
    # redirects to the '/users' path
    format.html { redirect_to cohorts_path }
    format.js { render '/cohorts/create.js.erb' }
  end
end
def cohort_params
  # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  # that can be submitted by a form to the user model #=> require(:user)
  params.require(:cohort).permit(:name, :startdate, :enddate, :course_id)
  
end
end

