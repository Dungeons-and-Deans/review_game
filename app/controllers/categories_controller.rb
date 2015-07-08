class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :update_title]
  before_action :authenticate_teacher!

  def index
    @categories = Category.where(teacher_id: current_teacher.id)
  end

  def show
    @questions = Question.where(category_id: @category.id)
  end

  def new
    @category = Category.new(teacher_id: current_teacher.id)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @questions = Question.where(category_id: @category.id)
    respond_to do |format|
      if @category.update(category_params)
        format.js
      else
        format.html { redirect_to @category, notice: 'Category failed to be updated.'}
      end
    end
  end

  def update_title
    respond_to do |format|
      if @category.update(category_params)
        format.js
      else
        format.html { redirect_to @category, notice: 'Category failed to be updated.'}
      end
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully removed.'
  end

  private def set_category
    @category = Category.find(params[:id])
  end

  private def category_params
    params.require(:category).permit(:name, :teacher_id,
        questions_attributes: [:id, :content, :difficulty_level])
  end

end
