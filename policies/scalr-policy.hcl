version = "v1"

policy "clouds" {
   enabled = true
}

policy "instance_types" {
    enabled = true
}

policy "tags" {
    enabled = true
}

policy "syntax-error" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "failed" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "failed-advisory" {
    enabled = true
    enforcement_level = "advisory"
}

policy "pass-policy1" {
    enabled = true
    enforcement_level = "advisory"
}

policy "pass-policy2" {
    enabled = true
    enforcement_level = "advisory"
}

policy "pass-policy3" {
    enabled = true
    enforcement_level = "advisory"
}

policy "pass-policy4" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "pass-policy5" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "pass-policy6" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "pass-policy7" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "pass-policy8" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "pass-policy9" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "pass-policy10" {
    enabled = true
}

