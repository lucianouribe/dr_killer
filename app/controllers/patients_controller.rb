class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, success: 'Patient was successfully created.'
    else
      render :new, error: 'Patient could not be created'
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      redirect_to patients_path, success: 'Patient was successfully updated.'
    else
      render :edit, error: 'Something failed. Try again!'
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
    redirect_to patients_path, success: 'Patient was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :dying, :insurance, :complains_of)
    end
end
