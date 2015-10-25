$ ->
  $("#new_answer_form").on "ajax:success", (e, data, status, xhr) ->
    if data == true
      window.location.reload()
    else
      alert('Failed. Try again!')
    return false
