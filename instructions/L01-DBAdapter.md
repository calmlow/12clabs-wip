# LAB 01 - DB Adapter

## 1.0 Create a New Application

### Instructions

* 1.1 Open JDeveloper and create a new application
* 1.2 From the Categories tree in File -> New, click on General to open the Wizard

| Name                  | Value             |
| --------------------- |:-----------------:|
| Application Name      | Labs12cApp        |
| Project Name          | validationForCC   |

* 1.3 Select generic application from the Items field.
* 1.4 Give the application a name
* 1.5 Give the Project a name; "validationForCC"
* 1.6 Select SOA in the Project Technologies tab
* 1.7 In the next step select "Empty Composite"

### Hints

1.1 Modify the directories to where you want the source files to be saved.


### Questions

1.1 ???


## 2.0 Create a Database Connection

### Instructions


| Name                   | Value             |
| ---------------------- |:-----------------:| 
| *DB Connection name*   | MYSQLdemodb       |
| *JNDI Name*            | eis/DB/oracle2SRC |



## 2.0 Adding the Database Adapter


### Instructions

| Name                                    | Value          |
| --------------------------------------- |:--------------:| 
| *DB Connection name*                    | MYSQLdemodb    |
| *primary key*                           | CCNUMBER       |
| *Table to query*                        | CREDITCARDINFO |
| *Field to select*                       | STATUS         |
| *parameter name (in select statement)*  | ccnr           |


* 2.1 Drag and drop a Database Adapter onto the External References swim lane.  If you don’t have the Component Palette open, from the menu select View > Component Palette.  If the Component Palette is not showing the SOA components, select SOA from the drop down list.

* 2.2 This database adapter call will return a result of valid or invalid for a given credit card from the database.  A wizard takes you through the steps of configuring the database adapter. 
The title bar of the wizard dialog shows the step number. Click Next on step 1.


* 2.3 Give the name DBAdapter the Reference Name: *QueryCreditStatus*

* 2.4 Choose your DB connection from before. (hint: double-click to select it) 

* 2.6 Follow the database adapter wizard, select the table CREDITCARDINFO.

* 2.7 Step 6 of the wizard lets you override or define the primary key for your table.  In this case, no primary key is defined in the database, so you’ll need to specify it. Check CCNUMBER and leave the rest unchecked.

* 2.9 Add a new parameter to the db adapter wizard and call it ccnr

* 2.10 Build the query with help of the new parameter and make it only select *ccnumber* that equals the *parameter*

### Hints

* 2.1 Uncheck all fields of the table except status

* 2.2 Use the back button if you missed something

### Questions

* 2.1 Does the DB Adapter support transactional behaviour?
* 2.2 What kind of MEP (Message Exchange Pattern) have you implemented by this exercise?
* 2.3 What's the name of the column you placed the DB Adapter?
* 2.5 What's the name of the swim lane where the Mediator component lives? 


## 3.0 Adding the Mediator Component

| Name                                    | Value          |
| --------------------------------------- |:--------------:| 
| *Mediator name*                         | RouteRequest    |


### Instructions

* 3.1 Drag a Mediator component onto the composite diagram into the Components swim lane.

* 3.2 Give it the name "RouteRequest" and choose Template: _Define Interface Later_

* 3.3 Create a Web Service interface to expose this service using SOAP bindings.  Drag a Web Service adapter to the Exposed Services (left-side) swim lane.

* 3.4 Name the service "getStatusByCC" 

* 3.5 Generate WSDL for this service from that same screen.

* 3.6 Make sure to point to the pre-created schema .xsd file, creditcheck.xsd, in the wsdl dialog.

* 3.7 As type for the requesting element choose "creditcardStatusRequest"


### Questions

* 3.1 What file was created in the folder *./SOA/Mediators/* when you dragged in the Mediator component?
* 3.2 What are the two core responsibilities of Mediator?
      Answer: Routing and Transformation
* 3.3 What is the term for deciding where a Mediator sends the message, how it sends the message, and what changes should be made to the message structure before sending it to the target service?
	  Answer: Routing Rules
* 3.4 What are the characteristics of a Static Routing Rule?
      Answer: Routing Rules
* 3.5 What are the characteristics of a Dynamic Routing Rule?
      Answer: Dynamic rules let you externalize the routing logic to an Oracle Rules Dictionary, which in turn enables dynamic modification of the routing logic.


## 4.0 Create the Web Service

| Name                                    | Value                     |
| --------------------------------------- |:-------------------------:| 
| *Web Service name*                      | getStatusForCreditCard    |
| *Prepared schema file*                  | creditcheck.xsd           |


### Instructions

* 4.1 Create a web service on the left-hand side and generate a WSDL from schema 

* 4.2 Locate the schema given for this lab and use the default values for port-type and such 

* 4.3 Make sure you put the requestMessage, replyMessage and the faultMessage to the corresponding elements in the schema

### Hints

* 4.1 You can edit the WSDL file in source view

### Questions

* 4.1 What is the name of the WSDL file being created on disk.
* 4.2 What is a difference from 11g that you notice about what files created? 

## 5.0 Wire it up and Make Transformations in the Mediator Component

### Instructions

* 5.1 Now the components can be connected or "wired" together. Wire the inbound web service binding to the Mediator component.

* 5.1 Edit the Mediator component.  The RouteRequest.mplan window displays.

* 5.2 Create a new mapper file. Choose XQuery and accept the default name.

* 5.3 Drag the corresponding wires with their matching names to one another.

## 6.0 Deploy your application



