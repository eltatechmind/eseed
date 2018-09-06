class EmployeesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]

  def new
 	  @employee = Employee.new
  end

  def create
    @employee = Employee.new(employees_params)
    if @employee.save
      flash[:success] = "Employee added"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employees_params)
      flash[:success] = "Employee updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end





  private

  def employees_params
    params.require(:employee).permit(:name,:email, :mobile,
                                 :hiredate)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
