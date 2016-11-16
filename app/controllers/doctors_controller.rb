class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:index, :new, :create]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, success: "Doctor created successfully"
    else
      render :new, error: "Try again!"
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, success: "Doctor updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, success: "Doctor deleted successfully"
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty, :greedy, :avatar)
  end

end
