class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/}
    validates :last_furigana, format: { with: /\A[ァ-ヶ　ー－]+\z/}
    validates :first_furigana, format: { with: /\A[ァ-ヶ　ー－]+\z/}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
end

# 修正前=================================================
# validates :nickname, presence: true
# with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/} do
#   validates :last_name
#   validates :first_name
# end
# with_options presence: true, format: { with: /\A[ァ-ヶ　ー－]+\z/} do
#   validates :last_furigana
#   validates :first_furigana
# end
# validates :birthday, presence: true
# validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

# 日本語で出力しようとした===============================================================
# validates :nickname, presence: {message: 'を入力してください'}
# with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'お名前（全角）の入力には、全角の漢字・ひらがな・カタカナのみが使用可能です'} do
#   validates :last_name
#   validates :first_name
# end
# with_options presence: true, format: { with: /\A[ァ-ヶ　ー－]+\z/, message: 'お名前カナ（全角）の入力には、全角のカタカナのみが使用可能です'} do
#   validates :last_furigana
#   validates :first_furigana
# end
# validates :birthday, presence: {message: 'を入力してください'}

# PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
# validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください'
# end
