Aws.config.update({
  region: 'us-west-1',
  credentials: Aws::Credentials.new('', ''),
})

S3_BUCKET = Aws::S3::Resource.new.bucket('')