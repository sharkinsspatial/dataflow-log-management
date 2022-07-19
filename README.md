```
helm upgrade --install loki grafana/loki-stack \
--set fluent-bit.enabled=false,promtail.enabled=true,grafana.enabled=true \
-f ../config/promtail-values.yml
```
