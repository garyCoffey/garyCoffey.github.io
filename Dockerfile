# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Verify that _config.yml is copied correctly
RUN if [ ! -f /app/_config.yml ]; then echo "Error: _config.yml not found"; exit 1; fi

# Install any needed packages specified in Gemfile
RUN bundle install

# Make port 4000 available to the world outside this container
EXPOSE 4000

# Run Jekyll server when the container launches
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]