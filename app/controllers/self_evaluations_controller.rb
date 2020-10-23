class SelfEvaluationsController < AuthenticatedController
  def show
    @self_evaluation = SelfEvaluation.find params[:id]
    @job_application = @self_evaluation.job_application
    @role_description = @job_application.role_description
    @interviewee = @job_application.interviewee
  end
end
