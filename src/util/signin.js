module.exports =  function (client) {
    client
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
      .waitForElementVisible('#signout-button', 3000)
      .pause(2000)
      return client
};
