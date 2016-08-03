require "date"

class ShoppingCart
	attr_reader :items
	def initialize
		@items = []
	end

	def add_item(item)
		@items.push item
	end

	def checkout
		total = 0
		@items.each do |item|
			total = total + item.price
		end
		puts "Your total today is $#{total}. Have a nice day!"
		total
	end

	def disc_price(total)
		if @items.length > 5
			total * 0.9
		else
			total
		end
	end
end

class Item
	attr_accessor :name, :price
	def initialize(name, price)
		@name = name
		@price = price
	end
end

class Fruit < Item
	def disc_price (we)
		if we
			@price * 0.9
		else
			@price
		end
	end

	def is_weekend
		today = Date.today
		today.saturday? || today.sunday?
	end
end

class Houseware < Item
	def disc_price
		if @price > 100
			@price * 0.95
		else
			@price
		end
	end
end


banana = Fruit.new("banana",10)
oj = Item.new("orange juice", 10)
rice = Item.new("rice", 1)
vacuum = Houseware.new("vacuum cleaner",150)
anchovies = Item.new("anchovies",2)

weekend = banana.is_weekend
banana.price = banana.disc_price(weekend)
vacuum.price = vacuum.disc_price

joshs_cart = ShoppingCart.new
joshs_cart.add_item(oj)
joshs_cart.add_item(rice)
joshs_cart.add_item(banana)
joshs_cart.add_item(vacuum)
joshs_cart.add_item(vacuum)
joshs_cart.add_item(anchovies)
tot = joshs_cart.checkout
tot_disc = joshs_cart.disc_price(tot)
puts "The final price of the cart is #{tot_disc}"
