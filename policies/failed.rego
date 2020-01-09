package terraform

import input.tfplan as tfplan

a := [0, 1]
b := 1

deny[msg] {
    b == a[_]
    msg := sprintf("Fail policy %s", [b])
}
