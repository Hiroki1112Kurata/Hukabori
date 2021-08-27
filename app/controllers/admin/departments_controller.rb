class Admin::DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
       redirect_to admin_departments_path
    else
       @departments = Department.all
       render :index
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
       redirect_to admin_departments_path
    else
       render :edit
    end
  end


  private

  def department_params
    params.require(:department).permit(:name)
  end

end
