class AppointmentsController < ApplicationController
  def new

    @doctors = Doctor.all.map { |r| [r.last_name, r.first_name, r.id] }
    @patients = Patient.all.map { |i| [i.last_name, i.first_name, i.id] }
    if @doctors.any?
      if @patients.any?
        @appointments = Appointment.new
      else
        flash[:error] = 'No patients, you have to find sick people somewhere'
        redirect_to new_patient_path
      end
    else
      redirect_to new_doctor_path, error: "No doctors, you have to find at least one of them somewhere"
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment Created'
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    flash[:success] = 'Appointment Cancelled'
    redirect_to doctor_path(appointment.doctor_id)
  end

  private
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :date, :time)
    end

end
