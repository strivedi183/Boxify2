class User
	include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  # Fields for User model not added by devise
  field :name,          type: String
  field :first_name,    type: String
  field :last_name,     type: String
  field :address,       type: String
  field :city,          type: String
  field :state,         type: String
  field :zip,           type: String
  field :phone,         type: String
  field :logo,          type: String
  field :cc_id,         type: String
  field :provider,      type: String
  field :uid,           type: String
  field :interests,     type: Array # used to match with Boxes (items in Box)
  field :role,          type: String # added for CanCan

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :name, :address, :logo, :cc_id, :provider, :uid, :username,
                  :role_ids

  validates_uniqueness_of :email

  has_many :boxes
  has_many :subscriptions
  has_and_belongs_to_many :roles

  before_save :define_role

  # method to check role of user
  def role?(role)
    # may need refactor for Mongoid
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Assign default role to a new user (default is customer)
  def define_role
    if self.role_ids.empty?
      self.role_ids = ["51c3a61d2986cb13a7000002"] # default is customer
    end
  end

  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     user = User.create(name:auth.extra.raw_info.name,
  #                          provider:auth.provider,
  #                          uid:auth.uid,
  #                          email:auth.info.email,
  #                          password:Devise.friendly_token[0,20]
  #                          )
  #   end
  #   user
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # # twitter auth
  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.username = auth.info.nickname
  #   end
  # end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end    
  # end

  # def password_required?
  #   super && provider.blank?
  # end

  # def update_with_password(params, *options)
  #   if encrypted_password.blank?
  #     update_attributes(params, *options)
  #   else
  #     super
  #   end
  # end
end