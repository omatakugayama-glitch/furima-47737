class User < ApplicationRecord
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, :family_name_kanji, :last_name_kanji, :family_name_kana, :last_name_kana, :birthday, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :last_name_kanji, format: { with: NAME_REGEX }
  validates :family_name_kanji, format: { with: NAME_REGEX }
  validates :last_name_kana, format: { with: KANA_REGEX }
  validates :family_name_kana, format: { with: KANA_REGEX }
end
