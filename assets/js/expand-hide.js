$('.freqlist table').hide();
$('.freqlist p').hide();
$('.freqlist h3').click(function() {
    $(this).closest('.freqlist').find('table').slideToggle();
    $(this).closest('.freqlist').find('p').slideToggle();
});