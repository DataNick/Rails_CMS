class PagesController < ContentController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def show
    render template: "page" #matches page haml file in default folder
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end


end
