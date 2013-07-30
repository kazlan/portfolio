Template.footer.events
  'focus .input': (e) ->
    $('.input').parent().removeClass('danger')
    
  'click #mail-form-send': (e)->
    e.preventDefault()
    nombre = $('#mail-form-nombre')
    email = $('#mail-form-email')
    body = $('#mail-form-body')
    to = "opticaferrara@gmail.com"
    
    todo_ok = true
    if body.val() == ""
      body.parent().addClass('danger')

      todo_ok = false
    if nombre.val() == ""
      nombre.parent().addClass('danger')
      todo_ok = false
    if not email.val().match('@')
      console.log email.val().match('@')
      email.parent().addClass('danger')
      todo_ok = false
      
    if todo_ok
      Meteor.call('sendEmail',
            to,
            email.val(),
            nombre.val() + ' desde la Web de Óptica Vintage',
            body.val())    
      div = $('#mail-send-div')
      #div.toggleClass('primary','success')
      $('#mail-form-send').text("Mensaje Enviado")
      h = Meteor.setTimeout animIn, 1500
      h2 = Meteor.setTimeout resetForm, 3000

#Funciones Auxiliares      
animIn=->
  $('#mail-send-div').addClass('boton-anim')
  
resetForm=->
  $('.input').val("")
  $('#mail-send-div').removeClass('boton-anim')
  $('#mail-form-send').text("Enviar Mensaje")
  #$('#mail-send-div').toggleClass('success', 'primary')
      