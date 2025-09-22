
# API With SOAP
This repository demonstrates how to build a simple CRUD API using SOAP. It is designed as a reference for developing SOAP APIs in a mini library project use case.

Demonstrate how to create simple CRUD API with SOAP, this repository dedicated for lecturer activities.

## Features
- Basic CRUD for use case db_library

Please clone this project and make sure to follow all instruction below:

## Requirements
- Python 3.7+
- spyne
- python-dotenv
- mysql-connector-python


## Preparation
**Import Database Dump**
- Please import the dump file db, the file located in the directory `stuff/db_library.sql`

**Import Postman Collection**
- Please import the collection in the postman, the file located in the directory `documentation/api_wsdl_trpl.postman_collection.json`

## Installation
### Step 1: Clone the repository
```
git clone https://github.com/firmangel8/api_soap.git
cd api_soap
```
or clone with:
```
git clone git@github.com:firmangel8/api_soap.git
cd api_soap
```

### Step 2: Installation package
- `pip install -r requirements.txt`


## How to Run SOAP Server
**Run this command in the root project directory **
- `cd server`
- `python server.py`

## How to Run SOAP Client
**Run this command in the root project directory **
- `cd client`
- `python client.py`
