# pages controller
class PagesController < ApplicationController
  def about
    @page = Page.find(1)
  end

  def contact_us
    @page = Page.find(2)
  end
end
