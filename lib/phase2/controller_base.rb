require 'active_support/inflector'
module Phase2
  class ControllerBase
    attr_reader :req, :res

    # Setup the controller
    def initialize(req, res)
        @req = req
        @res = res
        @already_built_response = false
    end

    # Helper method to alias @already_built_response
    def already_built_response?
        @already_built_response
    end

    # Set the response status code and header
    def redirect_to(url)
        if !already_build_response?
            @res.header["Location"] = url
            @res.status = 302
            @already_built_response = true
        else
            raise "Cannot double render"
        end
        
    end

    # Populate the response with content.
    # Set the response's content type to the given type.
    # Raise an error if the developer tries to double render.
    def render_content(content, content_type)
        if !already_build_response?
            @res.body = content
            @res.content_type = content_type
            @already_built_response = true
        else
            raise "Cannot double render"
        end
        
    end

    def render(template)
        f = File.read("views/#{controller_name}/#{template}.html.erb")
        f.each_line do |line|
        
        

    end
  end
end
