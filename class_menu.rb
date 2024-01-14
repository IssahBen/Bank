require_relative "menu_methods"
require_relative 'models'
require 'pg'

conn = PG.connect(dbname:'Bank',user:'postgres',password:'postgres',host:'localhost')
customer_table = User.new(conn)
customer_table.create_table
account_table = Accounts.new(conn)
account_table.create_table
transaction_table = Transactions.new(conn)
transaction_table.create_table

class MenuClass
    extend Menumethods

    @@customers=[]

    def self.customers
        @@customers
    end

    def self.displaying_menu
        menu_string = <<-Menu
        Welcome
        Enter 1 to create account
        Enter 2 to login
        Enter 3 to deposit
        Enter 4 to withdraw
        Enter 5 to view transactions
        Enter 6 to view balance
        Enter 7 to reset Pin
        Enter q to quit 
    Menu

    puts menu_string
    end

    def self.process_menu_selection(selection)
        case selection
        when "1"
            create_account
        when "2"
            @@customers << login

        when "3"
            deposit
        when "4"
            withdrawal
        when "5"
            view_transactions
        when "6"
            view_balance
        when "7"
            transfer
        when "8"
            reset_pin
        when "q"

        end
    end

    def self.create_account
        customer=create_customer
        create_customer_account(customer)
        @@customers << customer
     
    end

end
 while true
    MenuClass.displaying_menu
    choice=gets.chomp

    if choice =="q"
        break
    else
        MenuClass.process_menu_selection(choice)
    end
end