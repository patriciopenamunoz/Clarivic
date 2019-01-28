class PagesController < ApplicationController
  def index
    @regions = Region.all.map{ |r| r if r.hostels.count > 0 }.compact
    @hostels = Hostel.order(id: :desc).limit(4)
  end
end
