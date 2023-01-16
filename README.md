Task: Create a ruby based application by following the instruction on the [here](https://tech.olioex.com/rails-coding-task)

## Setup:
1.  Install ruby `3.2.0`
2. `gem install bundler`
3. `bundle install`
4. `rails db:setup`
5. `rails server`

## Tests:
- bundle exec rspec spec

# Solution Approach:
 - Create Rails App using Ruby 3.2.0 and rails 7.0.4
 - It's wise to keep Rails code chunks as concise and understandable as possible. A controller would be access the   business logic that is frequently contained in a service for a specific feature. Here, a service created as `ArticlesListService` retrieves a list of articles in a json file.
 - The article indexing method retrieves all the items and displays them here using view. Here, there are multiple ways to we can create a "like" on that article by using the user login app or global user access. However, I have to keep it simple to use, and the "like" functionality only allows you to create "like" but not "unlike" (TODO: we can add it), and the model is currently based on the article and like but the user interaction considered as global.
