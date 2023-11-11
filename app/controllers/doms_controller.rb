class DomsController < ApplicationController
  before_action :authenticate_user!

  def new
    @dom = Dom.new
  end

  def create
    @dom = Dom.new(dom_params)

    if @dom.save
      redirect_to doms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize! :read, @current_dom
  end

  private

  def dom_params
    params.require(:dom).permit(:user_id, :title, :name, :pronoun)
  end
end