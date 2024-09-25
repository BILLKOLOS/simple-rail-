class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @patients = Patient.all
    @patients_count_by_date = Patient.group_by_day(:created_at).count
  end

  private

  def check_role
    redirect_to root_path, alert: 'Access denied!' unless current_user.role == 'doctor'
  end
end
