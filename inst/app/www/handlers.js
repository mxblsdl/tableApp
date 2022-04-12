
// example JS handler that links to shiny
$( document ).ready(function() {
  //'fun' name of the function in R
  //'arg' value passed from R to JS
  Shiny.addCustomMessageHandler('fun', function(arg) {

  // what the function actually does
    alert("Hello from JS!");
    console.log(arg);
  });
});
