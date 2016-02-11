class PagesController < ContentController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def show
    render template: tempate_to_render #matches page haml file in default folder
  end


  protected

  def template_to_render
    "page"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end


end
