module ApplicationHelper
  def tDate date
    Date.strptime(date, '%d/%m/%Y')
  end

  def toCLP value
    "$#{number_with_delimiter value.to_i, delimiter: '.'}"
  end

  def sendError(model)
    key, value = model.errors.first
    trans = I18n.t "activerecord.attributes.#{model.class.name.underscore}.#{key}"
    render js: "showToastr('error', '#{trans} #{value}')"
  end
end
