mock "tfplan/v2" {
  module {
    source = "../../testdata/team-owner-change/mock-tfplan-v2-fail.sentinel"
  }
}

mock "tfstate/v2" {
  module {
    source = "../../testdata/team-owner-change/mock-tfstate-v2-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}