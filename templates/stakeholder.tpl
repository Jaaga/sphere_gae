<!doctype html>
<html lang="en">
% include('templates/head.tpl')
<body>

  <div class="content">

    % include('templates/header.tpl')

    % include('templates/searchbar.tpl')

    % include('templates/metadata.tpl')

    %if count > 0:
    <h2 class="content-head is-center"><b>{{name}}</b> answered {{count}} questions</h2>
    %end
    <div id="content">
    <p style="font-size:14px"><b>NB:</b> To help us during the synthesis process we coded each byte of response. The code takes the form 'Interview code'-'Question number'-'Response number'. For instance, the code for the first response byte to question 1a for {{name}} is {{metadata['Interview Code'][0]}}-1a-1.</p>
  </div>
    % include('templates/responses.tpl')

  </div>

% include('templates/footer.tpl')

</body>
</html>
