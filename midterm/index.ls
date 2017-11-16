angular.module \xmtMidterm, <[]>
  ..config <[$compileProvider $httpProvider]> ++ ($compileProvider, $httpProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(blob:|http:\/\/localhost|https:\/\/loading.io\/)/)
  ..controller \xmtMtMain, <[$scope]> ++ ($scope) ->
    $scope.ans = do
      css1: "<span>才不是為了你呢</span>"
      css2: """
        <h1>就少一個插座用，很不方便</h1>
        <style type="text/css">
        </style>
        """
      css3: """
        <link>
        <div></div>
        """
      css4: """<div style=""></div>"""
      selector1: """
        ???? {
          color: red;
        }
        ???? {
          background: black;
        }
        """
      selector2: """
        <div class="btn">發射核彈</div>
        <style type="text/css">
          .btn {
            background: #249;
            color: white;
            padding: 5px 10px;
          }
          ????
        </style>
        """
      selector4: """
        a.item - 第 ? 行
        .active a.item - 第 ? 行
        \#link.dropdown a.item - 第 ? 行
        .item.large - 第 ? 行
        """
      bootstrap2: "看到格子這麼大應該就知道有很多字要打了吧！請善用複製貼上"

    getCookie = (name) ->
      value = "; " + document.cookie
      parts = value.split("; " + name + "=")
      if parts.length ==2 => return parts.pop!.split(";").shift!
    <[html css selector bootstrap]>.map (t) -> [1 to 4].map (v) ->
      name = "#t#v"
      label = "ans.#name"
      $scope.$watch label, (n,o) ->
        if n =>
          document.cookie = "ans.#t#v=#{encodeURIComponent(n)}"
          $scope.download = null
      value = getCookie label
      if value and value != \undefined => $scope.ans[name] = decodeURIComponent(value)
    $scope.submit = ->
      return if !$scope.id
      payload = $scope{ans, id, name}
      url = URL.createObjectURL new Blob([JSON.stringify(payload)], type: "application/json")
      $scope.download = url
