$(document).ready(function() {
  $('#price, #quantity').change(function(){
    var grandTotal = Number($('#price').val()) * Number($('#quantity').val());
    $('#total').val(grandTotal);
  });

  $('#submit-rating').on('change', function () {
    $('.hidden-submit').submit();
  });
});
