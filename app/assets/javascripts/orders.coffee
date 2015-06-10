sum = ->
  val = 0
  $(".quantity").each ->
    val += $(@).attr('data-price') * $(@).val()
  $("#order-sum").html(val.toFixed(2) + " руб.")
  $("#order-sum-form").val(val.toFixed(2))

$(document).on 'page:change', ->
  sum()
  $(".quantity").change ->
    sum()

@Cart = {
  sum: sum
}
