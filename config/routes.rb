Rails.application.routes.draw do
  root 'static_pages#Home'
  get  '/Help',    to: 'static_pages#Help'
  get  '/About',   to: 'static_pages#About'
  get  '/Demo',   to: 'static_pages#Demo'
  get  '/Contact', to: 'static_pages#Contact'

	
	
  get 'device/Flag'
  get 'device/RequestPredict'
  get 'device/Registar'
  get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'static_pages#about'
end
