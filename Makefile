.PHONY: $(MAKECMDGOALS)

# `make setup` will be used after cloning or downloading to fulfill
# dependencies, and setup the the project in an initial state.
# This is where you might download rubygems, node_modules, packages,
# compile code, build container images, initialize a database,
# anything else that needs to happen before your server is started
# for the first time
setup: 
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # install homebrew
	brew install node
	brew tap mongodb/brew
	brew install mongodb-community
	# the following 2 commands setup mongodb for macOS before Catalina, please uncomment if you are on pre-Catalina:
# 	sudo mkdir -p /data/db
# 	sudo chown -R `id -un` /data/db
	# for Catalina
	# for Catalina:
	sudo mkdir -p /System/Volumes/Data/data/db
	sudo chown -R `id -un` /System/Volumes/Data/data/db
	npm install

# `make server` will be used after `make setup` in order to start
# an http server process that listens on any unreserved port
#	of your choice (e.g. 8080). 
server:

# `make test` will be used after `make setup` in order to run
# your test suite.
	brew services run mongodb-community
	npm run start
test:
	npm run test


stop:
	brew services stop mongodb-community
### DOCUMENTATION

# If there are platform related issues during setup, here are the general guidelines:

# 1. Install node and check the version using `node -v`.Instructions to download and install Node are here for all platforms (https://nodejs.org/en/download/). The version of node used in this project is the latest stable version of node-12.8.1
# 2. run `npm install`
# 3. Navigate to config/defaults.json and change the value of mongoURI to be your mongo instance. You can use a local mongo instance or use MongoDB Atlas which is a hosted MongoDB service option in the cloud which requires no installation overhead and offers a free tier to get started. 
# I used the cloud instance. Your local instance might be `mongodb://localhost:27017` or `mongodb://localhost:27017/dbname`
# 4. run `npm run start` or run `npm run dev`