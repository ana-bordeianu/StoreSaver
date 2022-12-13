from flask import Blueprint, request, jsonify, make_response
import json
from src import db


customer = Blueprint('customer', __name__)

# Get all customers from the DB with their ID and first and last name
@customers.route('/customer', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select customerID, firstName, lastName from customers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID
@customers.route('/customer/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customer where customerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
 
# Get customer shopping list data 
@customers.route('/customer/list/<userID>', methods=['GET'])
def get_list(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from shoppingList where customerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer shopping list data 
@customers.route('/customer/invoice/<userID>', methods=['GET'])
def get_list(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from invoice join invoiceItem join item where customerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
 
# Allows customer to add an item to the list 
# This will be a post request 
 
