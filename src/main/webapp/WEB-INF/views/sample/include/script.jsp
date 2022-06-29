<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- BEGIN: Vendor JS-->
<script src="/bizmap/app-assets/vendors/js/vendors.min.js"></script>
<script src="/bizmap/app-assets/fonts/LivIconsEvo/js/LivIconsEvo.tools.js"></script>
<script src="/bizmap/app-assets/fonts/LivIconsEvo/js/LivIconsEvo.defaults.js"></script>
<script src="/bizmap/app-assets/fonts/LivIconsEvo/js/LivIconsEvo.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="/bizmap/app-assets/js/core/app-menu.js"></script>
<script src="/bizmap/app-assets/js/core/app.js"></script>
<script src="/bizmap/app-assets/js/scripts/components.js"></script>
<script src="/bizmap/app-assets/js/scripts/footer.js"></script>
<!-- END: Theme JS-->

<!-- lib (변동이 없는 js)-->
<script src="/bizmap/assets/lib/handlebars-v4.7.2.js"></script>
<script src="/bizmap/assets/lib/handlebars-v4.7.2.min.js"></script>
<script src="/bizmap/assets/lib/jquery-1.4.js"></script>
<script src="/bizmap/assets/lib/jquery.min.js"></script>

<!-- js (변동이 있는 js)-->
<script src="/bizmap/assets/js/scripts.js?<%=scriptRandom%>"></script>
<script src="/bizmap/assets/js/common.js?<%=scriptRandom%>"></script>
<script src="/bizmap/assets/js/commonUtil.js?<%=scriptRandom%>"></script>
<script src="/bizmap/assets/js/helper.js?<%=scriptRandom%>"></script>

<script type="text/javascript">
    $(window).load(function() {
        $('#loading').hide();
    });
</script>

<div class="spinner-border" role="status" id="loading">
    <span class="sr-only">Loading...</span>
</div>

