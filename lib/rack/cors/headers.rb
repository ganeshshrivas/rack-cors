module Rack::CORS
  module Headers
    def preflight_headers
      {
        'Access-Control-Allow-Origin' => access_control_allow_origin,
        'Access-Control-Allow-Methods' => access_control_allow_methods,
        'Access-Control-Max-Age' => '127800',
        'Access-Control-Allow-Headers' => access_control_allow_headers
      }
    end

    def basic_headers
      { 'Access-Control-Allow-Origin' => access_control_allow_origin,
        'Access-Control-Allow-Headers' => access_control_allow_headers
      }
    end

    def access_control_allow_origin
      @allowed_origins ||= allowed_origins
    end

    def access_control_allow_methods
      @allowed_methods ||= @options[:request_methods].join(',')
    end

    def access_control_allow_headers
      @allowed_headers ||= @options[:allowed_headers].join(',')
    end

    def allowed_origins
      if @options[:any_origin]
        '*'
      else
        @options[:allowed_origins].join(',')
      end
    end
  end
end
