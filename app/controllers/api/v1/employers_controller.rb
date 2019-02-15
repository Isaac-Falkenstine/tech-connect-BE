class Api::V1::EmployersController < ApplicationController

  def index
    employers = Employer.all

    render json: EmployerSerializer.new(employers)
  end

end
