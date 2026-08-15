FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '1aaaaaa' }
    password_confirmation { password }
    family_name_kanji     { '田中' }
    last_name_kanji       { '良子' }
    family_name_kana      { 'タナカ' }
    last_name_kana        { 'リョウコ' }
    birthday              { '1931-02-03' }
  end
end
