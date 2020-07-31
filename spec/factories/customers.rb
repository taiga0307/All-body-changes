FactoryBot.define do
  factory :customer do
    name_sei              {"米山"}
    name_mei              {"大河"}
    yomi_sei              {"ヨネヤマ"}
    yomi_mei              {"タイガ"}
    nickname              {"たいたい"}
    postal_code           {"1066223"}
    prefecture_code       {"東京都"}
    address_city          {"港区"}
    address_street        {"六本木3-2-1"}
    tell                  {"1234567890"}
    email                 {"123456789@gmail.com"}
    password              {"123456789012"}
    password_confirmation {"123456789012"}
  end
end