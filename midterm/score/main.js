// Generated by LiveScript 1.3.1
var fs, cheerio, files, result;
fs = require('fs');
cheerio = require('cheerio');
files = fs.readdirSync('.').filter(function(it){
  return /\.html$/.exec(it);
});
result = files.map(function(it){
  var content, $, score, ret, ref$, name, id;
  content = fs.readFileSync(it).toString();
  $ = cheerio.load(content);
  score = $('body > div:first-of-type > div:first-of-type > div:first-of-type').text();
  ret = $('body > div:first-child > h2:first-of-type').text();
  ret = /^考生姓名: (.+) \/ 學號: (.+)$/.exec(ret);
  ref$ = [ret[1], ret[2]], name = ref$[0], id = ref$[1];
  return [name, id, score];
});
result.sort(function(a, b){
  if (a[1] > b[1]) {
    return 1;
  } else {
    return -1;
  }
});
result.map(function(it){
  return console.log(it[0], it[1], it[2]);
});