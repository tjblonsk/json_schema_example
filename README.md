# README

This app demonstrates using JSON Schema for request validations versus the traditional mechanism of using model validations.

Follow the commits to find relevant chunks of code.

This is an artifact from a talk given at [NYC.rb](https://www.meetup.com/NYC-rb/events/235117569/)

Feel free to open an issue/submit a PR.

## Relevant code
* `PostsController#create` and `Post`
  * This is a traditional action that builds up the object from request params, performs validations, then renders a response.

* `CommentsController#create`
  * This controller uses a `#before_action` to validate the request body against the JSON Schema located in `config/schemas`.
  * Relevant specs in `spec/schemas`.

* Makefile and `scripts/update_s3_schema.sh`
  * Deploys schemas to an S3 bucket.

## Why is this useful?
1. Slims down the model by decreasing required validations. Something like a presence validation should be a null constraint in the DB
2. Speeds up response time by not building up the whole ActiveRecord object and running all validations (especially when something like a required field is missing from the request to begin with).
3. Deploying these schemas to a publicly available S3 bucket helps clients understand and stay up to date with what the API is expecting.

## Relevant materials
* https://github.com/ruby-json-schema/json-schema
* http://json-schema.org
* http://json-schema.org/latest/json-schema-validation.html
