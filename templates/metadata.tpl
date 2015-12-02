<div class="content">
<div class="table-responsive">
  <table class="center mq-table pure-table-horizontal pure-table-striped pure-table">
    %for key in tags:
      %if key is not 'URL':
        <tr>
          <td>
              <b>{{key}}</b>
          </td>
          <td>
            %if key is 'Organisation':
              %if metadata['URL']:
                <a target="_blank" href="{{metadata['URL'][0]}}">{{metadata[key][0]}}</a>
              %end
            %else:
              {{metadata[key][0]}}
            %end
          </td>
        </tr>
      %end
    %end
  </table>
</div>
</div>
