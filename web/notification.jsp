<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="toast">
    <div class="toast-header">
        Toast Header
    </div>
    <div class="toast-body">
        Some text inside the toast body
    </div>
    <script>
        $(document).ready(function () {
            $('.toast').toast('show');
        });
    </script>
</div>