resource "aws_sqs_queue" "mySQSQueueStandard" {
  for_each = {
    queue01 = "standard"
    queue02 = "standard"
    queue03 = "standard"
    queue04 = "standard"
    queue05 = "standard"
  }
  name = "${each.key}-${each.value}"
}

resource "aws_sqs_queue" "mySQSQueue" {
  for_each = {
    queue07 = "fifo"
    queue08 = "standard"
    queue09 = "standard"
  }
  name       = "${each.key}-${each.value == "fifo" ? "myFIFO" : "myStandard"}${each.value == "fifo" ? ".fifo" : ""}"
  fifo_queue = each.value == "fifo"
}
