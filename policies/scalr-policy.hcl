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
    enforcement_level = "soft-mandatory"
}

policy "failed" {
    enabled = true
    enforcement_level = "soft-mandatory"
}
