FactoryBot.define do
  factory :order_address do
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {1}
    item_id       {1}
    postal_code   {"111-1111"}
    prefecture_id {2}
    municipality  {"東京"}
    address       {"１丁目１番地１号"}
    phone_number  {"00000000000"}
  end
end
