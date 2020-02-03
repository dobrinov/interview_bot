class SelfEvaluationsController < ApplicationController
  def edit
    @self_evaluation_submission = SelfEvaluationSubmission.new self_evaluation: SelfEvaluation.find(params[:id])
    @self_evaluation_submission.add_role_description_skill_self_evaluations
    @self_evaluation_submission.add_blank_additional_skill_self_evaluation
  end

  def update
    @self_evaluation_submission = SelfEvaluationSubmission.new self_evaluation: SelfEvaluation.find(params[:id])

    if @self_evaluation_submission.submit self_evaluation_submission_params
      redirect_to self_evaluation_thank_you_path id: @self_evaluation_submission.id
    else
      @self_evaluation_submission.add_blank_additional_skill_self_evaluation
      render :edit
    end
  end

  private

  def self_evaluation_submission_params
    params.require(:self_evaluation_submission).permit!.to_h
  end
end
