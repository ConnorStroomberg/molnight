var login = require('./util/signin.js');

module.exports = {
  'Sign in molgenis test' : function (client) {
    client
      .url(client.launch_url)
      .waitForElementVisible('body', 1000);

    login(client);

    client.assert.visible('#signout-button')
      .pause(2000)
      .end();
  }
};
