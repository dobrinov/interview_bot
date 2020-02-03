Rails.application.routes.draw do
  resources :self_evaluations, only: %i(edit update) do
    get :thank_you
  end
end
