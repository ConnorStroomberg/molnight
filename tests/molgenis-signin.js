module.exports = {
  'Sign in molgenis test' : function (client) {
    client
      .url('https://molgenis01.gcc.rug.nl')
      .waitForElementVisible('body', 1000)
      .waitForElementVisible('#open-button', 1000)
      .click('#open-button')
      .pause(1000)
      .waitForElementVisible('#open-button', 1000)
      .assert.visible('#username-field')
      .assert.visible('#password-field')
      .setValue('#username-field', 'admin')
      .setValue('#password-field', 'admin')
      .pause(1000)
      .click('#signin-button')
      .waitForElementVisible('#signout-button', 1000)
      .assert.visible('#signout-button')
      .pause(2000)
      .end();
  }
};
