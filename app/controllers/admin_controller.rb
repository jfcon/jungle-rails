class AdminController < ApplicationController
    
before_filter :authenticate

        def authenticate
            authenticate_or_request_with_http_basic('Administration') do |name, password| 
            name == ENV['ADMIN_USER_NAME'] && password == ENV['ADMIN_PASSWORD']
        end
    end
end
