module ApplicationHelper
  def shortened_url(request, url)
    "#{request.scheme}://#{request.host}:#{request.port}/#{url.shortened_identifier}"
  end
end
