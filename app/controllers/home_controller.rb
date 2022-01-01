class HomeController < ApplicationController
  def index
    if user_signed_in?
      @accounts = current_user.accounts
    else
      @accounts = nil
    end
    if current_account != 0
      @account_affiliation = AccountAffiliation.find_by(account_id: current_account.id, user_id: current_user.id)
    else
      @account_affiliation = nil
    end
  end
end
