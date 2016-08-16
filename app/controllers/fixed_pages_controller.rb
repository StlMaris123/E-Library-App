class FixedPagesController < ApplicationController
  def home
    if logged_in?
      @leases = current_user.leases.borrowed
    end
  end

  def faq
  end

  def about
  end

  def contact
  end
end
