class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    welcome
    @running = true
    while @running
      display_menu
      user_action = gets.chomp.to_i
      route_to(user_action)
    end
    puts "Bye bye\nzo/"
  end

  def welcome
    puts "*" * 31
    puts "Welcome to LW Food Delivery App"
    puts "*" * 31
  end

  def route_to(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @running = false
    else
      puts "Press 1, 2, 3, 4 or 5"
    end
  end

  def display_menu
    puts '1. Add a new meal'
    puts '2. List all the meals'
    puts '3. Add a new customer'
    puts '4. List all the customers'
    puts '5. Quit'
  end
end
