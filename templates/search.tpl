<!doctype html>
<html lang="en">
% include('templates/head.tpl')

<body>

  <div class="content">

        % include('templates/header.tpl')

        % include('templates/searchbar.tpl')


    <h2 class="content-head is-center">Your search for <b>{{phrase}}</b> yielded {{count}} results</h2>

        % include('templates/searchresults.tpl')


  </div>

        % include('templates/footer.tpl')

</body>
</html>
