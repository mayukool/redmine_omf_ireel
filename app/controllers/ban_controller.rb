class BanController < ApplicationController
  

  def index
    @band = Ban.find(:all)
  end

  def vote

    ban = Ban.find(params[:id])
    ban.vote(params[:answer])
    if ban.save
      flash[:notice] = 'Vote saved.'
      redirect_to :action => 'index'
    end
  end

end
