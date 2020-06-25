$(() => {
  $(document).on('turbolinks:load', () => {
    $('#calendar').fullCalendar({})
  })
})