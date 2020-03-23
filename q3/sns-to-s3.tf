provider "aws" {
  region = "${var.aws_region}"
}
provider "aws" {
  alias  = "ses"
  region = "${var.aws_region_ses}"
}

resource "aws_ses_receipt_rule" "shipamax_incoming_email_rules" {
  name          = "keep_income_emails"
  rule_set_name = "${aws_ses_receipt_rule_set.incoming-rule-set.rule_set_name}"
  recipients    = ["${var.target_recepients}"]
  enabled       = true
  scan_enabled  = true

  s3_action {
    bucket_name = "${var.bucket}"
    position    = 1
  }
}

resource "aws_ses_receipt_rule_set" "incoming-rule-set" {
  provider      = "aws.ses"
  rule_set_name = "save_to_s3"
}


resource "aws_ses_active_receipt_rule_set" "activate_rule" {
  rule_set_name = "${aws_ses_receipt_rule_set.incoming-rule-set.rule_set_name}"
}
