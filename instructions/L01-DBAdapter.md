# LAB 01 - DB Adapter

## 1.0 Create a New Application

### Instructions

* 1.1 Open JDeveloper and create a new application
* 1.2 From the Categories tree in File -> New, click on General to open the Wizard

| Application Name        | Soa grejs  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

* 1.3 Select generic application from the Items field.
* 1.4 Give the application a name; "CreditCardValidation"
* 1.5 Give the Project a name; "validationForCC"
* 1.6 Select SOA in the Project Technologies tab
* 1.7 In the next step select "Empty Composite"

### Hints

1.1 Modify the directories to where you want the source files to be saved.

### Questions

1.1 ???

## 2.0 Adding the Database Adapter

### Instructions

* 2.1 Drag and drop a Database Adapter onto the External References swim lane.  If you don’t have the Component Palette open, from the menu select View > Component Palette.  If the Component Palette is not showing the SOA components, select SOA from the drop down list.

* 2.2 This database adapter call will return a result of valid or invalid for a given credit card from the database.  A wizard takes you through the steps of configuring the database adapter. 
The title bar of the wizard dialog shows the step number. Click Next on step 1.


* 2.3 Enter the following details on this: Service Name: getCreditValidation

* 2.4 The database adapter will connect to the database, and in order to do that, it needs a database connection which contains all the details needed to connect to the database.  You can pre-create a database connection or create one on the fly.  Since a database connection hasn’t been created yet, you will create one from here.
		Click the green plus icon to the right of the Connection drop-down list to create a new database connection.

* 2.5 In the Create Database Connection dialog enter the credentials to your database.

* 2.6 Follow the database adapter wizard, select the table CREDITCARDINFO.

* 2.7 Step 6 of the wizard lets you override or define the primary key for your table.  In this case, no primary key is defined in the database, so you’ll need to specify it. Check CCNUMBER and leave the rest unchecked.

* 2.8 You are only interested in the status value.

* 2.9 Add a new parameter to the db adapter wizard and call it ccnb

* 2.10 Build the query with help of the new parameter and make it only select ccnumbers that equals the parameter

### Hints

* 2.1 Uncheck all fields of the table except status

1.1 Modify the directories to where you want the source files to be saved.

### Questions


## 3.0 Adding the Mediator Component

### Instructions

* 3.1 Drag a Mediator component onto the composite diagram into the Components swim lane.

* 3.2 Give it the name "RouteRequest" and choose Template: Define Interface Later

* 3.3 Create a Web Service interface to expose this service using SOAP bindings.  Drag a Web Service adapter to the Exposed Services (left-side) swim lane.

* 3.4 Name the service "getStatusByCC" 

* 3.5 Generate WSDL for this service from that same screen.

* 3.6 Make sure to point to the pre-created schema .xsd file, creditcheck.xsd, in the wsdl dialog.

* 3.7 As type for the requesting element choose "creditcardStatusRequest"

### Hints

### Questions

## 4.0 Make a Transformation in the Mediator Component

### Instructions

* 4.1 Double-click (or right-click and select Edit) the RouteRequest Mediator component to open the Mediator editor.  The RouteRequest.mplan window displays.

* 4.2 Create a new mapper file. 

* 4.3 
* 4.4 
* 4.5 
* 4.6 
* 4.7 



