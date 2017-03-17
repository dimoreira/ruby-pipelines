# Ruby Pipelines

This is a custom image for projects using [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) containing Ruby 2.3.0 and MySQL 5.5.

## Using

Just add the Docker Hub image directly to your `bitbucket-pipelines.yml` file:

```yaml
image: dimoreira/ruby-pipelines
pipelines:
	default:
		- step:
			script:
				- "ruby --version"
				- "bundler --version"
				- "bundle install"
				- "/bin/bash service mysql restart"
				- "bundle exec rake db:create"
				- "bundle exec rake db:schema:load RAILS_ENV=test"
				- "bundle exec rspec"
```

And commit the change to your repository to use the new image on the build step.

## Development

To test the image locally or bring updates, just clone the project and run the docker build command with the Dockerfile:

```bash
$ git clone https://github.com/dimoreira/ruby-pipelines.git
$ cd ruby-pipelines
$ docker build .
```

