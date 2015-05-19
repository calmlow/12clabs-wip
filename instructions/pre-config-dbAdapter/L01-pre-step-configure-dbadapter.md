# Configure the DB Adapter and Data Sources

## 1.0 Open the wls console

* 1.1 Goto: http://127.0.0.1:7101/console or http://<computername>:7101/console
* 1.2 Click the left menu choice DataSources
* 1.2 Consult below table 1.0 and add the corresponding values
* 1.4 Add the Data Source.
* 1.5 Add the outbound connection 
* 1.6 Consult the images how to navigate
* 1.7 XADataSourceName
* 1.8 Restart the IntegratedWebLogicServer

### Table 1.0

| Name             | Value                        |
| ---------------- |:----------------------------:|
| JNDI Name        | eis/DB/Mydemodb              |
| XADataSourceName | jdbc/MydbdemoDataSource      |

