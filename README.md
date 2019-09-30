# ABOUT DepressdogBlog  

## Description
Simple blog app for testing proggraming skils in Ruby on Rails.

First was maked User model without Devise, by using bcrypt for decode passwords and omniauth for make login/registration from socialnetworks.
Then was make functionality of Posts, that have Title, description and images that I send with Carrierwave to handle on cloud service cloudinary. 
And was done Comments for Post and Comments for Comments, and  you can add 1 image to comment, that use Action Cable with Pusher for live update comments.
Also add Likes for Posts and Comments.
And Search on Home page.

### User functionality
User can register using email/password or throw LinkedIn/Facebook. 
After register using email/password user must confirm registration by open link that comes on email.
Without confirmation User can't create Post and Comments, but can Like Posts and Comments.

### Pages
1. Home
    - List of last Posts, and on scroll it will load more.
    - Search that can filter Posts
    - Last registered wich handle last 5 users 
2. Users
    - List of all registred users
3. Login
    - Login form
    - Login from Social networks
4. Signup
    - Form for create new User
5. New post
    - Form with registration
6. User page 
    - User avatar
    - Edit link
    - Destroy link
    - All user Posts
 

### Used
- Ruby 2.6.3
- Rails 5.2.3
### Gemset
- haml-rails | Used for change default template generator.
    > Provides Haml generators for Rails 5
- semantic-ui-sass | Used for make Front-end better.
    > Is an Sass-powered version of Semantic UI and ready to drop into Rails, Compass, or Sprockets
- bcrypt | Used for write my own registration method.
    > Is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords            
- gravtastic | Used for make placeholder image.
    > The super fantastic way of getting Gravatars
- omniauth, omniauth-facebook, omniauth-linkedin-oauth2 | Used for make auth from social networks.
    > OmniAuth is a library that standardizes multi-provider authentication for web applications. It was created to be powerful, flexible, and do as little as possible
- will_paginate, will_paginate_semantic_ui | Used for make beautiful pagination.
    > Is a pagination library that integrates with Ruby on Rails, Sinatra, Merb, DataMapper and Sequel.
- pusher | Used for make action-cable(dont work on heroku)
    > Powering realtime experiences in all your apps
- sendgrid-ruby | Used for maneging email form user confirmation.
    > This library allows you to quickly and easily use the Twilio SendGrid Web API v3 via Ruby.
- carrierwave | Used for upload images
    > This gem provides a simple and extremely flexible way to upload files from Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.
- cloudinary | Used for cary images on cloud.
    > Cloudinary is a cloud service that offers a solution to a web application's entire image management pipeline.