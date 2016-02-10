module Admin
  class MenusController < ApplicationController
    before_action :set_menu, only: [:update, :edit, :destroy]
    def index
      @menus = Menu.all
    end

    def new
      @menu = Menu.new
      10.times { @menu.menu_items.build } #instantiate a new menu_item object related to menu instance
    end

    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to admin_menus_path, notice: "Menu created"
      else
        render :new
      end
    end

    def update
      if @menu.update_attributes(menu_params)
        redirect_to admin_menus_path, notice: "Menu updated"
      else
        render :edit
      end
    end

    def edit
      10.times {@menu.menu_items.build} #instantiate a new menu_item object related to menu instance
    end

    def destroy
      if @menu.destroy
        redirect_to admin_menus_path, notice: "Menu deleted"
      else
        redirect_to admin_menus_path, alert: "Menu not deleted"
      end
    end

    private

    def menu_params
      params.require(:menu).permit(:name, menu_items_attributes: [ :title, :url, :id ])
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end
  end
end