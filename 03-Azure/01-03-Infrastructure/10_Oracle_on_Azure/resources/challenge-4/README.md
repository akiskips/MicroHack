# Migrate to Oracle Database at Azure

In the last challenge we are going to migrate the Oracle database to the Azure Service "Oracle DatabaseAzure" [ODAA].

Oracle Database@Azure is an Oracle database service running on Oracle Cloud Infrastructure (OCI), colocated in Microsoft data centers. This ensures that the Oracle Database@Azure service has the fastest possible access to Azure resources and applications.

Oracle Database@Azure allows you to subscribe to the Oracle Database Service inside your Azure environment. All infrastructure for your Oracle Database Service is located in Azure's physical data centers, giving your critical database workloads the high-performance and low-latency they require. Like other Azure services, Oracle Database@Azure uses an Azure Virtual Network for networking, managed within the Azure environment. The service uses the Azure tenancy's identity management and authorization, which can be either the Azure native identity service or a federated identity provider. The service allows you to monitor database metrics, audit logs, events, logging data, and telemetry natively in Azure.

Oracle Database@Azure runs on infrastructure managed by Oracle's expert Cloud Infrastructure operations team. The operations team performs software patching, infrastructure updates, and other operations through a connection to OCI. While the service requires that customers have an OCI tenancy, most service activities take place in the Azure environment.



ODAA comes in two flavors:
1. [Autonomous Database Services](https://docs.oracle.com/en-us/iaas/Content/database-at-azure-autonomous/odadb-autonomous-database-services.html)
2. [Exadata Services](https://docs.oracle.com/en-us/iaas/Content/database-at-azure-exadata/odexa-exadata-services.html)

During this challenge we are going to use the [Autonomous Database Services](https://docs.oracle.com/en-us/iaas/Content/database-at-azure-autonomous/odadb-autonomous-database-services.html) and create an Autonomous Database on Dedicated Infrastructure.

Follow the instruction at the two following links to create the ODAA and migrate the database:
- [Oracle Database at Azure migration overview by oracle](https://docs.oracle.com/en/solutions/oracle-db-at-azure-migration/index.html#GUID-54E96CD1-06E9-4D82-B8EC-DCF919C32557)
- [Oracle Zero Downtime Migration – Logical Offline Migration to ADB-S on Oracle Database@Azure by oracle](https://www.oracle.com/a/otn/docs/database/zdm-logical-offline-migration-to-oracle-at-azure-adb-s.pdf)
