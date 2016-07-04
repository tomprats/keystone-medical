class PricingController < ApplicationController
  def show
    @organization = Organization.find_by(path: params[:path]) || not_found
  end
end
