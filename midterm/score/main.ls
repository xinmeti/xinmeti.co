require! <[fs cheerio]>
files = fs.readdir-sync \. .filter -> /\.html$/.exec(it)
result = files.map ->
  content = fs.read-file-sync it .toString!
  $ = cheerio.load content
  score = $('body > div:first-of-type > div:first-of-type > div:first-of-type').text!
  ret = $('body > div:first-child > h2:first-of-type').text!
  ret = /^考生姓名: (.+) \/ 學號: (.+)$/.exec(ret)
  [name, id] = [ret.1, ret.2]
  [name, id, score]
result.sort (a,b) -> if a.1 > b.1 => 1 else -1
result.map -> console.log it.0, it.1, it.2
