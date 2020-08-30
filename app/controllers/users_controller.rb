class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def edit
        
    end
    
    def update
        current_user.update(user_params) #acutaliza el usuario usando strongparams
        
        redirect_back(fallback_location: root_path)#regresa a la pagina anterior(ruta por si no hay pagina anterior)
    end
    
    def user_params
        params.require(:user).permit(:avatar)#solo recibira el avatar
    end
end
