
      <html> 
    <head>
     <link href="../../assets/vendors/daterangepicker/styles/vendor.css" rel="stylesheet" 
     <link href="../../assets/vendors/daterangepicker/styles/daterangepicker.css" rel="stylesheet" />


 

    </head>
    <body>
      <input class="daterangepicker-field"></input>
    </body>
                  <script src="../../assets/vendors/daterangepicker/scripts/vendor.js"></script>
        <script src="../../assets/vendors/daterangepicker/scripts/daterangepicker.js"></script>

    <script>
      $(".daterangepicker-field").daterangepicker({
  forceUpdate: true,
  single:true,
  callback: function(startDate, endDate, period){
    var title = startDate.format('L') + ' – ' + endDate.format('L');
    $(this).val(title)
  }
});
    </script>
</html>