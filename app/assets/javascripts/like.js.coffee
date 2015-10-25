$ ->
  $(".like_button a, .dislike_button a").on "ajax:success", (e, data, status, xhr) ->
    alert(data.message)
    if data.reload == true
      window.location.reload()
    return false



