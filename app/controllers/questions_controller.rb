class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
    @tags = Tag.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end

  private
  def question_params
    params.require(:question).permit(:title,:description,:code,:tag_id)
  end
end
