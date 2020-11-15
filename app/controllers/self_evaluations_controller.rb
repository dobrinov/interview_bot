class SelfEvaluationsController < AuthenticatedController
  def show
    self_evaluation = SelfEvaluation.find params[:id]
    @self_evaluation_preview = SelfEvaluationPreview.new self_evaluation
  end
end
