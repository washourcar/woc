/**
 * Created by ijaz on 28/2/15.
 */
jQuery(document).ready(function($){
    var $lateral_menu_trigger = $('#cd-menu-trigger'),
        $lateral_menu_text_trigger = $('#cd-menu-text-trigger'),
        $content_wrapper = $('.cd-main-content'),
        $navigation = $('header');

    //open-close lateral menu clicking on the menu hamburger icon
    $lateral_menu_trigger.on('click', function(event){
        event.preventDefault();
        $lateral_menu_trigger.toggleClass('is-clicked');
        $navigation.toggleClass('lateral-menu-is-open');
        $('#one').toggleClass('addRgba');
        $('#two').toggleClass('addRgba');
        $content_wrapper.toggleClass('lateral-menu-is-open').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
            // firefox transitions break when parent overflow is changed, so we need to wait for the end of the trasition to give the body an overflow hidden
            $('body').toggleClass('overflow-hidden');
        });
        $('#cd-lateral-nav').toggleClass('lateral-menu-is-open');

        //check if transitions are not supported - i.e. in IE9
        if($('html').hasClass('no-csstransitions')) {
            $('body').toggleClass('overflow-hidden');
            $('#one').toggleClass('addRgba');
            $('#two').toggleClass('addRgba');
        }
    });

    //open-close lateral menu clicking on the menu Text itself
    $lateral_menu_text_trigger.on('click', function(event){
        event.preventDefault();
        $('#cd-menu-trigger').toggleClass('is-clicked');
        $('#cd-menu-text-trigger').toggleClass('is-clicked');
        $navigation.toggleClass('lateral-menu-is-open');
        $('#one').toggleClass('addRgba');
        $('#two').toggleClass('addRgba');
        $content_wrapper.toggleClass('lateral-menu-is-open').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
            // firefox transitions break when parent overflow is changed, so we need to wait for the end of the trasition to give the body an overflow hidden
            $('body').toggleClass('overflow-hidden');
        });
        $('#cd-lateral-nav').toggleClass('lateral-menu-is-open');

        //check if transitions are not supported - i.e. in IE9
        if($('html').hasClass('no-csstransitions')) {
            $('body').toggleClass('overflow-hidden');
            $('#one').toggleClass('addRgba');
            $('#two').toggleClass('addRgba');
        }
    });

    //close lateral menu clicking outside the menu itself
    $content_wrapper.on('click', function(event){
        if( !$(event.target).is('#cd-menu-trigger, #cd-menu-trigger span') ) {
            $lateral_menu_trigger.removeClass('is-clicked');
            $lateral_menu_text_trigger.removeClass('is-clicked');
            $navigation.removeClass('lateral-menu-is-open');
            $('#one').removeClass('addRgba');
            $('#two').removeClass('addRgba');
            $content_wrapper.removeClass('lateral-menu-is-open').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
                $('body').removeClass('overflow-hidden');
            });
            $('#cd-lateral-nav').removeClass('lateral-menu-is-open');
            //check if transitions are not supported
            if($('html').hasClass('no-csstransitions')) {
                $('#one').removeClass('addRgba');
                $('#two').removeClass('addRgba');
                $('body').removeClass('overflow-hidden');
            }

        }
    });

    //open (or close) submenu items in the lateral menu. Close all the other open submenu items.
    $('.item-has-children').children('a').on('click', function(event){
        event.preventDefault();
        $(this).toggleClass('submenu-open').next('.sub-menu').slideToggle(200).end().parent('.item-has-children').siblings('.item-has-children').children('a').removeClass('submenu-open').next('.sub-menu').slideUp(200);
    });

    showCarlist();
    function showCarlist() {
        var product = $(".text-changing");
        var productIndex = -1;

        function showNextProduct() {
            ++productIndex;
            product.eq(productIndex % product.length)
                .css({
                    opacity: 0,
                    display: 'inline-block'
                }).animate({opacity: 1}, 300)
                // .fadeIn(300)
                .delay(3000)
                .css({
                    opacity: 1,
                    display: 'inline-block'
                })
                // .animate({opacity:0, display:'none'},1200,showNextProduct);
                .fadeOut(1200, showNextProduct);
        }

        showNextProduct();
    }

    $('#bookingDate').datetimepicker({
        defaultDate : new Date(),
        format:'Y-m-d H:i',
        startDate: new Date()
    });

    initTypeAhead($("#location"), "location", "/metadata/getArea/",10);

    $("#book-button").click(function() {
        if($("#cPass")[0].checkValidity()){
        var url = "services/api/booking"
        var result = {};
        $.each($("#cPass").serializeArray(), function () {
            if (this.name == "bookingDate" && this.value != null && this.value != undefined && this.value != '') {
                result[this.name] = this.value.split(" ")[0];
                result["bookingTime"] = this.value.split(" ")[1];
            } else {
                result[this.name] = this.value;
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(result),
            success: function (data) {
                if (data.id != undefined && data.id != null && data.id != '') {
                    $('#success-message').removeClass("collapse");
                    $('#book-button').attr('disabled', 'disabled');
                }
            }, error: function (jqXHR, status, err) {
                if (jqXHR.responseJSON != undefined && jqXHR.responseJSON != null && jqXHR.responseJSON != '') {
                    var errorMessage = '<strong>Failed! </strong>' + jqXHR.responseJSON.error;
                    $('#error-message').removeClass("collapse");
                    $('#errorMessage').html(errorMessage);
                }
            },
            dataType: "json",
            contentType: "application/json"
        });
    }
    });
});

