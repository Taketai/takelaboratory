class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  # before_action :move_to_ranking, only: [:index]

  def index
    @quiz = Quiz.order("created_at DESC")
  end

  def new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.valid? && @quiz.answer == "ぶたにしんじゅ"
      @quiz.save
      render :create
    else
      @miss = '間違っています';
      render :index
    end
  end

  def search
    @quizzes = Quiz.search(params[:keyword])
    @users = User.all
  end

  private
  
  def quiz_params
    params.require(:quiz).permit(:answer).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  # def move_to_ranking
  #   @quizzes = Quiz.search(params[:user_id])
  #   if @quizzes.present?
  #     redirect_to action: :index
  #   end
  #     redirect_to action: :search
  # end

end