class PagesController < ApplicationController
  def root
    @page = Page.root
    show
  end

  def show
    @page ||= Page.find_by(path: params[:path]) || not_found

    @html = Rails.cache.fetch(@page) do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      markdown.render(@page.text || "").html_safe
    end

    if ["Contact"].include? @page.name
      render @page.path, layout: true
    else
      render :show
    end
  end
end
