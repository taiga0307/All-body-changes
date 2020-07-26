if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }

    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_BUCKET']
    config.cache_storage = :fog
    # S3のURLに直アクセス禁止
    config.fog_public = false
  end
else
  CarrierWave.configure do |config|
    config.cache_storage = :file
  end
end