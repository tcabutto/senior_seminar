Rails.application.routes.draw do
  resources :event_reports
  resources :comment_reports
  resources :deal_reports
  
  mount Blazer::Engine, at: "blazer"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'catalog#index', as: 'catalog_index'
  get 'business_list/index'
  get 'events_list/index'
  get 'statistics/', to: 'statistics#index'

  resources :charts, only: [] do
    collection do
      get 'businesses_total_deals'
      get 'businesses_total_deals_by_year'
      get 'businesses_total_deals_by_month'
      get 'businesses_total_deals_by_week'
      get 'businesses_total_deals_by_day'
      get 'businesses_total_popularity'
      get 'businesses_total_popularity_by_year'
      get 'businesses_total_popularity_by_month'
      get 'businesses_total_popularity_by_week'
      get 'businesses_total_popularity_by_day'
    end
  end

  devise_for :accounts, :controllers => { :registrations => 'registrations' }

  resources :super_accounts
  resources :super_accounts
  resources :personnels
  resources :businesses
  resources :businesses do 
    resources :deals
    resources :events
    resources :deal_reports
    resources :event_reports
    resources :comment_reports
  end
  resources :deals do
    resources :comments
    get 'print'
    get 'redeem'
    patch 'upvote'
    patch 'downvote'
    patch 'favorite'
    member do
      put 'favorite', to: "deals#favorite"
      put 'unfavorite', to: "deals#unfavorite"
    end
  end
  resources :events do
    member do
      put 'rsvp', to: "events#rsvp"
      put 'unrsvp', to: "events#unrsvp"
    end
  end

  resources :transactions
  resources :comments
  

  resources :comments do
    resources :comments
  end
  resources :events do

    resources :comments
  end


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
