class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    acohort = cohortall().find_by(name: params[:student][:cohort])
   
    
      Student.create(
        firstname: params[:student][:firstname],
        lastname: params[:student][:lastname],
        age: params[:student][:age],
        educationlevel: params[:student][:educationlevel]
      )
      redirect_to student_path

#  respond_to do |format|
#       # redirects to the '/users' path
#       format.html { redirect_to '/students/index.html.erb' }
#       format.js { render '/students/create.js.erb' }
#     end
  end

  def index
    @students = Student.all

    respond_to do |format|
      format.html { render '/students/index.html.erb' }
      format.js { render '/students/index.js.erb' }
      format.json { render json: @students }
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
      # loads the user with id of params[:id]
    #   from the database
    student = Student.find(params[:id])

    # updates the user that was currently loaded
    #   with the information retrieved from the
    #   form

    # user.update(
    #   username: params[:user][:username],
    #   password: params[:user][:password]
    # )
    student.update(student_params)

    # goes to show page
    redirect_to students_show_path(student)
  end

  def delete
    
  end

  def destroy
    # this loads the user first
    student = Student.find(params[:id])

    # this uses the information inside the user
    #   object and deletes the user
    student.destroy
    # User.destroy(params[:id])
    
    redirect_to students_index_path
  end

  private

  # def student_params
  #   params.require(:student).permit(:firstname, :lastname, :age, :cohort, :educationlevel)
  # end
end
