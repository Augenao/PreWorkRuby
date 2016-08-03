class ShakeShop
  attr_reader :milkshakes
	def initialize
		@milkshakes = []		
	end

	def add_milkshake(milkshake)
		@milkshakes.push(milkshake)
	end

  def check_milkshakes
    @milkshakes.each do |milkshake|
      puts "\n_______ #{milkshake.name} - Milshake _______"
      milkshake.check_ingredients
      milkshake.price_of_milkshake
    end
  end
end

class MilkShake
	attr_reader :base_price, :ingredients, :name
  def initialize (name)
    @name = name
    @base_price = 3
    @ingredients = []    
  end

  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def check_ingredients
    @ingredients.each do |ingredient|
      puts ingredient.name
    end
  end

  def price_of_milkshake
    total_price_of_milkshake = @base_price
    @ingredients.each do |ingredient|
      total_price_of_milkshake += ingredient.price
    end
    #return  our total price to whoever called for it
    puts "El #{@name} Milkshake cuesta #{total_price_of_milkshake} €"
  end
end

class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end
end

special_milkshake = MilkShake.new("Special")
ironhack_milkshake = MilkShake.new("Ironhack")
nizars_milkshake = MilkShake.new("Nizars")
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
crocant = Ingredient.new("Crocant almonds", 5)
peach = Ingredient.new("Peach", 4)
white_chocolate = Ingredient.new("White chocolate", 3)
alex_shop = ShakeShop.new
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)
special_milkshake.add_ingredient(crocant)
special_milkshake.add_ingredient(banana)
special_milkshake.add_ingredient(chocolate_chips)
ironhack_milkshake.add_ingredient(peach)
ironhack_milkshake.add_ingredient(white_chocolate)

puts  "El precio base por milkshake es de #{nizars_milkshake.base_price} €" 

alex_shop.add_milkshake(nizars_milkshake)
alex_shop.add_milkshake(ironhack_milkshake)
alex_shop.add_milkshake(special_milkshake)
alex_shop.check_milkshakes
# nizars_milkshake.ingredients.each do |ingredient|
#   puts ingredient
# end
