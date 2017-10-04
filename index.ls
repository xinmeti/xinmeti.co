window.onload = ->
  now = new Date!getTime!
  Array.from(document.querySelectorAll \table.course-list)
    .map ->
      Array.from(it.querySelectorAll('tr'))
        .map ->
          text = it.querySelector('td:nth-child(2)').innerText
          time = new Date((if /^01/.exec(text) => "2018/" else "2017/") + text).getTime!
          delta = (time - now)
          if delta > 0 and delta < 1000 * 86400 * 7 => it.setAttribute \class, "current"
          else if delta < 0 =>it.setAttribute \class, "passed"
          if delta >= 0 => it.querySelector('a').setAttribute \href, '#'
