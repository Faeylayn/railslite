require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
        @req = req
        @sess = {}
        @req.cookies.each do |cook|
            
            if cook.name == '_rails_lite_app'
                val = JSON.parse(cook.value)
                @sess = val
            end
        end
                
    end

    def [](key)
       @sess[key]
    end

    def []=(key, val)
        @sess[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
        new_cookie = WEBrick::Cookie.new('_rails_lite_app', @sess)
        res.cookies << new_cookie
    end
  end
end
