Rails.application.routes.draw do
  devise_for :users #para los usuarios, lo crea devise
    
    resources :articles do 
        #Arquitectura RES que genera automaticamente todas las routas comentadas
        #dentro del bloque do(opcional) se ponen las rutas que son diferentes a la arquitectura RES
        get "user/:user_id", to: "articles#from_author", on: :collection    #on: :collection es para mostrar una colleccion(el contrario es on: :member)
    end
    
    #get- mostar
    #patch-actualizar
    #delete-borrar
    
    #get "articles/user/:user_id", to: "articles#from_author"
    
    #ROOT-----------------------------------------------------------------------------------------------------------
    root to: "home#index"
    #-----------------------------------------------------------------------------------------------------------
    
    #HOME-----------------------------------------------------------------------------------------------------------
    #get "[direccion que toma]", to: "[controlador]#[accion de ese controlador]"
    #tambien 
    #primer diagonal opcional
    get "/bienvenido", to: "home#index"
    #------------------------------------------------------------------------------------------------
    
    #Index-------------------------------------------------------------------------------------------
    #get "articles", to: "articles#index"
    #-------------------------------------------------------------------------------------------
    
    #NUEVO-----------------------------------------------------------------------------------------------------------
    #get "articles/new", to: "articles#new", as: :new_article
    #-----------------------------------------------------------------------------------------------------------
    
    #CREAR-----------------------------------------------------------------------------------------------------------
    #post "articles", to: "articles#create"#entra aqui porque hagarra el plural de @article de app/views/article/new.html.erb y hace una peticion post
    #-----------------------------------------------------------------------------------------------------------
    
    #MOSTRAR-----------------------------------------------------------------------------------------------------------
    #los comodines empiezan con : seguido de un identificador
    #en este caso es el id del articulo a mostrar
    #get "articles/:id", to: "articles#show"
    #-----------------------------------------------------------------------------------------------------------
    
    #EDITAR-----------------------------------------------------------------------------------------------------------
    #get "articles/:id/edit", to: "articles#edit"
    #-----------------------------------------------------------------------------------------------------------
    
    #ACTUALIAR-----------------------------------------------------------------------------------------------------------
    #patch "articles/:id", to: "articles#update", as: :article
    #-----------------------------------------------------------------------------------------------------------
    
    #ELIMINAR-----------------------------------------------------------------------------------------------------------
    #delete "articles/:id", to: "articles#destroy"
    #-----------------------------------------------------------------------------------------------------------
end
