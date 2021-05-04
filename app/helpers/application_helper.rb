module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test-guru', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def show_flash_type(type)
    content_tag(:div, content_tag(:p, flash[type]), class: "flash alert") if flash[type]
  end
end
