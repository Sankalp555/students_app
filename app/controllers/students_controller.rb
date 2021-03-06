class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params['id'])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      format.html { render :new }
    end
  end

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      format.html { render :edit }
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :phone, :marks)
    end
end
