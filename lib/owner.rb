class Owner

  attr_accessor :owner, :name, :pets
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def say_species
   "I am a #{@species}."
  end

  def buy_fish(name)
    self.pets[:fishes] <<  Fish.new(name)
  end

def buy_cat(name)
    self.pets[:cats] <<  Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] <<  Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each { |doggy| doggy.mood = "happy"}
  end

 def play_with_cats
    self.pets[:cats].each { |kitty| kitty.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each { |fishies| fishies.mood = "happy"}
  end


  def sell_pets
    self.pets.each do |key, animal|
      animal.each do |feeling|
      feeling.mood = "nervous"
      end
    end
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

   def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end