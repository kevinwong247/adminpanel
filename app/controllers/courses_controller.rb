class CoursesController < ApplicationController
  def index
    # loads all posts from the database
    @courses = Course.all
  end

  # get '/posts/:id' do
  #   @users = Post.find(params[:id])
  #   erb :show
  # end
  def show
    # loads the post with id of params[:id]
    # #   from the database
    @course = Course.find(params[:id])
  end

  # get '/posts/:id/edit' do
  #   @post = Post.find(params[:id])
  #   erb :edit
  # end
  def edit
    # loads the post with id of params[:id]
    #   from the database
    @course = Course.find(params[:id])
  end

  # put '/posts/:id' do
  #   post = Post.find(params[:id])
  #   post.update(
  #     title: params[:post][:title],
  #     content: params[:post][:content]
  #     user_id: params[:post][:user_id]
  #   )
  # 
  #   redirect '/posts/:id/edit'
  # end
  def update
    # loads the post with id of params[:id]
    #   from the database
    course = Course.find(params[:id])

    # loads the post with id of params[:id]
    #   from the database
    Course.update(
      name: params[:course][:name],
      totalhours: params[:course][:totalhours]
    )

    redirect_to edit_courses_path(course)
  end

  # delete '/posts/:id' do
  #   Post.destroy(params[:id])
  #   
  #   redirect '/posts'
  # end
  def destroy
    Course.destroy(params[:id])

    # redirect to /posts path
    redirect_to courses_path
  end

  def delete
  
  end 

  # get '/posts/new' do
  #   @post = Post.new
  #   erb :new
  # end
  def new
    @course = Course.new
  end

  # post '/posts' do
  #   Post.create(
  #     title: params[:post][:title],
  #     content: params[:post][:content],
  #     user_id: params[:post][:user_id]
  #   )
  #
  #   redirect '/posts'
  # end
  def create
    # creates a new user
    @course = Course.new(course_params)
  #   Course.create(
  #     name: params[:course][:name],
  #     totalhours: params[:course][:totalhours],
    @course.save
      # redirect_to '/posts/new'
    redirect_to courses_path
end
def course_params
  # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  # that can be submitted by a form to the user model #=> require(:user)
  params.require(:course).permit(:name, :totalhours)

end
end
