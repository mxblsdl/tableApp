var testJS = new Shiny.InputBinding();
$.extend(testJS, {
  find: function(scope) {
    // JS logic $(scope).find('whatever')
  },
  getValue: function(el) {
    // JS code to get value
  },
  setValue: function(el, value) {
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    $(el).on('click.testJS', function(e) {
      callback();
    });

  },
  unsubscribe: function(el) {
    $(el).off('.testJS');
  }
});
Shiny.inputBindings.register(testJS, 'shiny.whatever');
