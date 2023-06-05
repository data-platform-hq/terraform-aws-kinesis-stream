variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Kinesis Stream
################################################################################
variable "name" {
  description = "Name of the Kinesis Stream"
  type        = string
}

variable "shard_count" {
  description = "The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required"
  type        = number
  default     = 1
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream"
  type        = number
  default     = 24
}

variable "shard_level_metrics" {
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream"
  type        = list(string)
  default     = []
}

variable "enforce_consumer_deletion" {
  description = "A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error"
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "The encryption type to use. The only acceptable values are NONE or KMS"
  type        = string
  default     = "NONE"
}

variable "kms_key_id" {
  description = "The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis"
  type        = string
  default     = "alias/aws/kinesis"
}

variable "stream_mode" {
  description = "Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND"
  type        = string
  default     = "PROVISIONED"
}

variable "consumers" {
  description = "List of Kinesis Stream Consumer names"
  type        = list(string)
  default     = []
}
