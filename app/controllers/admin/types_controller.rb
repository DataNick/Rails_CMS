module Admin
  class TypesController < ApplicationController
    before_action :find_type, only: [ :edit, :update ]
    def index
      @types = Type.all
    end

    def new
      @type = Type.new
      3.times { @type.field_definitions.build }
    end

    def edit
      3.times { @type.field_definitions.build }
    end

    def create
      @type = Type.new(type_params)
      if @type.save
        redirect_to admin_types_path, notice: "Type created."
      else
        render :new
      end
    end

    def destroy
    end

    def update
      if @type.update_attributes(type_params)
        redirect_to admin_types_path, notice: "Type updated."
      else
        render :edit
      end
    end

    private

    def type_params
      params.require(:type).permit(:name, field_definitions: [ :key, :id ])
    end

    def find_type
      @type = Type.find(params[:id])
    end
  end
end