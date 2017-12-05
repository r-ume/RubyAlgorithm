class ProductsController < ApplicationController

  def purchase
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: 3500,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
