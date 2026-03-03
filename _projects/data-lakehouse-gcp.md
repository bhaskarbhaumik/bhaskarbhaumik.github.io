---
title: "Enterprise Data Lakehouse on GCP"
excerpt: "Modern data lakehouse platform architecture migrating on-prem EDW to Google Cloud at retail scale."
header:
  teaser: /assets/img/projects/lakehouse.svg
tags: [Data Engineering, GCP, Lakehouse]
---

End-to-end reference architecture for migrating enterprise data warehouses to a modern
cloud-native lakehouse on Google Cloud Platform.

**Key design decisions:**
- BigQuery as the serving layer with Dataplex for governance
- Dataform / dbt for transformation and data quality
- Pub/Sub + Dataflow for real-time streaming ingestion
- Looker + Looker Studio for self-serve BI
- Unity Catalog-style metadata management pattern for multi-domain governance
