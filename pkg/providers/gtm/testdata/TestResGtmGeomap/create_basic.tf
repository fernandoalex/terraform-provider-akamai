provider "akamai" {
  edgerc = "~/.edgerc"
}

locals {
  contract = "9-CONTRACT"
  group    = "12345"
  gtmTestDomain = "gtm_terra_testdomain.akadns.net"
}

/*
resource "akamai_gtm_domain" "testdomain" {
        name = "gtm_terra_testdomain.akadns.net"
        type = "weighted"
        contract = "1-2ABCDEF"
        comment =  "Test"
        group     = "123ABC" 
        load_imbalance_percentage = 10
}
*/

resource "akamai_gtm_geomap" "tfexample_geo_1" {
  domain = local.gtmTestDomain 
  name   = "tfexample_geo_1"
  default_datacenter {
    datacenter_id = 5400
    nickname      = "default datacenter"
  }
  assignment {
    datacenter_id = 3132 
    nickname      = "tfexample_dc_2"
    // Optional
    countries = ["GB"]
  }
  wait_on_complete = false
}

