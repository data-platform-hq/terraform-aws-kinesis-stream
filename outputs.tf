output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the Stream"
  value       = try(aws_kinesis_stream.this[0].arn, null)
}

output "id" {
  description = "The unique Stream id"
  value       = try(aws_kinesis_stream.this[0].id, null)
}

output "shard_count" {
  description = "The count of Shards for this Stream"
  value       = try(aws_kinesis_stream.this[0].shard_count, null)
}
