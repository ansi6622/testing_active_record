module ApplicationHelper
  def shortened_url(request, url)
    "#{request.scheme}://#{request.host}:#{request.port}/#{url.id}"
  end
end
