# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   if Rails.env.production?
#     config.storage :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_directory  = ENV['AWS_BUCKET_NAME']
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#       region: ENV['AWS_DEFAULT_REGION'],
#       path_style: true
#     }
#   else
#     config.storage :file
#     config.enable_processing = false if Rails.env.test?
#   end
# end

# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

    case Rails.env
    when 'production'
        config.fog_directory  = ENV['AWS_BUCKET_NAME']
        config.asset_host = ENV['AWS_BUCKET_URL']
    end
end