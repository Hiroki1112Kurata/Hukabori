class Admin::DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to admin_departments_path
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    @department.update(department_params)
    redirect_to admin_departments_path
  end


  private

  def department_params
    params.require(:department).permit(:name)
  end

end
