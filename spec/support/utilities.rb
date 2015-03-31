def login(enjoyer)
  visit '/'
  click_on 'Login'
  fill_in 'Email', with: enjoyer.email
  fill_in 'Password', with: enjoyer.password
  click_on 'Log in'
end
