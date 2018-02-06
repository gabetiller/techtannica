# Techtannica
## A markdown wiki collaboration tool.   
<p>Techtannica is a Rails based application that allows users to create public or private wikis (based on membership credentials). If a standard user wishes to create private wikis and allow for collaboration with other users, there is an option to upgrade for a small fee (through stripe). </p>
---
# Setup
**Languages and Frameworks: Ruby on Rails and Bootstrap**

**Ruby version 2.4.1* *  
Databases: SQLite (Test, Development), PostgreSQL (Production)

**Development Tools and Gems:**

- Devise for user authentication
- Redcarpet for Markdown formatting
- Pundit for authorization
- Stripe for payments

## To run Blocipedia locally:

- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Run the app on localhost:3000
