<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Program Design for Socio-Environmental Startups">

  <title>Jaaga &ndash; Project Sphere &ndash; Responses</title>

  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

  <!--[if lte IE 8]>

  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-old-ie-min.css">

  <![endif]-->
  <!--[if gt IE 8]><!-->

  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">

  <!--<![endif]-->

  <!--[if lte IE 8]>
  <link rel="stylesheet" href="{{ get_url('static', filename='marketing-old-ie.css') }}">
  <![endif]-->

  <!--[if gt IE 8]><!-->
  <link rel="stylesheet" type="text/css"
  href="{{ get_url('static', filename='marketing.css') }}" />
  <!--<![endif]-->

</head>
<body>

  <div class="content">
    <a target="_blank" href="http://jaaga.in"><img style="margin:0px auto;display:block" src="static/jaaga.jpg" alt="Jaaga Brandmark"></a>
    <h1 class="content-head is-center"><a href="/">Project Sphere</a></h1>
    <h4 class="content-head is-center">Design Research: Entrepreneurship in the socio-environmental sector</h4>

    <form class="pure-form" action="/" method="post">
      <input name="phrase" type="text" placeholder="Search responses" />
    </form>

    <h2 class="content-head is-center">Your search for <b>{{phrase}}</b> yielded {{count}} results</h2>


    <div class="table-responsive">
      <table class="center mq-table pure-table-horizontal pure-table-striped pure-table">
        %for q in qorder:
          %if q in results:
            <tr>
              <td>
                <b>{{q}}: {{questions[q]}}</b>
                <ul>
                  %for name in results[q]:
                      <b>{{name}}:</b>
                      <ul>
                        %for result in results[q][name]:
                          <li>{{result}}</li>
                        %end
                    </ul>
                  %end
                </ul>
              </td>
            </tr>
          %end
        %end
      </table>
    </div>

  </div>

  <div class="footer l-box is-center">
    Made with love by the <a href="http://jaaga.in">Jaaga</a> Crew
  </div>

</body>
</html>
