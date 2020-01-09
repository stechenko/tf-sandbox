package terraform

import input.tfplan as tfplan

a := [0, 1]
b := 10

deny[msg] {
    c = a[_]
    c > b
    msg := sprintf("Fail policy")
}
