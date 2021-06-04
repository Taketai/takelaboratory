class QuizzesController < ApplicationController

  def index
    @quiz = Quiz.order("created_at DESC")
  end

  def new
  end

  def create
    @quiz = Quiz.new(quiz_params)
      if @quiz.valid?
        @quiz.save
        render :create
      else
        render :index
      end
  end


  private
  def quiz_params
    params.require(:quiz).permit(:answer).merge(user_id: current_user.id)
  end

end