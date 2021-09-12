class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_one_attached :profile
         has_many :likes, dependent: :destroy
         has_many :subjects_users, dependent: :destroy

  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end

  # validates :nickname, :uniqueness => { :message => '이미 존재하는 닉네임입니다.' }
  # validates :nickname, :presence => { :message => '필수 입력사항입니다.' }
  # validates_confirmation_of :password, if: :password_required? # recommended
  validates :password, :length => { :minimum => 8, :maximum => 20, :message => '8~20자 이내로 입력해 주십시오.' }
end
