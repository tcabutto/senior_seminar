class PersonnelPolicy
    attr_reader :current_account, :model

    def initialize(current_account, model)
      @current_account = current_account
      @personnel = model
    end

    def edit?
      @current_account == @personnel.account
    end

    def update?
      @current_account == @personnel.account
    end

    def show_deals_for_personnel?
      @current_account == @personnel.account
    end

end