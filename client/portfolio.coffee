Meteor.startup ->
  i18n.init {lng: 'es', load: 'unespecific', preload: 'en'},(t)->
    $("[data-i18n]").i18n()
  Gumby.initialize 'toggles'
  Gumby.initialize 'skiplinks'
  $('#lema-container').waypoint ->
    $('#toTop').fadeIn()
  $('#slider-container').waypoint ->
    $('#toTop').fadeOut()
    
Template.cabecera.events     
#Seleccion de idioma
  'change #lang-picker': (e) ->
    if $('#lang-picker').val() == 'ES'
      i18n.setLng 'es', ->
        $("[data-i18n]").i18n()
    else
      i18n.setLng 'en', ->
        $("[data-i18n]").i18n()
        
Template.destacados.rendered = ->
  $('.dest_icon').bind 'inview', (event,visible)->
    $('.dest_icon').toggleClass "animated pulse"  

Template.ejemplos.rendered = ->
#al usar addClass la animación solo se ejecuta la primera vez que se muestra
  $('.animLeft').bind 'inview', ->
    $('.animLeft').addClass "animated pulse"
  $('.animRight').bind 'inview', ->
    $('.animRight').addClass "animated pulse"
    
Template.servicios.rendered = ->
#anim inits
  $('.servicio_anim1').bind 'inview', (event,visible)->
    if visible
      $('.animH4').addClass "animated pulse" 
      $('.animH5').addClass "animated tada"
    else
      $('.animH4').removeClass "animated pulse"
      $('.animH5').removeClass "animated tada"
  $('.servicio_anim2').bind 'inview', (event,visible)->
    if visible
      $('.animH4_2').addClass "animated pulse" 
      $('.animH5_2').addClass "animated tada"
    else
      $('.animH4_2').removeClass "animated pulse"
      $('.animH5_2').removeClass "animated tada"
    

