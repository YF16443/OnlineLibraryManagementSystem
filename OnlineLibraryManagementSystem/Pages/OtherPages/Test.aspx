<html>
    <head>
        <link href="../../assets/vendors/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <script src="../../assets/vendors/daterangepicker/daterangepicker.js"></script>
        <link href="../../assets/vendors/daterangepicker/daterangepicker.min.css" rel="stylesheet" />
        <script src="../../assets/vendors/daterangepicker/daterangepicker.min.js"></script>
        <script src="../../assets/vendors/daterangepicker/test/moment.js"></script>
        <script src="../../assets/vendors/daterangepicker/test/moment.min.js"></script>
        <script src="../../assets/vendors/daterangepicker/test/jquery-2.2.3.min.js"></script>
        <script src="../../Scripts/Knockout.js"></script>
        <script src="../../Scripts/bootstrap.min.js"></script>
        <script src="../../Scripts/bootstrap.js"></script>
    </head>
    <body>
        <div class="daterangepicker-container" data-bind="daterangepicker: dateRange, daterangepickerOptions: {standalone: true}"></div>
    </body>
    <script>
$("input").daterangepicker({
  minDate: moment().subtract(2, 'years')
}, function (startDate, endDate, period) {
  $(this).val(startDate.format('L') + ' – ' + endDate.format('L'))
});
    </script>
</html>