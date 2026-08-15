class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, :family_name_kanji, :last_name_kanji, :family_name_kana, :last_name_kana, :birthday, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
end
