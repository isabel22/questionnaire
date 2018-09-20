# README

This project allows you to create a document with a title and as many questions as you want. When the document has at least one question, you will be able to answer the document.

## Requirements
- MongoDB

## Deployment instructions

- sudo mongod
- bundle install
- bundle exec rails s
- Visit localhost:3000

## Pending

- Use react for searches
- Specs
- Improve visualization
- Use of roles for users

## How to test it

1. Deploy the project
2. Create a user
3. Create `New Document`(s)
4. On `localhost:3000`, click on `Questions` for all the created `Documents`
5. When you have finished adding `Questions`, you will be able to `Answer` the `Document`. You can do it from `localhost:3000`
6. After you (or someone else) has answered any `Document`, you will see the options `Show my Answer` or `Show all Answers`.
- The option `Show my Answer` will show only your answer.
- The option `Show all Answers` will show you the list of users that have answered and you will be able to view the answer of any of these users.
