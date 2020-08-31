class Article < ApplicationRecord
    #indicarle que tiene un campo con texto enriquesido, dicho campo se llamara "content" (se puede cambiar el nombre)
    has_rich_text :content
    belongs_to :user   #cada articulo solo puede pertenecer a un usuario 
    
    #en una relacion "uno a muchos", se pone belongs en la tabla de "muchos" hacia la tabla "uno"
    #belongs va en la tabla modificada
    #user en singular
    
    has_many :category_articles, dependent: :destroy
    has_many :categories, through: :category_articles
    #relacion uno a muchos un articulo puede pertenecer a muchas categorias y una categoria puede ser parte de muchos articulos
    
    #se crea la tabla intermediaria CategoryArticle y se establece la relacion :categoryarticles en plural
    
    #tambien con la de :categories y se establece atraves de cual tabla se van a relacionar
    
    attr_accessor :category_elements 
    #para la ingresar en la tabla intermedia de muchos a muchos
    #define una propiedad que se puede leer y escribir la llamaremos :category_elements
    
    def save_categories #metodo para registrar en la tabla intermedia muchos a muchos
        
        return category_articles.destroy_all if category_elements.nil? || category_elements.empty?
            category_articles.where.not(category_id: category_elements).destroy_all
        
        #si no viene como arreglo------------------------------------------------------------------
        #recibiremos del form las categorias 1,2,3
        #convertirlo en un arreglo separado por comas
        #categories_array = category_elements.split(",")
        #iterar el arreglo
        #guardar cada parte del arreglo como un registro diferente
        #categories_array.each do |category_id|
        #    CategoryArticle.find_or_create_by(article: self, category_id: category_id) #CategoryArticle en singular y mayus igual que la tabla
        #end
        #este bloque guarda cada elemento del arreglo en la tabla intermedia muchos a muhcos categoryarticles
        #si viene como arreglo------------------------------------------------------------------
        category_elements.each do |category_id|
          CategoryArticle.find_or_create_by(article: self, category_id: category_id)
        end
    end
end
