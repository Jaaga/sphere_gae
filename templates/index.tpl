<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Design Research: Entrepreneurs in the socio-environmental sector">
  <title>
    Jaaga &ndash; Project Sphere &ndash; Responses
  </title>

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

    <div id="content">
      <h1>Design Challenge</h1>
      <!-- <p style="font-size:16px">These questions guided the research process.</p> -->
      <ol>
        %for item in designChallenge.items():
          <li style="font-size:14px">{{item[1]}}</li>
        %end
      </ol>
      <h1>Stakeholders</h1>
      <div class="columns">
         <ul>
          %for name in stakeholders:
            <li><a href="/stakeholder/{{name}}">{{name}}</a></li>
          %end
        </ul>
      </div>
    </div>

  </div>

  <div class="footer l-box is-center">
    Made with love by the <a href="http://jaaga.in">Jaaga</a> Crew
  </div>

</body>
</html>
