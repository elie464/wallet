class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.all
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    respond_to do |format|
      if @entity.save
        flash[:success] = "Entity created"
        format.html { redirect_to entity_url(@entity) }
      else
        flash[:danger] = "#{@entity.errors.full_messages.first}"
        format.html { redirect_to entities_url }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @entity.update_attributes(entity_params)
        flash[:success] = "Entity updated"
        format.html { redirect_to entity_url(@entity) }
      else
        flash[:danger] = "#{@entity.errors.full_messages.first}"
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy

    respond_to do |format|
      if @entity.destroy
        format.html { redirect_to entities_url }
      else
        flash[:danger] = "#{@entity.errors.full_messages.first}"
        format.html { redirect_to entities_url }
      end
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :type)
  end

end