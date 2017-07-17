FactoryGirl.define do
  factory :article do
    location
    url('www.test.com')
    title('test')
    body('lorem ipsum')
  end
end
