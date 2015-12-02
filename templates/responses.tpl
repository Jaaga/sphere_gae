<div id="content">
<div class="table-responsive">
  <table style="font-size:14px" class="center mq-table pure-table-horizontal pure-table-striped pure-table">
    %for question in qorder:
      %if question in responses:
        <tr>
          <td>
            <b>{{question}}: {{questions[question]}}</b>
            <ol>
            %for response in responses[question]:
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
