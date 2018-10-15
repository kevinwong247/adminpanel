class InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end

  def create
    acohort = cohortall().find_by(name: params[:instructor][:cohort])
   
    Instructor.create(
      firstname: params[:instructor][:firstname],
      lastname: params[:instructor][:lastname],
      age: params[:instructor][:age],
      educationlevel: params[:instructor][:educationlevel],
      salary: params[:instructor][:salary],
      cohort: acohort.id
    )

    respond_to do |format|
      # redirects to the '/users' path
      format.html { redirect_to instructors_path }
      format.js { render '/instructors/create.js.erb' }
    end
  end

  def index
    @instructors = Instructor.all

    respond_to do |format|
      format.html { render '/instructors/index.html.erb' }
      format.js { render '/instructors/index.js.erb' }
      format.json { render json: @instructors }
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
      # loads the user with id of params[:id]
    #   from the database
    instructor = Instructor.find(params[:id])

    # updates the user that was currently loaded
    #   with the information retrieved from the
    #   form

    # user.update(
    #   username: params[:user][:username],
    #   password: params[:user][:password]
    # )
    instructor.update(instructor_params)

    # goes to show page
    redirect_to instructor_path(instructor)
  end

  def delete
    
  end

  def destroy
    # this loads the user first
    instructor = Instructor.find(params[:id])

    # this uses the information inside the user
    #   object and deletes the user
    instructor.destroy
    # User.destroy(params[:id])
    
    redirect_to instructors_path
  end

  private

  # def instructor_params
  #   params.require(:instructor).permit(:username, :password, :password_confirmation)
  # end
end