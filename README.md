# molnight

Molnight consists of a set of tests ( written using nightwatch ) that may be use to verify the successful functioning of a molgenis installation

## Setup

- If not already installed, install npm [install npm](https://docs.npmjs.com/getting-started/installing-node)
- Install nightwatch (most likely as su using the global tag)
     - `sudo npm install -g nightwatch`
     - and now we wait ....
- Get a version of the selenium server and place is in the 'bin' folder
     - `cd bin` to move to bin folder
     - you need the 'selenium-server-standalone-{VERSION}.jar'
     - use the download-page: http://selenium-release.storage.googleapis.com/index.html
     - for example:  `curl -O http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar`
     - `ls` and see your new selenium server, now `cd ..` to get back
- Get webdriver(s) for communicating with the browser(s)
    - i like using firefox
    - get the webdriver from: https://github.com/mozilla/geckodriver/releases and place it in the bin dir
    - for example:
        - `cd bin`
        -  then `curl -O https://github.com/mozilla/geckodriver/releases/download/v0.16.1/geckodriver-v0.16.0-macos.tar.gz`
        - then unpack: `gunzip -c geckodriver-v0.16.0-macos.tar.gz | tar xopf -`
        - jump back `cd ..`
- Now test you setup by running
    - `nightwatch -t tests/hello-molgenis.js `
    - it should work, it works on my machine ...

## Running tests
From project root type: `nightwatch`

To run a single test `nightwatch -t [path/testname]` for example `nightwatch -t tests/hello-molgenis.js `
