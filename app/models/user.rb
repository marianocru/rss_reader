class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:google_oauth2, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :login, :profile_id, :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :avatar, :profile
  # attr_accessible :title, :body
  has_many :channels
  has_many :authentications


  has_attached_file :avatar,
                    :styles => {
                        :thumb => "100x100#",
                        :small => "200x200#",
                        :medium => "400x400"
                    }

  validates_presence_of :first_name, :last_name
  validates_presence_of :login, :on => :create
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :maximum => 50
  validates_length_of :login, :maximum => 50


  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
      end
    end
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
