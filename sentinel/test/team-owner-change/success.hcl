mock "tfplan/v2" {
  module {
    source = "../../testdata/team-owner-change/mock-tfplan-v2-success.sentinel"
  }
}

mock "tfstate/v2" {
  module {
    source = "../../testdata/team-owner-change/mock-tfstate-v2-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}