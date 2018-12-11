class PagesController < ApplicationController
  def index
    @hostels = Hostel.order(id: :desc).limit(4)
  end
end
