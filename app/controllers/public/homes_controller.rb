class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_At: :desc).limit(4)
  end

  def about
  end
end
