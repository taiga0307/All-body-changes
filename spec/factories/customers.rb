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
    tell                  {"123456789"}
    email                 {"123456789@gmail.com"}
    password              {"000000000"}
    password_confirmation {"000000000"}
  end
end