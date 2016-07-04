class PagesController < ApplicationController
  def show
    @page ||= Page.find_by(path: params[:path] || "home") || not_found
    @html = @page.text_to_html

    if ["home", "contact"].include? @page.path
      render @page.path, layout: true
    else
      render :show
    end
  end
end
