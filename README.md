```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```
```
helm upgrade --install loki grafana/loki-stack \
--set fluent-bit.enabled=false,promtail.enabled=true,grafana.enabled=true \
-f ../config/promtail-values.yml
```

```
 kubectl get secret --namespace default loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

```
 kubectl port-forward --namespace default service/loki-grafana 3000:80
 ```
