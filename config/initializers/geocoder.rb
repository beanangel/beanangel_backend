Geocoder.configure(

  # geocoding service
  :lookup => :ovi,

  # to use an API key:
  :api_key => [ENV['GEOCODER_APP_ID'], ENV['GEOCODER_APP_CODE']],

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  :language => :de,

  # set default units to kilometers:
  :units => :km,
)