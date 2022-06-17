# README

# Homeday1

A coding assigment for Homeday: Build an API to connect a seller to the nearest available realtor.

## Technologies Used

* Ruby on Rails: ruby version 3.0.2, Rails version 7.0.3
* gems: active_model_serializers, activerecord-postgres-earthdistance, rspec, faker

## Setup/Installation Requirements

* if not present, install postgres
* set up database: rails db:create, rails db:migrate
* seed database with realtors: rails db:seed
* run tests with spec

## Improvements

### Time
* time zones aren't properly considered at the moment

### Realtor's calendar
* a method to check the availabilty of the realtor should be added

### Testing
* the api needs request tests and better model tests
* since I have never worked with rspec before, I was only able to write simple tests and tested the api with postman

### Service Object
* the create action in appointments_controller should call a service object and not have all the logic itself

### Authorization
* in a next step, authorization should be added to realtors
