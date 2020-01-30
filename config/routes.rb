Rails.application.routes.draw do
  resources :self_evaluations, only: %i(edit update)
end
