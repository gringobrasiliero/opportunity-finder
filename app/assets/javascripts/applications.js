//Submit comments via AJAX
$(document).ready(function() {


    $("load_applicants").on('click', function(e) {
  $.ajax({
    url: this.href,
    dataType: 'script'
  })
e.preventDefault();
})
})
