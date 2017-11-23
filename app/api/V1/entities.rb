module V1
  class Entities < Grape::API

    version 'v1', using: :path

    resource :entities do
      desc "Get all Entities"
      get do
        Entity.includes(:account).all
      end

      desc "Post Entity"
      params do
        requires :name, type: String
        requires :type, type: String, values: ['User', 'Team', 'Stock']
      end
      post do
        entity = Entity.new(name: params[:name], type: params[:type])
        if entity.save
          render entity, serializer: EntitySerializer
        else
          logger.info("Entity Create Error: #{entity.errors.full_messages.first}")
          error!(entity.errors.full_messages.first, 422)
        end
      end

      desc "Get Entity"
      params do
        requires :id, type: Integer, desc: "ID of the entity"
      end
      get ':id' do
        entity = Entity.find(params[:id])
        render entity, serializer: EntitySerializer
      end

      desc "Update Entity"
      params do
        requires :id, type: Integer
        optional :name, type: String
        optional :type, type: String, values: ['User', 'Team', 'Stock']
      end
      put ':id' do
        entity = Entity.find(params[:id])
        if entity.update({name: params[:name], type: params[:type]}.reject {|k, v| v.blank?})
          render entity, serializer: EntitySerializer
        else
          logger.info("Entity Update Error: #{entity.errors.full_messages.first}")
          error!(entity.errors.full_messages.first, 422)
        end
      end

      desc "Delete Entity"
      params do
        requires :id, type: Integer
      end
      delete ':id' do
        entity = Entity.find(params[:id])
        if entity.destroy
          true
        else
          logger.info("Entity Delete Error: #{entity.errors.full_messages.first}")
          error!(entity.errors.full_messages.first, 422)
        end
      end

    end
  end
end