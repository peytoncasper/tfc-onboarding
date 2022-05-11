mock "tfconfig/v2" {
  module {
    source = "../../testdata/restrict-team-modules/mock-tfconfig-v2-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}