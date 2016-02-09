module ApplicationHelper
  # methods available for all pages in admin app
  def url_for_page(page)
    root_path + if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end
  end
end
