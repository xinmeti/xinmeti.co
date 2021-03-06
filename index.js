// Generated by LiveScript 1.3.1
window.onload = function(){
  var now;
  now = new Date().getTime();
  return Array.from(document.querySelectorAll('table.course-list')).map(function(it){
    return Array.from(it.querySelectorAll('tr')).map(function(it){
      var text, time, delta;
      text = it.querySelector('td:nth-child(2)').innerText;
      time = new Date((/^01/.exec(text) ? "2018/" : "2017/") + text).getTime() + 86400000;
      delta = time - now;
      if (delta > 0 && delta < 1000 * 86400 * 7) {
        it.setAttribute('class', "current");
      } else if (delta < 0) {
        it.setAttribute('class', "passed");
      }
      if (delta >= 1000 * 86400 * 7) {
        return it.querySelector('a').setAttribute('href', '#');
      }
    });
  });
};