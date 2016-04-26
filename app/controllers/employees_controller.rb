class EmployeesController < ApplicationController
  def index
    @employees = Employee.order("created_at desc").page(params[:page]).per(10)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_parames)
    if @employee.save
      redirect_to employees_path, notice: 'succeed'
    else
      redirect_to employees_path, notice: 'fail'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_parames
      params.require(:employee).permit(:name)
    end
    
end