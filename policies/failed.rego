package terraform

import input.tfplan as tfplan


# Check only allowed clouds
deny[msg] {
    1 > 0
    msg := sprintf("Fail policy")
}
