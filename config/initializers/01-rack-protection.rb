require 'rack/protection'

# We're using jquery.iframe-transport in the frontend to support AJAX file uploads.
# This plugin will send a form to the backend from an iframe that is built internally by that plugn.
# In order for this to be allowed, we need to set the X-Frame-Options header.
# NOTE: Once jquery.iframe-transport is no longer used or backend and frontend run on the same port,
#       remove the frame_options and force_frame_options params
Beanangel::Application.middleware.use Rack::Protection, except: [:session_hijacking, :remote_token],
                                      frame_options: "ALLOW-FROM http://#{Beanangel::Application::HOSTS[:frontend][Rails.env.to_sym]}/",
                                      force_frame_options: true