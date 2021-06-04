class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @quiz = Quiz.order("created_at DESC")
  end

  def new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.valid? && @quiz.answer == "いち"
      @quiz.save
      render :create
    else
      @miss = '間違っています';
      render :index
    end
  end


  private
  def quiz_params
    params.require(:quiz).permit(:answer).merge(user_id: current_user.id)
  end

end