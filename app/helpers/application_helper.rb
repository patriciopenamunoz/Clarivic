module ApplicationHelper
  def tDate date
    Date.strptime(date, '%d/%m/%Y')
  end

  def toCLP value
    "$#{number_with_delimiter value.to_i, delimiter: '.'}"
  end
end
