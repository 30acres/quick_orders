module CsvHelpers

  def safe(string)
    ## not great.
    string.to_s.gsub(',',' ')
  end

  def shopify_date(date)
    if date
      date.to_datetime.strftime('%Y-%m-%d %H:%M:%S %z')
    end
  end

  def to_dollar(d)
    if d
      sprintf('%.2f', d)
    end
  end
end

