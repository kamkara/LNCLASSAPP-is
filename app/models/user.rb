class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  attr_writer :logged

     ################## SLUG ###############
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    username_changed?
  end

  ################  SIGN IN PHONE NUMBR OR EMAIL  ###########################


def logged
  @logged || self.contact || self.email
end

def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if logged = conditions.delete(:logged)
    where(conditions.to_h).where(["lower(contact) = :value OR lower(email) = :value", { :value => logged }]).first
  elsif conditions.has_key?(:contact) || conditions.has_key?(:email)
    where(conditions.to_h).first
  end
end

end
