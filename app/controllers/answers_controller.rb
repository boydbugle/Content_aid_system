class AnswersController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save 
      redirect_to question_path(@question)
    else
      flash notice: "retry, error in posting answer"
      redirect_to question_path(@question)
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
     @question = Question.find(params[:question_id])
     @answer = Answer.find(params[:id])    
      if @answer.update(answer_params)
       redirect_to question_path(@question)
      else
        render :edit
      end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end
  private
  def answer_params
    params.require(:answer).permit(:description,:code)
  end
end
