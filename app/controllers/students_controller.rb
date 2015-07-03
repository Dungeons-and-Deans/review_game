class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!

  def index
    @students = Student.where(teacher_id: current_teacher.id).order(:last_name)
  end

  def show
  end

  def new
    @student = Student.new(teacher_id: current_teacher.id)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private  def set_student
      @student = Student.find(params[:id])
    end

  private  def student_params
      params.require(:student).permit(:teacher_id, :games_won, :first_name, :last_name)
    end
end
