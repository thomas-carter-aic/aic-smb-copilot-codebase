package kubernetes.admission

violation[{"msg": msg}] {
  input.request.kind.kind == "Pod"
  some i
  c := input.request.object.spec.containers[i]
  c.securityContext.privileged == true
  msg := sprintf("container %v is privileged", [c.name])
}
