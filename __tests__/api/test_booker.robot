*** Settings ***
Variables      ../../resources/variables.py


*** Test Cases ***
Create Booking
    ${headers}    Create Dictionary    Content-Type=${content_type}
    