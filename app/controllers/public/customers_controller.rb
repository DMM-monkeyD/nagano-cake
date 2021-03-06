class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def index
    redirect_to new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone_number, :email)
  end

end
