package terraform

import input as tfplan

allowed_platforms = ["aws", "azure", "gce"]
deny_platforms = ["gce", "openstack", "vmware"]

allowed_tags_key = ["owner", "test-env-owner"]

allowed_instance_types = {
    "aws": ["t1.micro", "t1.small", "t2.nano", "t2.small"],
    "gce": ["f1-micro", "n1-standard-1", "n1-standard-2"],
    "azure": ["Basic_A0", "Basic_A1", "Basic_A2", "Standard_D1_v2", "Standard_DS1_v2", "Standard_DS2_v2"]
}

res := tfplan.resource_changes

allowed_resources := [r | r = res[_]; allowed_platforms[_] == r.provider_name]
resources := [r | r = allowed_resources[_]; not "delete" == r.change.actions[0]]


contains(arr, elem) {
  arr[_] = elem
}


# Check instance types
deny[msg] {
    r = res[_]
    instance_types = allowed_instance_types[r.provider_name]
    not contains(instance_types, r.change.after.instance_type)
    msg := sprintf("Instance type '%s' is not allowed on cloud '%s'", 
                    [r.change.after.instance_type, r.provider_name])
}

# Check only allowed clouds
deny[msg] {
    r = res[_]
    deny_platforms[_] == r.provider_name
    msg := sprintf("Provider %s is not allowed", [r.provider_name])
}


#Check tags has owner key
deny[msg] {
    r := resources[_]
    allowed_tags := [tag | tag := allowed_tags_key[_]; r.change.after.tags[tag]]
    count(allowed_tags) == 0
    msg := sprintf("Owner tag not exist in resource '%s'", [r.name])
}
