Rails.application.routes.draw do
  resources :companies, only: %i(index show) do
    resources :role_descriptions, shallow: true
    resources :job_applications, shallow: true, only: %i(new create destroy)
  end

  resources :technologies, except: %i(show destroy)
  resources :self_evaluations, only: %i(show)

  get   'se/thank_you', to: 'public_self_evaluations#thank_you', as: :public_self_evaluation_thank_you
  get   'se/:slug',     to: 'public_self_evaluations#edit',      as: :public_self_evaluation
  patch 'se/:slug',     to: 'public_self_evaluations#update'

  root to: 'companies#index'
end
