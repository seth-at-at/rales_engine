RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      #resets id numbers
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
  #runs before and after
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
