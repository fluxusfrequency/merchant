module ProductsHelper
  def print_price(price)
     number_to_currency price
  end

  def print_stock(stock)
    if stock > 0
      content_tag(:span, "In Stock (#{stock})", class: "out\_stock")
    else
      content_tag(:span, "Out of Stock", class: "out\_stock")
    end
  end

end
