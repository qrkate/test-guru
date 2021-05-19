module GistsHelper
  def link_to_gist(gist)
    url = gist.url.split("/").last
    link_to(url, gist.url, target: '_blank')
  end
end
