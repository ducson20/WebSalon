<script src="<% request.getContextPath(); %>/vendors/jquery/dist/jquery.min.js"></script>
<script src="<% request.getContextPath(); %>/vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="<% request.getContextPath(); %>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<% request.getContextPath(); %>/assets/js/main.js"></script>


<script src="<% request.getContextPath(); %>/vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="<% request.getContextPath(); %>/assets/js/dashboard.js"></script>
<script src="<% request.getContextPath(); %>/assets/js/widgets.js"></script>
<script src="<% request.getContextPath(); %>/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="<% request.getContextPath(); %>/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="<% request.getContextPath(); %>/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>

<script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
