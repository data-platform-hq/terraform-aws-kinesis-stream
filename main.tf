resource "aws_kinesis_stream" "this" {
  count                     = var.create ? 1 : 0
  name                      = var.name
  shard_count               = var.stream_mode == "ON_DEMAND" ? null : var.shard_count
  retention_period          = var.retention_period
  shard_level_metrics       = var.shard_level_metrics
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.encryption_type == "KMS" ? var.kms_key_id : null
  tags                      = var.tags
  stream_mode_details {
    stream_mode = var.stream_mode
  }
}

resource "aws_kinesis_stream_consumer" "this" {
  for_each = {
    for v in var.consumers : v => v if var.create
  }
  name       = each.value
  stream_arn = aws_kinesis_stream.this[0].arn
}
