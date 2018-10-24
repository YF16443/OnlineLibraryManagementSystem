<html>
    <head>
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
        <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
        <link href="../../assets/vendors/jquery-date-range-picker-master/dist/daterangepicker.css" rel="stylesheet" />
        <script src="../../assets/vendors/jquery-date-range-picker-master/src/jquery.daterangepicker.js"></script>

    </head>
    <body>
      <input id="date-range1" size="60" value="">
    </body>
    <script>
        var jq=$.noConflict();
        $('#date-range1').dateRangePicker(
            {batchMode: 'week', 
                showShortcuts: false,
    language:'en',
            });
    </script>
</html>