require_relative "menu_methods"
require "byebug"

class MenuClass
  extend MenuMethods
  @@customers = []

  def self.customers
    @@customers
  end

  def self.display_menu
    menu_string = <<-MENU
      Welcome
      Enter 1 to create account
      Enter 2 to deposit
      Enter 3 to withdraw
      Enter 4 to view transactions
      Enter 5 to view balance
      Enter 6 to transfer
      Enter 7 to reset Pin
      Enter q to quit
    MENU

    puts menu_string
  end

  def self.process_menu_selection(selection)
    case selection
    when "1"
      create_account
    when "2"
      deposit
    end
  end

  def self.create_account
    customer = create_customer
    create_customer_account(customer)

    @@customers << customer
  end
end

while true
  MenuClass.display_menu
  choice = gets.chomp

  if choice == 'q'
    break
  else
    MenuClass.process_menu_selection(choice)
  end
end




