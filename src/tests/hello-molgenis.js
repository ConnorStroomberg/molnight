module.exports = {
  'Hello molgenis test' : function (client) {
    client
      .url(client.launch_url)
      .waitForElementVisible('body', 1000)
      .assert.title('MOLGENIS')
      .end();
  }
};
