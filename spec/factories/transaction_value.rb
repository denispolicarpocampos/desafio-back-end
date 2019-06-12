FactoryBot.define do
  factory :transaction_value do
    date_occurrency Datetime.current
    value           Random.rand(0...9999.99)
    cpf             { FFaker::IdentificationBR.cpf }
    card            "8723****9987"
    owner           { FFaker::Internet.user_name }
    name            { FFaker::Internet.user_name }
    user
    kind_transaction
  end
end