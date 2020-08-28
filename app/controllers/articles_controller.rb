class ArticlesController < ApplicationController
    before_action :find_article, except: [:new,:create,:index,:from_author]
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy] #solo los que inicien sesion pueden hacer esto
    
    def index
        @articles = Article.all
    end
    
    def show
        #se recibe de routes el comodin con el id del articulo a mostrar
        #@article = Article.find(params[:id])
    end
    
    def new
        #crea una nuevo ariculo
        #@ se puede acceder a la variable desde la vista
        @article = Article.new
    end
    
    def create
        #crear un registro en la BD
        #en la tabla Article enn la columna title poner "Mi primer articulo"
        #recibimos el dato que viene del formulario de nuevo articulo(app/views/article/new.html.erb) y lo guardamos en una variable
        
        #la columna title es igual a los parametros del formulario de tipo article en su identificador title
    #sin strongparams----------------------------------------------------------------------
        #autenficar usuario metodo 1-------------------------------------------------------------
        #@article = Article.create(title: params[:article][:title], content: params[:article][:content], user: current_user)    #se añade current user al final
        #autenticar usuario metodo 2-----------------------------------------------------------
        #@article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])   #se añade current user al inicio seguido de la tablaen plural
    #--------------------------------------------------------------------------------------
        
        #con strongparams----------------------------------------------------------------------
        @article = current_user.articles.create(article_params) #recive todos los parametros de arriba title,content etc
        #--------------------------------------------------------------------------------------
        
        #render json: @article#para mostrar la variable sin crear la vista(solo de prueba)
        redirect_to @article
    end
    
    def edit
        #edita el articulo que tenga el mismo id de la url
        #@article = Article.find(params[:id])
    end
    
    def update
        #@article = Article.find(params[:id])
        #si no le pasas una de los valores , no lo modificara/actualizara
        
        #sin strongparams----------------------------------------------------------------------
        #@article.update(title: params[:article][:title], content: params[:article][:content])
        
        #con strongparams----------------------------------------------------------------------
        @article.update(article_params) #recive todos los parametros de arriba title,content etc
        #--------------------------------------------------------------------------------------
        
        
        redirect_to @article
    end
    
    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end
    
    def find_article
        @article = Article.find(params[:id])#unicamente para los metodos que reciben un id para encontrar un unico articulo
    end
    
    def from_author
        @user = User.find(params[:user_id])#muestra los articulos del usuario con el id tal
        #:user_id debe ser igual al que se encuentra en routes
    end
    
    def article_params  #[nombre del modelo] params //
        params.require(:article).permit(:title, :content)
        #le decimos que obligatoriamente tenga un parametro :article(por que lo usaremos en create y update) y que solo permita el :title y el :content, ignorara cualquier otro
    end
end
