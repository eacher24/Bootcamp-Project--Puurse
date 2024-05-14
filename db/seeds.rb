require 'faker'
goethe = User.create(first_name: 'Johann', last_name: 'Goethe', email: 'goethe@gmail.com', password: 'secret')

restaurant = Category.create!(name: 'restaurant')
restaurant_list = ["kfc",'mcdonald','nandos','starbucks','dominoes']

supermarket = Category.create!(name: 'supermarket')
supermarket_list = ["asda",'tesco','aldi','lidl','waitrose']

subscription = Category.create!(name: 'subcriptions')
subcriptions_list = ["spotify",'netflix','the economist','the gym','disney']

utilities = Category.create!(name: 'utilities')
utilities_list = ["edf",'british gas','thames water','octopus','three']

home = Category.create!(name: 'home')
home_list = ["rent",'council tax', 'insurance', 'cleaner', 'repairs']

bank = ['barclays', 'hsbc', 'natwest', 'revolut']


count = 0
10.times do |i|
  5.times do |x|
    Transaction.create!(
      user: goethe,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: restaurant_list[x],
      category: restaurant,
      bank: bank.sample
    )
    Transaction.create!(
      user: goethe,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: supermarket_list[x],
      category: supermarket,
      bank: bank.sample
      )
    Transaction.create!(
      user: goethe,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: subcriptions_list[x],
      category: subscription,
      bank: bank.sample
    )
    Transaction.create!(
      user: goethe,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: utilities_list[x],
      category: utilities,
      bank: bank.sample
    )
    Transaction.create!(
      user: goethe,
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: Faker::Number.decimal(l_digits: 2),
      retailer: home_list[x],
      category: home,
      bank: bank.sample
    )
    count += 5
  end
end
puts "created #{count} user transactions for 5 categories"


transactions = Transaction.all
Category.all.each do |category|
  transactions = category.transactions
  total = 0
  transactions.each do |transa|
    total += transa.amount
  end
  total = (total * 100).floor / 100.0
  monthly = total / 12
  monthly = (monthly * 100).floor / 100.0

  Category.update(total_spend: total, monthly_spend: monthly)
  puts 'updated', Category.name
end
