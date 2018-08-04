Rails.application.routes.draw do
  get 'workbook', to: 'workbook#index'
  # get 'workbook/reports'
  root 'home#index'
  resources :workbook do
   
    collection do
      get 'reports'
      get 'console'
      get 'success'
      get 'warning'
      get 'error'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
