class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:index, :new, :create]

  def index
    @doctors = Doctors.all
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
      redirect_to @doctor
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty, :greedy)
  end
end
