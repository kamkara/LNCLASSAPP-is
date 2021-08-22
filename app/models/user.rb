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
ROLE_NAME   = ["Choisissez votre Role", "City manager", "Marketing", "Head of City Manager", "Content", "Head of Content", "Super prof"]
  
  CITY_NAME   = ["Choisissez votre ville","Tiassalé", "N'Douci","Agboville","Abidjan", "Hermankono", "Divo", "Odienné", "Duékoué", "Danané", "Tingréla", "Bouaké", "Daloa", "Yamoussoukro", "San-Pédro", "Abengourou", "Man", "Gagnoa", "Katiola",
    "Korhogo", "Dabou", "Divo","Grand-Bassam", "Bouaflé", "Issia", "Sinfra",  "Abengourou" ,"Soubré", 
    "Adzopé", "Séguéla", "Bondoukou", "Oumé", "Ferkessedougou", "Dimbokro",
    "Guiglo", "Boundiali", "Agnibilékrou", "Daoukro", "Vavoua", "Zuénoula", "Toumodi", "Akoupé", "Lakota", "Autres villes"]


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
