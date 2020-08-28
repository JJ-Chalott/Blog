class HomeController < ApplicationController
    before_action :authenticate_user! #authentica ususario antes de cualquier cosa en hom
        
  def index
  end
end
