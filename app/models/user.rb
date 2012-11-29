class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  # attr_accessible :title, :body
  
  attr_accessor :login
  
  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /^[A-Za-z0-9]+$/, message: " can only contain alpha numeric" , allow_blank: true}, on: :update
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end
end
