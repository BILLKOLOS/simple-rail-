patients_controller.rb
class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :gender)
  end

  def check_role
    redirect_to root_path, alert: 'Access denied!' unless current_user.role == 'receptionist'
  end
end
