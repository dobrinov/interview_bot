class PublicSelfEvaluationsController < ApplicationController
  def edit
    self_evaluation = SelfEvaluation.find_by! slug: params[:slug]

    not_found if self_evaluation.submitted_at?

    @self_evaluation_submission = SelfEvaluationSubmission.for self_evaluation
  end

  def update
    self_evaluation = SelfEvaluation.find_by! slug: params[:slug]

    not_found if self_evaluation.submitted_at?

    @self_evaluation_submission = SelfEvaluationSubmission.new self_evaluation: self_evaluation

    if @self_evaluation_submission.submit self_evaluation_submission_params
      redirect_to public_self_evaluation_thank_you_path
    else
      render :edit
    end
  end

  def thank_you
  end

  private

  def self_evaluation_submission_params
    params.require(:self_evaluation_submission).permit!.to_h
  end
end
