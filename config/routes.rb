Rails.application.routes.draw do
  resources :events
  namespace :admin do
    resources :shifts do
      collection do
        get :copy_shift #データの受け渡し
        get :confirmed_shift #確定されたシフトを表示させるメソッド
      end
      get '/registered', to: 'hope_shifts#registered'
    end
    resources :end_users
    resources :hope_shifts do
      get '/active', to: 'hope_shifts#active'
      get '/registered', to: 'hope_shifts#registered'
      patch :copy_update
    end
    get 'homes/top'
  end
  
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
  
  scope module: :public do
    resources :shifts
    resources :end_users
    resources :hope_shifts
    get 'homes/top'
  end

  resources :events
  get '/' => 'public/homes#top'
  get 'my_calendar', to: 'events#my_calendar'
  get '/end_users/my_page' => 'public/end_users#index'
  get '/end_users/edit' => 'public/end_users#edit'
  root to: 'top#index'
  
  #resources :shifts
  #resources :end_users
  #resources :admins
  #resources :hope_shifts


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
