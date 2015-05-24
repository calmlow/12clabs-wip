# LAB 02 - DB Adapter

> In this lab we will cover 4 topics. DBAdapters, Correlations, SubProcesses and Faults (Extra)

## 1.0 Create a New Application and Project
Create the application and project base. Also add the given wsdl+schema onto composite with a BPEL component (defined interface later option)

### 1.1 Details

Name                  | Value           
--------------------- |----------------
Application Name      | SoaLabApp02
Package Prefix        | -blank-
Project Name          | PurchaseToPay
Start from:           | _Empty Composite_
Service Name          | DoPayment
BPEL Name             | ProcessPayment

### 1.2 Instructions

* 1.0 Create a new application and project
* 1.1 Add the Service, locate the given WSDL+schema, import to project if prompted
* 1.2 Add the BPEL

### 1.3 Hints

* 1.1 Modify the directories to where you want the source files to be saved.
* 1.2 Do not create applications and projects in directory paths that have spaces (for example, c:\Program Files).


### 1.4 Questions

* 1.1 What is the minimum version of the JDK for JDeveloper to run?
      _Answer: Version must be later than or equal to 1.7.0_15_
* 1.2 What is the maximum number of characters a Composite or component can have?
      _Answer: Names cannot exceed 500 characters_
* 1.3 Can you re-arrange the file structure of the files created as long as they are under the directory SOA for composites?
    _Answer: Yes_
* 1.4 What does the composite.xml file describe?
    _Answer: This file describes the entire composite assembly of services, service components, and references. There is one composite.xml file for each SOA project._

## 2 Add Receive, Assign and Reply activities
Make the flow work by making it retrieve you request and assign the reply with a message

### 2.1 Details

Name                  | Value           
--------------------- |----------------
Receive Operation     | RegisterAmount
Input variable        | Receive1_RegisterAmount_InputVariable (default)
Output variable       | Reply1_RegisterAmount_OutputVariable (default)
ResponseCode          | 1
ResponseMessage       | concat('Amount ',$Receive1_RegisterAmount_InputVariable.part1/ns2:Amount  ,' registered.)

### 2.2 Instructions

* 2.0 Add a receive activity

* 2.1 Add an assign activity and add the outgoing message to ResponseMessage Field

* 2.2 Add a Reply activity

* 2.3 Build (Alt-F9) and Deploy your composite


## 3 Setup correlations and add Pick Activity

### 3.1 Details

Name                          | Value         
----------------------------- |--------------
Correlation Set Name          | Correlation_Set1
Correlation Property          | MyCorrProperty
Initiate                      | Yes
OnMessage operation           | EnterCardNumber

### 3.2 Instructions

* 3.0 Double click the Receive Activity and add a new Correlation set
* 3.1 Make Property Aliases to all the Request and Response Messages for both operations
* 3.2 Add a pick activity

### 3.3 Questions

* 3.1 What is the Property Alias for?
* 3.2 To what file is the Correlation Property added to?
* 3.3 To what file does the correlation wizard add the Property Alias information?

### 3.4 Hints

* 3.0 Below is how a property alias linking to a field on a message looks like

```XML
<vprop:propertyAlias propertyName="corr:MyCorrProperty" part="part1" messageType="tns:RegisterAmountRequestMessage">
    <vprop:query>sch:CorrelationID</vprop:query>
</vprop:propertyAlias>
```

* 3.1 The new correlation wizard doesn't work very good..

    
## 4 Adding the Database Adapter + Point to the new datasource

### 4.1 Details

Name                                 | Value         
------------------------------------ |--------------
DB Connection name                   | MySQLExt      
Database Name                        | demodb                   
Hostname                             | _see whiteboard_   
Port                                 | 3306                            
Database User Name                   | demodb                    
Password                             | _see whiteboard_                  
Custom JDBC URL (alternative)        | jdbc:mysql://hostname:3306/demodb
Adapter Reference Name               | QuerySaldo
primary key                          | CARDNUMBER    
Table to query                       | BANKACCOUNTS 
Field to select                      | BALANCE       
parameter name (in select statement) | cardnr     

### 4.2 Instructions

* 4.0 Drag and drop a Database Adapter onto the External References swim lane.  If you don’t have the Component Palette open, from the menu select View > Component Palette.

* 4.1 This database adapter call will return a result of valid or invalid for a given credit card from the database.  A wizard takes you through the steps of configuring the database adapter. 

* 4.1.1 Give the Reference Name *QuerySaldo* to the DBAdapter

* 4.1.2 Follow the database adapter wizard, select the table BANKACCOUNTS.

* 4.1.3 Step 6 of the wizard lets you override or define the primary key for your table.  In this case, no primary key is defined in the database, so you’ll need to specify it.
Check BALANCE and leave the rest unchecked.

* 4.1.4 Add a new *parameter* to the db adapter wizard and call it *cardnr*

* 4.1.5 Build the query with help of the new parameter and make it only select *CARDNUMBER* that equals the parameter

* 4.2 

### 4.3 Hints

* 4.1 Uncheck all fields of that is not of interest

* 4.2 Choose your DB connection from before. (hint: double-click to select it) 

* 4.3 Your select statement should look like _SELECT CARDNUMBER, BALANCE FROM BANKACCOUNTS WHERE (CARDNUMBER = #cardnr)_

### 4.4 Questions

* 4.1 Does the DB Adapter support transactional behaviour?
* 4.2 What's the name of the swim lane where you placed the DB Adapter?
* 4.3 What's the name of the swim lane where the Mediator/BPEL component lives? 


## 5.0 Add a Subprocess

### 5.1 Details

Name                            | Value           
--------------------------------|---------------------
Subprocess component name       | ValidateCashRegisterID
In variable name                | In
Out variable name               | Out
If-condition                    | string-length($In) = 7)
BPEL subprocess response var    | ValidateCashRegisterIDResponse
Pass return var as              | Uncheck copy of

### 5.2 Instructions

* 5.0 Add a Subprocess in the Composite Editor.

* 5.1 Add 2 variables and add a IF-activity with a condition

* 5.2 From the BPEL add a call activity and call the Subprocess

* 5.2.1 Setup the call with the CashRegisterID as input and 

### 5.3 Questions

* 5.3.1 Does subprocesses exist in 11g?
* 5.3.2 What are good scenarios to use subprocesses?
* 5.3.3 What is implied when you not check Copy of checkbox?


## 6.0 (Extra) WriteAccountStatement - Add the FlowN Activity and a DB Write Adapter

### 6.1 Details

Name                              | Value                    
--------------------------------- |--------------------------
DB Write Adapter name             | *WriteAccountStatement*   
DB Connection                     | *MySQLExt*             
Operation Type                    | *Insert only*           
Import Table                      | ACCOUNTSTATEMENTS     
Attribute Filtering               | *deselect tstamp*    
Invoke Name of db writer in BPEL  | InvokeDBWriter     

### 6.2 Instructions

* 6.1 Drag a Flow Activity to the OnMessage Area

* 6.2 In the composite view, Construct DB Write Adapter in wizard

* 6.3 Wire the Write DB Adapter to the BPEL.

* 6.4 In BPEL Invoke the DB Writer from the second sequence in the FlowN activity.

* 6.5 Assign appropriate values to the DB Write call variable. Include the amount from first call & the card number.

* 6.0 Assign the necesary response messages

* 6.1 Use concat to assign some nice response messages along with the variables retrieved from output of db call.

* 6.2 

## 7.0 (Extra) Add fault handling

### 7.1 Instructions

* 7.0 Add a catchAll activity to catch a negative response from the subprocess

* 7.1 Deploy your app

