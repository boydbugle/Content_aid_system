class QuestionsController < ApplicationController

  before_filter :must_login?, only: [:new, :edit, :destroy]
  # load_and_authorize_resource param_method: :my_sanitizer
  # load_and_authorize_resource

  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end
  private

  # def my_sanitizer
  #   params.require(:question).permit(:title,:description,:code,:tag_list)
  # end

  def question_params
    params.require(:question).permit(:title,:description,:code,:tag_list)
  end
end
