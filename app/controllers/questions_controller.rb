class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.js
      else
        format.html { render :groups, notice: 'Question failed to be updated.' }
      end
    end
  end

  def destroy
    @questions = Question.where(category_id: @question.category.id)
    @question.destroy
    respond_to do |format|
      format.js
    end
  end

  private def set_question
    @question = Question.find(params[:id])
  end

  private def question_params
    params.require(:question).permit(:content, :difficulty_level, :category_id, :right, :wrong)
  end
end
