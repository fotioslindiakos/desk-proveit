[ ![Codeship Status for fotioslindiakos/desk-proveit](https://www.codeship.io/projects/61a5f130-40bd-0131-177a-7a95864a21a3/status?branch=master)](https://www.codeship.io/projects/10554)

# Welcome
You can view this application running [here][1].

### Issues I Encountered
#### Rails
I haven't written a Rails app from scratch in a while. It was definitely a little slow going at first, but I picked up steam fairly quickly.
#### Heroku
Since I work on a [competing PaaS][2], it's generally been considered heresy to use Heroku. It took me a bit to get the toolchain set up and fixing a few small bugs in my code that prevented it from running there (even though it worked find locally). That being said, Heroku is pretty nice. I really liked their integration with Codeship; it was really simple to setup and definitely makes the development cycle easier.
#### OAuth
I've never created a site using OAuth before, so figuring it out was a little bit of a challenge. I finally settled on using [`omniauth-desk`][oauth-desk] and it works great.
#### Desk.com API
I started off trying to use [`zencoder/desk`][zdesk], but as noted in zencoder/desk#23, it doesn't entirely work with the V2 API. They also didn't implement functions for this like filters and labels. I resorted to writing my own wrapper using lostisland/faraday and lostisland/faraday_middleware (for OAuth support). This is far from a complete solution, and I would ideally like to write a more modular API wrapper.

### TODO
There are a few things I would like to finish to make this application more complete
- [ ] Much more test coverage (I should have been doing TDD from the start, but I spent too much time fighting with OAuth)
- [ ] The ability to create labels
- [ ] The ability to modify cases

[1]: http://fathomless-gorge-6330.herokuapp.com/
[2]: http://openshift.com
[oauth-desk]: https://github.com/tstachl/omniauth-desk
[zdesk]: https://github.com/zencoder/desk
