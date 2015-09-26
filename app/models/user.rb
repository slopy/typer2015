class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## Tokens
  field :tokens, type: Hash, default: { }

  ## unique oauth id
  field :provider, type: String
  field :uid, default: ""

    # Get rid of devise-token_auth issues from activerecord
  def self.table_exists?
    true
  end

  def self.columns_hash
    # Just fake it for devise-token-auth; since this model is schema-less, this method is not really useful otherwise
    {} # An empty hash, so tokens_has_json_column_type will return false, which is probably what you want for Monogoid/BSON
  end

  def self.serialize(*args)

  end

  include DeviseTokenAuth::Concerns::User

end
