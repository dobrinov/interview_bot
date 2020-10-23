class JobApplicationsController < AuthenticatedController
  def new
    @company = Company.find params[:company_id]
    @job_application = JobApplication.new
  end

  def create
    @company = Company.find params[:company_id]
    role = @company.role_descriptions.find params[:job_application][:role_description_id]
    interviewee = Interviewee.find_or_create_by interviewee_params
    @job_application = role.job_applications.build interviewee: interviewee
    @job_application.build_self_evaluation slug: SecureRandom.hex

    if @job_application.save
      redirect_to company_path(@company), notice: 'Job application created'
    else
      flash.now[:error] = 'Job application not created'
      render :new
    end
  end

  def destroy
    job_application = JobApplication.find params[:id]
    company = job_application.role_description.company
    job_application.destroy

    redirect_to company_path(company), notice: 'Job application deleted'
  end

  private

  def interviewee_params
    params.require(:job_application).require(:interviewee).permit(:name, :email)
  end
end
