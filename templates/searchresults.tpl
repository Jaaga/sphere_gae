<div id="content">
<div class="table-responsive">
  <table style="font-size:14px" class="center mq-table pure-table-horizontal pure-table-striped pure-table">
    %for qnumber in qorder:
      %if qnumber in results:
        <tr>
          <td>
            <b>{{qnumber}}: {{questions[qnumber]}}</b>
            <ul>
              %for name in results[qnumber]:
                  <b>{{name}}:</b>
                  <ul>
                    %for result in results[qnumber][name]:
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
