class StaticPagesController < ApplicationController
  def home
    @check_items = CheckItem.all
  end
end
