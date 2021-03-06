class ChargesController < ApplicationController
  def create
    @amount = 500

    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]})
    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount,
                                     description: 'Rails Stripe customer',
                                     currency: 'usd'
                                   })
  rescue Stripe::CardError => e
    error = e.message
  end
end
