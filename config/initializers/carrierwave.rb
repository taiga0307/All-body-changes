# developmentの設定
if Rails.env.development?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.cache_storage = :fog
    # S3のURLに直アクセス禁止
    config.fog_public = false
  end
# testの設定
elsif Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.cache_storage = :fog
    # S3のURLに直アクセス禁止
    config.fog_public = false
  end
# productionの設定
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.cache_storage = :fog
    # S3のURLに直アクセス禁止
    config.fog_public = false
  end
end