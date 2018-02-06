class ChargesController < ApplicationController

  def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Mem@bership - #{current_user.email}",
    amount: User.default_amount
  }
end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )



    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: User.default_amount,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.update_attribute(:role, "premium")

    flash[:notice] = "Thanks for all the money, #{current_user.email}! You now have access to private wikis!"

    redirect_to wikis_path(current_user) # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def downgrade
    if current_user.role == "premium"
     current_user.update_attribute(:role, 'standard')
     current_user.wikis.where(private: true).update_all(private: false)
     flash[:notice] = "Sorry to see you go."
     redirect_to root_path(current_user)
   elsif current_user.role == "standard"
     flash[:notice] = "You are already a standard member"
     redirect_to wikis_path(current_user)
     end
   end


   #find sign_in in spec folder bloccit

end
