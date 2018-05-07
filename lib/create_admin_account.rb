SuperAccount.transaction do
  SuperAccount.delete_all
  SuperAccount.create( :username => 'super' )
end
Account.transaction do
  Account.create( :email => 'super@cmfp.com', 
                  :password => 'password', 
                  :password_confirmation => 'password',
                  :accountable => SuperAccount.first())
end