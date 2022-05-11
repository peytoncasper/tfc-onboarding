policy "restrict-team-modules" {
    source = "./restrict-team-modules.sentinel"
    enforcement_level = "soft-mandatory"
}

policy "team-owner-change" {
    source = "./team-owner-change.sentinel"
    enforcement_level = "soft-mandatory"
}