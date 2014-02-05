(function() {
  document.getElementById('email-line').innerHTML = 'ivan.ukhov@liu.se';
  document.getElementById('email-link').setAttribute('href', 'mailto:ivan.ukhov@liu.se');
  if (navigator.appVersion.indexOf('Win') != -1) {
    document.body.setAttribute('id', 'windows');
  }
})();
