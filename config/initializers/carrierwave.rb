CarrierWave.configure do |config|
  config.storage           = :aliyun
  config.aliyun_access_id  = $env['aliyun']['oss']['access_id']
  config.aliyun_access_key = $env['aliyun']['oss']['access_key']
  # 你需要在 Aliyum OSS 上面提前创建一个 Bucket
  config.aliyun_bucket     = $env['aliyun']['oss']['bucket']
  # 是否使用内部连接，true - 使用 Aliyun 主机内部局域网的方式访问  false - 外部网络访问
  config.aliyun_internal   = $env['aliyun']['oss']['internal']
  # 配置存储的地区数据中心，默认: cn-hangzhou
  config.aliyun_area     = $env['aliyun']['oss']['area']
  # 使用自定义域名，设定此项，carrierwave 返回的 URL 将会用自定义域名
  # 自定义域名请 CNAME 到 you_bucket_name.oss-cn-hangzhou.aliyuncs.com (you_bucket_name 是你的 bucket 的名称)
  config.aliyun_host       = $env['aliyun']['oss']['host']
  # Bucket 为私有读取请设置 true，默认 false，以便得到的 URL 是能带有 private 空间访问权限的逻辑
  config.aliyun_private_read = $env['aliyun']['oss']['private_read']
end