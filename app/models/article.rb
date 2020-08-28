class Article < ApplicationRecord
    #indicarle que tiene un campo con texto enriquesido, dicho campo se llamara "content" (se puede cambiar el nombre)
    has_rich_text :content
    belongs_to :user   #cada articulo solo puede pertenecer a un usuario 
    
    #en una relacion "uno a muchos", se pone belongs en la tabla de "muchos" hacia la tabla "uno"
    #belongs va en la tabla modificada
    #user en singular
end
