require 'pry'
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_name = req.path.split("/items/").last
      if @@items.inculde?(item_name)
        resp.write @@items.detect(|item| item.name == item_name).name
      else
        req.status = 400
      end
    else
      req.status = 404
    end
    resp.finish
  end
end
