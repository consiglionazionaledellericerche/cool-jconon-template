<script src="${url.context}/res/js/thirdparty/require.js" data-main="ws/application/application.js"></script>
<script>
    var my_require = require.config({
      baseUrl: '${url.context}/res/js',
      urlArgs: "v=" + "${artifact_version}",
      paths: {
        'application.custom': 'ws/application/application-custom',
      }});
    my_require(["application.custom"]);
</script>
<link href="${url.context}/res/css/select2.css" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>