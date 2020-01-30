class SelfEvaluationsController < ApplicationController
  def edit
    @self_evaluation_submission = SelfEvaluationSubmission.new self_evaluation: SelfEvaluation.find(params[:id])
  end

  def update
    @self_evaluation_submission = SelfEvaluationSubmission.new self_evaluation: SelfEvaluation.find(params[:id])

    if @self_evaluation_submission.submit self_evaluation_submission_params
      raise 'success'
    else
      render :edit
    end
  end

  private

  def self_evaluation_submission_params
    params.require(:self_evaluation_submission).permit!.to_h
  end
end
