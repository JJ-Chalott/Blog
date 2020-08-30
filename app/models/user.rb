class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :articles    #un usuario puede tener muchos articulos
  #articles en plural
    
  has_one_attached :avatar #usamos activestorage sirve para documentos,pdf,imagenes, ect
                            #has_one_attached :nombre con el que identificamos al recurso
end
