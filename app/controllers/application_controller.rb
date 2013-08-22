class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def load_order
    @order = Order.find_or_initialize_by_id(session[:order_id],
                                              status: "unsubmitted", user_id: session[:user_id])
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
