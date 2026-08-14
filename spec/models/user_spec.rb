require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは一意性である' do
      User.create!(nickname: 'test', email: 'test@example', password: '1aaaaa', password_confirmation: '1aaaaa',
                   family_name_kanji: '田中', last_name_kanji: '良子', family_name_kana: 'タナカ', last_name_kana: 'リョウコ', birthday: '1931-02-03')
      user = User.new(nickname: 'test', email: 'test@example', password: '1aaaaa', password_confirmation: '1aaaaa',
                      family_name_kanji: '田中', last_name_kanji: '良子', family_name_kana: 'タナカ', last_name_kana: 'リョウコ', birthday: '1931-02-03')
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'testexample'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満では登録できない' do
      user = FactoryBot.build(:user)
      user.password = '1aaa'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必要である' do
      user = FactoryBot.build(:user)
      user.password_confirmation = '2aaaaa'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_name_kanjiが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_kanji = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    it 'last_name_kanjiが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kanji = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
