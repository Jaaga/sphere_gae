<div id="content">
<h1>Stakeholders Interviewed</h1>
<div class="columns">
   <ul>
    %for num in range(1,34):
      %if stakeholders[num][1] == 'Open':
        <li style="font-size:14px">{{num}}. <a href="/stakeholder/{{stakeholders[num][0]}}">{{stakeholders[num][0]}}</a></li>
      %else:
        <li style="font-size:14px">{{num}}. <a href="/stakeholder/{{stakeholders[num][0]}}">{{stakeholders[num][0]}}</a><b>*</b></li>
      %end
    %end
  </ul>
</div>
<p style="font-size:14px"><b>*</b> Some interviews have been withheld upon request of confidentiality.</p>
</div>
