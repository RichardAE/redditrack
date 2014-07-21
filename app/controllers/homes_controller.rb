class HomesController < ApplicationController
  def show
    if user_signed_in?
        redirect_to dashboard_path
    else
      render layout: "guest"
    end
  end
end