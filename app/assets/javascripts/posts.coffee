# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on('turbolinks:load', (e)->
    #do your initialize here
    $('textarea.ckeditor').each(->
        if $(this).css('visibility') != 'hidden'
            CKEDITOR.replace(this)
    )    
)