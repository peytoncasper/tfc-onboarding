mock "tfplan/v2" {
  module {
    source = "../../testdata/team-owner-change/mock-tfplan-v2-undefined.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}