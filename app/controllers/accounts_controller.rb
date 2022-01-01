class AccountsController < ApplicationController
  before_action :authenticate_user!

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.affiliations.new(user: current_user, role: "admin")

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def switch
    if(params.has_key?(:id))
      @account = Account.find(params[:id])
    else
      @account = current_user.account.find_by(role: 'user')
    end
    session[:account_id] = @account.id
    @current_affiliation = AccountAffiliation.find_by(user_id: current_user.id, account_id: @account.id)
    current_user.role = @current_affiliation.role
    current_user.save
    
    redirect_to root_path
  end

  private

    def account_params
      params.require(:account).permit(:name)
    end

end