require_relative "bank_account"
require_relative "transactions"
class  Customer
  attr_accessor :bank_accounts, :pin,:attempts, :last_name, :account_code, :first_name

  def initialize(first_name, last_name, pin)
    @first_name =  first_name

    @last_name = last_name

    @pin = pin

    @bank_accounts = []

    @attempts = 0
  end

  def create_account(type, name)
    allowed_types = ['savings', 'checking']

    return { error: 'Account type not allowed' } unless allowed_types.include? type

    return { error: 'Account type already created for customer' } unless account_type_already_created?(type)

    account = Account.new(type, name)
    @bank_accounts << account

    { account:  account}
  end


  private

  def account_type_already_created?(type)
    @bank_accounts.find { |account| account.type == type }.nil?
  end
end
