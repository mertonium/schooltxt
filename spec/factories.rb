# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Gordon Morris"
  user.phone                 "(319) 385 7101"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
