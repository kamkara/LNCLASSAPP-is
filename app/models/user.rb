class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:logged]#, :encryptable


  ###############  RELATIONS    ################## 
  #has_many :courses
  #has_many :materials
  #has_many :levels  
  #has_many :posts
  #has_many :messages
  

  attr_writer :logged
  ################## VALIDATES  ###############
  validates :first_name, :last_name, :full_name, :matricule, :email, :contact, :role,  presence: true
  validates :full_name,  length: { minimum:5 }
  validates :contact,  length: { minimum:10 }
  validates :matricule,  length: { minimum:9 }


 ############# customize fields###############"" 
 def generate_password_and_email_for_student
    if self.role == "student"
      self.email = "#{self.contact}+generate@ln.com"
      self.password = "#{self.matricule}" 
    end
  end


  
  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
  def custom_slug
    self.slug = "#{self.full_name} from #{self.city}" 
  end

     ################## SLUG ###############
  extend FriendlyId
    friendly_id :custom_slug, use: :slugged

  def should_generate_new_friendly_id?
    custom_slug_changed? || super
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