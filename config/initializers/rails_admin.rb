RailsAdmin.config do |config|

  config.include Rails.application.routes.url_helpers

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :account
  end
  config.current_user_method(&:current_account)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  config.authorize_with do |controller|
    redirect_to "/" unless current_account.accountable_type == "SuperAccount"
  end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.main_app_name = ["Certified Moody Friendly Program - Admin Dashboard", ""]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = ['Account', 'Business', 'Comment', 'Deal', 'Event', 'Personnel', 'EventReport', 'DealReport', 'Transaction']

  config.model 'Business' do
    list do
      field :status
      field :name
      field :phone_number
      field :address
      field :website_url
      field :logo
      field :created_at
      field :updated_at
      field :deals
      field :events
    end
  end

  config.model 'Comment' do
    list do
      field :body do
        label "Content"
      end
      #find a way to add username here
      field :created_at
      field :updated_at
    end
  end

  config.model 'Deal' do
    list do
      field :popularity
      field :name
      field :description
      field :category
      field :business
      field :start_date
      field :end_date
      field :created_at
      field :updated_at
    end 
  end

  config.model 'Event' do
    list do
      #field :cached_likes do
      #  label "RSVP"
      #end
      field :name
      field :description
      field :business
      field :start
      field :end
      field :location
      field :address
      field :website_url
      field :created_at
      field :updated_at
    end
  end 

    config.model 'EventReport' do
      list do

        field :content
        field :account_id
        field :offense
        field :event_id
        field :created_at
        field :updated_at
      end
    end


    config.model 'DealReport' do
      list do

        field :content
        field :account_id
        field :offense
        field :deal_id
        field :created_at
        field :updated_at
      end
    end
    
    config.model 'Transaction' do 
      list do 
        field :account
        field :deal
      end 
    end 
  

end
