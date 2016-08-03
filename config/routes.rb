Rails.application.routes.draw do
  resources :dashboards
  get '/dashboard' => 'dashboards#index'
end
