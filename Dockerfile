# Base image
FROM ruby:2.2

# Optionally set maintainer
MAINTAINER Jeff Rabovsky <jrab89@gmail.com>

# Run shell commands in the container
RUN gem install serve -v 1.5.2

# Copy a file to a directory on the container
ADD hello.txt /some/file/path

# The default command for running a container
CMD ["serve", "0.0.0.0:3000", "."]
