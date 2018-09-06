class AttendancesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]

  def new
 	  @attendance = Attendance.new
    @employee = Employee.all
    @status = Status.all
  end

  def create
    @attendance = Attendance.new(attendances_params)
    @employee = Employee.all
    @status = Status.all
    if @attendance.save
      flash[:success] = "Attendance created"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
    @employee = Employee.all
    @status = Status.all
  end

  def update
    @attendance = Attendance.find(params[:id])
    @employee = Employee.all
    @status = Status.all
    if @attendance.update_attributes(attendances_params)
      flash[:success] = "Attendance updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  # delete action
  def delete
     @attendance = Attendance.find(params[:id])
      @attendance.destroy
      render json: { success_message: "Success!, Attendance is deleted." }, status: :ok
  end




  private

  def attendances_params
    params.require(:attendance).permit(:day,:whours, :employee_id,
                                 :status_id)
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
