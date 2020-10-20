class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find params[:id]
    @roles = @company.role_descriptions
    @job_applications = JobApplication.includes(:role_description, :interviewee).where(role_descriptions: {company: @company})
  end
end
