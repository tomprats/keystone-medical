class AdminController < ApplicationController
  before_action :require_user!
end
