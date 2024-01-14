require_relative "bank_account"
require_relative "transactions"
require_relative "models"
require 'pg'
class  Customer
    attr_accessor :bank_accounts,:pin,:first_name,:transfer_contacts


    def initialize(first_name,last_name,pin)
        conn=PG.connect(dbname:'Bank',user:'postgres',password:'postgres',host:'localhost')

        @user_table=User.new(conn)

        @first_name =  first_name

        @last_name = last_name  

        @pin = pin

        @bank_accounts  =  []

        unless @user_table.customer?(first_name,last_name)

            @user_table.insert(first_name,last_name,pin)
        end

        @id=@user_table.pull_id(first_name,last_name,pin)

        @accounts_table = Accounts.new(conn)

        accounts = @accounts_table.pull_account_info(@id)

        unless accounts.empty?
            accounts.each do |account|
                bank_account = Account.new(account[1],account[0],@id,account[2].to_i)
                @bank_accounts  << bank_account
            end
        end
                


        

        @transfer_contacts=[]
    end

    def create_account(type,name)
        allowed_types=["savings","checking"]
        return {error: "Account type not allowed"} unless allowed_types.include? type

        return {error: "Acccount type already created for customer"} unless account_type_already_created?(type)

        account= Account.new(type,name,@id)
        @accounts_table.insert(@id,name,type)

        @bank_accounts << account

        {account: account}
    end

    def update_pin(new_pin)
        @user_table.update_pin(@id,new_pin)
        @pin=new_pin
    end


    private
    def account_type_already_created?(type)
        @bank_accounts.find{|account| account.type ==type}.nil?
    end

    
end
