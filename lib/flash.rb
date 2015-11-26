class Flash
  def initialize(req)
    @flash = {}
    cookies = req.cookies
    @flashnow = cookies["_rails_lite_app_flash"]
    if @flashnow
      @flashnow = JSON.parse(@flashnow)
    else
      @flashnow = {}
    end
  end

  def [](key)
    @flashnow[key] || @flash[key]
  end

  def now
    @flashnow
  end

  def []=(key, val)
    @flash[key] = val
  end

  def store_flash(res)
    cookie = { path: "/", value: @flash.to_json }
    res.set_cookie("_rails_lite_app_flash", cookie)
  end
end
