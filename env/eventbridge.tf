
######################################################################################################
# Create eventbrdige bus and rules
# Notice: event_pattern has to be as one line json and before each " please put three backslashes \\\
# https://tools.knowledgewalls.com/online-multiline-to-single-line-converter
# For example:
#   {
#     "detail": {
#       "selling_channel": {
#       "name": [
#           "Shopify"
#               ]
#           }
#       }
#   }
#event_pattern = "{\\\"detail\\\":{\\\"selling_channel\\\":{\\\"name\\\":[\\\"Shopify\\\"]}}}"
######################################################################################################

module "event_bus" {
    source         = "../modules/aws-eventbridge/event-bus"

    event_bus_name = "bond-${var.env_suffix}"
}

module "event_rule_shopify" {
    source        = "../modules/aws-eventbridge/event-rule"

    rule_name     = "Shopify"
    event_pattern = "{\\\"detail\\\":{\\\"selling_channel\\\":{\\\"name\\\":[\\\"Shopify\\\"]}}}"
    event_target  = module.sqs_shopify.this_sqs_arn
    event_bus     = "bond-${var.env_suffix}"
}

module "event_rule_scheduling" {
    source        = "../modules/aws-eventbridge/event-rule"

    rule_name     = "scheduling"
    event_pattern = "{\\\"detail-type\\\":[\\\"Order Fulfilled\\\",\\\"Order Created\\\"]}"
    event_target  = module.sqs_scheduling.this_sqs_arn
    event_bus     = "bond-${var.env_suffix}"
}

module "event_rule_onfleet" {
    source        = "../modules/aws-eventbridge/event-rule"

    rule_name     = "onfleet"
    event_pattern = "{\\\"detail-type\\\":[\\\"Order Fulfilled\\\",\\\"Order Updated\\\",\\\"Order Cancelled\\\",\\\"Order Status Changed2\\\"]}"
    event_target  = module.sqs_onfleet.this_sqs_arn
    event_bus     = "bond-${var.env_suffix}"
}

module "event_rule_shipstation" {
    source        = "../modules/aws-eventbridge/event-rule"

    rule_name     = "shipstation"
    event_pattern = "{\\\"detail\\\":{\\\"selling_channel\\\":{\\\"name\\\":[\\\"Shipstation\\\"]}}}"
    event_target  = module.sqs_shipstation.this_sqs_arn
    event_bus     = "bond-${var.env_suffix}"
}

module "event_rule_api" {
    source        = "../modules/aws-eventbridge/event-rule"

    rule_name     = "api"
    event_pattern = "{\\\"detail-type\\\":[\\\"Label Printed\\\",\\\"Order Updated\\\",\\\"Order Created\\\",\\\"Order Status Changed2\\\",\\\"Scheduling\\\"]}"
    event_target  = module.sqs_bond_api.this_sqs_arn
    event_bus     = "bond-${var.env_suffix}"
}