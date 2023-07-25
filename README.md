# Facebook Clone

Welcome to Facebook Clone! This is a web application built using Ruby on Rails that mimics some of the basic features of the popular social media platform, Facebook.

## Features

1. User Authentication
   - Users must sign in to access the application, except for the sign-in page.
   - Sign-in functionality is implemented using the Devise gem for easy user authentication.

2. Friend Requests and Friendships
   - Users can send Friend Requests to other users.
   - A user must accept a Friend Request to become friends.
   - Friend Requests appear in the notifications section of a user's navbar.

3. Posts, Likes, and Comments
   - Users can create text-only Posts.
   - Users can Like Posts.
   - Users can Comment on Posts.
   - Posts display the post content, author, comments, and likes.

4. Timeline (Posts Index Page)
   - The Posts Index page functions like Facebook's "Timeline" feature.
   - It shows all recent posts from the current user and their friends.

5. User Profiles
   - Users can create a profile with their personal information and photo.
   - Gravatar is used for displaying the user's photo.

6. Facebook Login Integration
   - Users can sign in using their real Facebook account.
   - OmniAuth is used for integrating Facebook login with Devise.

7. Welcome Email
   - A welcome email is sent to new users when they sign up using the mailer functionality.
   - The letter_opener gem allows testing the email in development mode.

## Prerequisites

- Ruby (>= 2.5.0)
- Ruby on Rails (>= 6.0)
- PostgreSQL

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/toitw/facebook-clone.git
cd facebook-clone
```

2. Install dependencies:

```bash
bundle install
```

3. Set up the database:

```bash
rails db:create
rails db:migrate
```

4. Start the server:

```bash
rails server
```

The application should now be running on `http://localhost:3000`.

## Deploying the Application

To deploy the application to a hosting provider, follow these steps:

1. Set up the production environment with the required configurations for the chosen hosting provider.

2. Prepare the database for production:

```bash
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:migrate
```

3. Precompile the assets for production:

```bash
RAILS_ENV=production rails assets:precompile
```

4. Start the production server:

```bash
RAILS_ENV=production rails server
```

## Additional Configuration

- To set up an email provider for sending real emails, follow the instructions provided by your chosen email service provider. Update the email configuration in `config/environments/production.rb`.

- For any additional configuration or customization, refer to the Rails documentation and the documentation of the used gems.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---


