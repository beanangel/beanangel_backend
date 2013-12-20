require 'rack/protection'

# When sending the form via jQuery File Upload we need to add the frontend
# to the whitelist for CSRF protection because the HTTP_ORIGIN of the
# request from the frontend is different from the backend. If we don't add
# it to the whitelist of Rack::Protection::HttpOrigin that middleware will
# block the request.
#
# We're using jquery.iframe-transport in the frontend to support AJAX file uploads.
# This plugin will send a form to the backend from an iframe that is built internally by that plugin.
# In order for this to be allowed, we need to set the X-Frame-Options header.
# NOTE: Once jquery.iframe-transport is no longer used or backend and frontend run on the same port,
#       remove the frame_options and force_frame_options params
Beanangel::Application.middleware.use Rack::Protection, except: [:session_hijacking, :remote_token],
                                      origin_whitelist: "http://#{Beanangel::Application::HOSTS[:frontend][:development]}",
                                      frame_options: "ALLOW-FROM http://#{Beanangel::Application::HOSTS[:frontend][Rails.env.to_sym]}/",
                                      force_frame_options: true