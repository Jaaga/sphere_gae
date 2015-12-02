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

    % include('templates/responses.tpl')

  </div>

% include('templates/footer.tpl')

</body>
</html>
