sum = ->
  val = 0
  $(".quantity").each ->
    val += $(@).attr('data-price') * $(@).val()
  if val > 15000
    $("#discount-sum").html((val*0.15).toFixed(2) + " руб.")
    $("#discount").show()
    val -= val*0.15
  else
    if val > 10000
      $("#discount-sum").html((val*0.1).toFixed(2) + " руб.")
      $("#discount").show()
      val -= val*0.1
    else
      if val > 5000
        $("#discount-sum").html((val*0.05).toFixed(2) + " руб.")
        $("#discount").show()
        val -= val*0.05
      else
        $("#discount").hide()
  $("#order-sum").html(val.toFixed(2) + " руб.")
  $("#order-sum-form").val(val.toFixed(2))

$(document).on 'page:change', ->
  sum()
  $(".quantity").change ->
    sum()

@Cart = {
  sum: sum
}
