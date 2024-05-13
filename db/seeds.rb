#johnsmith = User.create(first_name: 'John', last_name: 'Smith' email: 'johnsmith@gmail.com', password: 'Password123')

restaurant = category.create!(name: 'restaurant')
restaurant_list = ["kfc",'mcdonald','nandos','starbucks','dominoes']

supermarket = category.create!(name: 'supermarket')
supermarket_list = ["asda",'tesco','aldi','lidl','waitrose']

subscriptions = category.create!(name: 'subcriptions')
subcriptions_list = ["spotify",'netflix','the economist','the gym','disney']

utilities = category.create!(name: 'utilities')
utilities_list = ["edf",'british gas','thames water','octopus','three']

home = category.create!(name: 'home')
home_list = ["rent",'council tax', 'insurance', 'cleaner', 'repairs']

bank = ['barclays', 'hsbc', 'natwest', 'revolut']

10.times do |i|
  5.times do |i|
    Transaction.create!(
      user_id: 1,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: Faker::Restaurant.unique.name + "(#{restaurant_list[i]})",
      category: restaurant,
      bank: bank.sample
    )
    Transaction.create!(
      user_id: 1,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: Faker::Company.unique.name + "(#{supermarket_list[i]})",
      category: groceries,
      bank: bank.sample
      )
      Transaction.create!(
        user_id: 1,
        date: Faker::Date.between(from: 1.year.ago, to: Date.today),
        amount: Faker::Number.decimal(l_digits: 2),
        retailer: Faker::Company.unique.name + "(#{subcriptions_list[i]})",
        category: subcriptions,
        bank: bank.sample
      )
      Transaction.create!(
        user_id: 1,
        date: Faker::Date.between(from: 1.year.ago, to: Date.today),
        amount: Faker::Number.decimal(l_digits: 2),
        retailer: Faker::Company.unique.name + "(#{utilities_list[i]})",
        category: utilities,
        bank: bank.sample
      )
      Transaction.create!(
        user_id: 1,
        date: Faker::Date.between(from: 1.year.ago, to: Date.today),
        amount: Faker::Number.decimal(l_digits: 2),
        retailer: Faker::Company.unique.name + "(#{bills_list[i]})",
        category: bills,
        bank: bank.sample
      )
  end
  puts 'created'
end
