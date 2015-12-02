<div id="content">
<div class="table-responsive">
  <table style="font-size:14px" class="center mq-table pure-table-horizontal pure-table-striped pure-table">
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
