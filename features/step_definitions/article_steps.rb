Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end

Given /I login as an administrator/ do
  visit '/accounts/login'
  debugger
  find(:css, 'user_login').set('admin')
  find(:css, 'input#user_password').set('UZlWeUD')
  click_button "Login"
end