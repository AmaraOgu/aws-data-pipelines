
# Create a Kinesis stream with 1 shard and 24 hour retention period
resource "aws_kinesis_stream" "my_stream" {
  name             = var.kinesis_stream_name
  shard_count      = 1
  retention_period = 24
}
