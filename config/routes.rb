Rails.application.routes.draw do
  resources :posts
  resources :questions

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'

end
