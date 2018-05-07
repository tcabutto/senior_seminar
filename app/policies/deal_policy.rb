class DealPolicy
    attr_reader :current_account, :model

    def initialize(current_account, model)
      @current_account = current_account
      @deal = model
    end

    def index?
      current_account.accountable_type == "Chamber" or
      current_account.accountable_type == "SuperAccount" or
      current_account.accountable_type == "Business" or 
      current_account.accountable_type == "Personnel"
    end
    def print?
      @current_account == @deal.business.account
    end
    def redeem?
      current_account.accountable_type == "Personnel" or
      current_account.accountable_type == "Personnel" or
      current_account.accountable_type == "Business" or
      current_account.accountable_type == "SuperAccount"
    end
    def show?
      current_account.accountable_type == "Personnel" or
      current_account.accountable_type == "Business" or
      current_account.accountable_type == "SuperAccount"
    end

    def new?
      current_account.accountable_type == "Business"
    end

    def create?
      current_account.accountable_type == "Business"
    end

    def edit?
      @current_account == @deal.business.account
    end
    
    #def update?
     # @current_account == @deal.business.account
    #end

    def destroy?
      @current_account == @deal.business.account
    end

    class Scope < Struct.new(:current_account, :model)
      def resolve
        model.where(business: current_account.accountable)
      end
    end
end