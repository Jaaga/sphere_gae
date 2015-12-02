<div id="content">
<div class="table-responsive">
  <table style="font-size:14px" class="center mq-table pure-table-horizontal pure-table-striped pure-table">
    %for qnumber in qorder:
      %if qnumber in responses:
        <tr>
          <td>
            <b>{{qnumber}}: {{questions[qnumber]}}</b>
            <ol>
            %for response in responses[qnumber]:
              <li>{{response}}</li>
            %end
            </ol>
          </td>
        </tr>
      %end
    %end
  </table>
</div>
</div>
