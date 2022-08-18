Rails.application.routes.draw do
  resources :events
  namespace :admin do
    resources :shifts
    resources :end_users
    get 'homes/top'
  end
  namespace :public do
    resources :shifts
    resources :end_users
    resources :hope_shifts
    get 'homes/top'
  end

  resources :events
  get 'my_calendar', to: 'events#my_calendar'
  
  #resources :shifts
  #resources :end_users
  #resources :admins
  #resources :hope_shifts

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  #顧客用
# URL /end_users/sign_in ...
devise_for :end_users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
