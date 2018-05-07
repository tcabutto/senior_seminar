class BusinessPolicy
    attr_reader :current_account, :model

    def initialize(current_account, model)
      @current_account = current_account
      @business = model
    end

    def index?
      @current_account.accountable_type == "SuperAccount"
    end

    def edit?
      @current_account == @business.account
    end

    def update?
      @current_account == @business.account
    end

    def show_deals_for_business?
      @current_account == @business.account
    end
end