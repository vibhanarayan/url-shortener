.PHONY: $(MAKECMDGOALS)

# `make setup` will be used after cloning or downloading to fulfill
# dependencies, and setup the the project in an initial state.
# This is where you might download rubygems, node_modules, packages,
# compile code, build container images, initialize a database,
# anything else that needs to happen before your server is started
# for the first time
setup: 
1. Install node and check the version using `node -v`.Instructions to download and install Node are here for all platforms (https://nodejs.org/en/download/). The version of node used in this project is the latest stable version of node-12.8.1
2. run `npm install`
3. Navigate to config/defaults.json and change the value of mongoURI to be your mongo instance. You can use a local mongo instance or use MongoDB Atlas which is a hosted MongoDB service option in the cloud which requires no installation overhead and offers a free tier to get started.
4. run `npm run start` or run `npm run dev`

# `make server` will be used after `make setup` in order to start
# an http server process that listens on any unreserved port
#	of your choice (e.g. 8080). 
server:

# `make test` will be used after `make setup` in order to run
# your test suite.
test:
Here are some test URLs
1. https://www.google.com/search?sxsrf=ALeKk03glufJFJYTPClPN9iEU8mQ0JbCFA%3A1592780963242&ei=o-jvXoisDurF_Qbu0aRQ&q=tuna+salad&oq=tuna+salad&gs_lcp=CgZwc3ktYWIQAzIECCMQJzIECCMQJzICCAAyAggAMgcIABAUEIcCMgIIADICCAAyAggAMgUIABCxAzICCAA6BwgAELADEENQqhBYpBJguRZoAHAAeACAAVmIAfgBkgEBM5gBAKABAaoBB2d3cy13aXo&sclient=psy-ab&ved=0ahUKEwjIiZO8g5TqAhXqYt8KHe4oCQoQ4dUDCAw&uact=5
2. https://www.google.com/search?sxsrf=ALeKk02oB9sF-2LXv2Hj1fH-21XSJesM9w%3A1592780967409&ei=p-jvXpjKGMGf_Qbnop-4BA&q=rick+and+morty+season+4+episode+6&oq=rick+and+m&gs_lcp=CgZwc3ktYWIQAxgCMgUIABCxAzIFCAAQsQMyAggAMgUIABCxAzIECAAQQzIFCAAQsQMyBQgAELEDMgUIABCxAzIFCAAQsQMyAggAOgcIIxDqAhAnOgQIIxAnOgUIABCRAjoFCAAQgwE6BwgAELEDEENQu7gBWI3QAWDN4wFoAXAAeACAAXyIAdgGkgEDOC4ymAEAoAEBqgEHZ3dzLXdperABCg&sclient=psy-ab
3. https://www.amazon.com/Vintage-Computer-Writing-Laptop-Espresso/dp/B07925F5HK/ref=sr_1_9?crid=2OLN7NDSDQ8B1&dchild=1&keywords=study+table&qid=1592781133&sprefix=study+tab%2Caps%2C155&sr=8-9
4. https://www.amazon.com/15-inch-i5-1035G1-Windows-15-dy1036nr-Natural/dp/B085B5SXLY/ref=sr_1_8?dchild=1&keywords=Laptop&qid=1592781203&sr=8-8
5. https://www.amazon.com/Death-Wish-Coffee-Strongest-Certified/dp/B006CQ1ZHI/ref=sr_1_5?crid=95PXYVJYHXVR&dchild=1&keywords=death+wish+coffee&qid=1592781247&sprefix=Death+%2Caps%2C260&sr=8-5

Unit tests are in the tests/ directory and `npm run test` runs the test suite. 