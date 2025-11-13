
# Orders Vertical Slice (Skeleton)

Gateway → Orders → Payments → Projector with K8s manifests (**canary**, **KEDA**) and Sigstore admission policy.

## Try locally
- Orders service:
  ```bash
  docker build -t orders:dev services/orders
  docker run --rm -p 8080:8080 orders:dev
  curl -XPOST localhost:8080/orders -H 'content-type: application/json' -d '{"tenantId":"t1","currency":"USD","totalAmount":12.34}'
  ```
- Gateway (requires Node 20):
  ```bash
  docker build -t api-gateway:dev services/api-gateway
  docker run --rm -p 8081:8080 -e ORDERS_URL=http://host.docker.internal:8080 api-gateway:dev
  curl -XPOST localhost:8081/api/orders -H 'content-type: application/json' -d '{"tenantId":"t1","currency":"USD","totalAmount":12.34}'
  ```

## Kubernetes
- Replace `OWNER/REPO` in image references.
- `kubectl apply -k deploy/k8s/base`
- (Optional) apply canary and KEDA manifests and install CRDs first.

## Admission policy
- After installing **sigstore/policy-controller**, apply `deploy/k8s/security/clusterimagepolicy.yaml` to require **cosign keyless** signatures from your GH Actions workflow.
