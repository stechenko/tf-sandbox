package terraform

import input.tfplan as tfplan


# Check only allowed clouds
deny[msg] {
    msg := sprintf("Fail advisory policy")
}
