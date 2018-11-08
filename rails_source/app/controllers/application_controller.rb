class ApplicationController < ActionController::Base
  def index
    render json:{
        yay: "you are on rails api mode! with postgresql!"
    }
  end
end
