provider "akamai" {
  edgerc = "~/.edgerc"
}

resource "akamai_imaging_policy_video" "policy" {
  policy_id              = ".auto"
  contract_id            = "1YY1"
  policyset_id           = "123"
  activate_on_production = true
  json                   = <<-EOF
{
    "breakpoints": {
        "widths": [
            320,
            640,
            1024,
            2048,
            5000
        ]
    },
    "output": {
        "perceptualQuality": "mediumHigh"
    }
}
EOF
}