Rails.application.routes.draw do
        
    root to: 'apply#index'
    
    get '/' => "apply#index"
    get '/apply/test' => "apply#test"
    get '/apply/testAfterGetValue' => "apply#testAfterGetValue"
    get '/apply/top' => "apply#top"
    get '/apply/index' => "apply#index"
    get '/apply/show' => "apply#show"
    get '/apply/show/:id' => "apply#show"
    get '/apply/edit' => "apply#edit"
    get '/apply/edit_bq' => "apply#edit_bq"
    get 'apply/fbNew' => "apply#fbNew"
    post '/apply/:applyID/update' => "apply#update"
    post '/apply/create' => "apply#create"
    
    get 'coach/index' => "coach#index"
#    get 'app_analytics/index' => "app_analytics#index"
    
    get 'analytics/new' => "analytics#new"
    post '/analytics/create' => "analytics#create"

    devise_for :users, :controllers => {
        :registrations => 'users/registrations',
        :sessions => 'users/sessions'   
        } 

    devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    end


    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
