module ApplicationHelper
  def tDate date
    Date.strptime(date, '%d/%m/%Y')
  end
end
