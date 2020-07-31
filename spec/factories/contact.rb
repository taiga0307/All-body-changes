FactoryBot.define do
  factory :contact do
    association :customer #customerの情報を持ってきている
    contact_name              {"米山大河"}
    contact_email             {"123456789@gmail.com"}
    contact_content           {'a' * 300}
    contact_status            {0}
  end
end