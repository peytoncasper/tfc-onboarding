mock "tfconfig/v2" {
  module {
    source = "../../testdata/restrict-team-modules/mock-tfconfig-v2-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}