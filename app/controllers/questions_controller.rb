class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    #@question = current_user.question.build(params[:question])
    #current_user.save
    #@question.user_ids = [current_user.id]
    if @question.save
      @question.users << current_user
      flash[:notice] = "Question has been added"
      redirect_to @question
    else
      flash[:alert] = "Question has not been added"
      render action: "new"
    end
  end

  def show

  end

  def edit

  end

  def update
    @question.update_attributes(params[:question])
    @question.users << current_user if not current_user.in? @question.users
    @question.users |= [current_user]
      flash[:notice] = "Question has been updated."
      redirect_to @question
  end

  def destroy
    @question.destroy
    flash[:notice] = "Question has been deleted."
    redirect_to questions_path
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
