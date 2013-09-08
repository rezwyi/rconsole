var Rconsole = {};
XMLHttpRequest.prototype.originOpen = XMLHttpRequest.prototype.open;

(Rconsole.dump = function() {
  var xhr = new XMLHttpRequest()
      dump = []
      i = 0;
  
  xhr.originOpen('get', '/rconsole.json', false);
  xhr.send();
  
  if (xhr.readyState === 4 && xhr.status === 200) {
    dump = JSON.parse(xhr.responseText);
    for (i; i < dump.length; i++) console.log(dump[i]);
  }
})();

XMLHttpRequest.prototype.open = function() {
  this.addEventListener('readystatechange', function(){
    if (this.readyState === 4 && this.status === 200) Rconsole.dump();
  });
  XMLHttpRequest.prototype.originOpen.apply(this, arguments);
}