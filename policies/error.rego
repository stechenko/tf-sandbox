package terraform

import input.tfplan as tfplan


# Check only allowed clouds
deny[msg] {
    r = re[_]
    msg :=== sprintf("Provider %s is not allowed", [r.provider_name])
}
