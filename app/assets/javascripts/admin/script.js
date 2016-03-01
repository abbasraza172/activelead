
// CHART PLOTTING

$.fn.dashChart = function() {
    var d1 = [[0,2], [2,4], [4,7], [6,8], [8,10], [10,10], [12,13], [14,14], [16,16], [18,15], [20,17]];
    d2 = [[4,0], [8,2], [10,4], [14,5], [16,4], [18,7], [20,8]];
    $.plot($("#dash-chart"), [ { data: d1, color: "#a0c420" }, { data: d2, color: "#d47c2f" } ], {
        series: {
            lines: { show: true, fill: true },
            points: { show: true },
            resize: false },
        xaxis: { ticks: false },
        yaxis: { ticks: false },
        grid: { borderWidth: 0, hoverable: true }
    });
};


// GAUGES

$.fn.dashGages = function() {
    cpu = new JustGage({ id:"cpu", value:25,min:0,max:100,title:"CPU (%)"});
    ram = new JustGage({ id:"ram", value:1.6,min:0,max:8.2,title:"RAM (GB)"});
    mem = new JustGage({ id:"mem", value:1.4,min:0,max:2.4,title:"HDD (TB)"});
    setInterval( function() {
        cpu.refresh(getRandomInt(10,50));
        ram.refresh(getRandomInt(0.9,4.2));
    }, 4000);
};

$('#chk-up-btn').click( function() {
    $('#chk-up-btn').attr('disabled', true);
    $('#sys-up-ok').fadeOut(150, function() {
        $('#sys-up-check').fadeIn(300).delay(2000).fadeOut(300, function() {
            $('#sys-up-ok').fadeIn(300);
            $('#chk-up-btn').attr('disabled', false);
        })
    })
});



$.fn.loadfns( function() { // PUT FUNCTIONS TO BE EXECUTED ON DOCUMENT READY HERE
    $('.spark').sparkline('html', {
        type: 'bar', height: '40px', barSpacing: 4, barColor: '#89A824', negBarColor: '#d6692f'
    });
    $.fn.dashGages();
    $.fn.dashChart();
    $('#intro').nanoScroller();
    $("#table").tablesorter();
});

// TOP BAR CHAT WIDGET

$('#reply-btn').click( function() { setTimeout( function() { $('#chat-reply-input').focus(); }, 1000); });

$("#chat-reply-input").keyup(function(e){
    if (e.keyCode === 13 && $(this).val()) {
        $('#chat-load').fadeIn(300).delay(500).fadeOut(300, function() {
            $('#chat-reply-input').val('').blur();
            $('#chat-confirm').fadeIn(300).delay(800).fadeOut(300);
        });
    };
});

// TOP BAR CALENDAR WIDGET

var d = new Date();
var day = d.getDate();
var month = d.getMonth();
var months = [ "Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec" ];

$('#cal-day').text(''+day+' '+months[month]+'');





// TASKS & TO-DO LIST

$('#task-box ul').sortable({
    placeholder: 'sort-placeholder',
    containment: 'parent',
    tolerance: 'pointer',
    axis: 'y'
});
$('#task-box ul').disableSelection();

$('#task-box li:not(.task)').click( function() { $(this).toggleClass('done'); });


// CONTROL PANEL SETTINGS

$('#sidebar-pos .left').click( function() { $('#wrapper').removeClass('sidebar-hz sidebar-top sidebar-right sidebar-bottom'); });
$('#sidebar-pos .top').click( function() { $('#wrapper').addClass('sidebar-hz sidebar-top').removeClass('sidebar-right sidebar-bottom'); });
$('#sidebar-pos .right').click( function() { $('#wrapper').addClass('sidebar-right').removeClass('sidebar-hz sidebar-top sidebar-bottom'); });
$('#sidebar-pos .bottom').click( function() { $('#wrapper').addClass('sidebar-hz sidebar-bottom').removeClass('sidebar-right sidebar-top'); });

// COLOR SCHEME SETTINGS

var storageStatus = $.storage();
if (storageStatus) {
    $('#res-set').click( function() { localStorage.clear(); location.reload(true); });
    var storedColorScheme = localStorage.getItem('color-scheme');
    storedSidebarColor = localStorage.getItem('sidebar-color');
    storedHeaderColor = localStorage.getItem('header-color');
    userName = localStorage.getItem('user-name');
} else {
    var storedColorScheme,
        storedSidebarColor,
        storedHeaderColor,
        userName;
    $('#res-set').attr('disabled','disabled');
}

var sidebarColor = $('#sidebar').css('background-color');
function rgb2hex(rgb){
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    return "#" +
        ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
        ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
        ("0" + parseInt(rgb[3],10).toString(16)).slice(-2).toLowerCase();
}
$.minicolors.defaults.position = 'top right';

if (storedColorScheme) { $('#color-scheme .black').toggleBtn(); };
if (storedSidebarColor) { $('#sidebar-color').val(storedSidebarColor) };
if (storedHeaderColor) { $('#header-color').val(storedHeaderColor) };
if ($('body').hasClass('dark') && !storedHeaderColor) { $('#header-color').val('#707070').attr('placeholder','#707070') };
$('#color-scheme .black').click( function() {
    if (!$('body').hasClass('dark')) {
        $('#load').fadeIn(400, function() { $('body').addClass('dark'); $('#load').delay(400).fadeOut(800); });
        if (!storedHeaderColor) $('#header-color').val('#707070').attr('placeholder','#707070');
        if (storageStatus) localStorage.setItem('color-scheme','dark');
    }
});
$('#color-scheme .light').click( function() {
    if ($('body').hasClass('dark')) {
        $('#load').fadeIn(400, function() { $('body').removeClass('dark'); $('#load').delay(400).fadeOut(800); });
        if (!storedHeaderColor) $('#header-color').val('').attr('placeholder','Transparent');
        if (storageStatus) localStorage.removeItem('color-scheme');
    }
});
$('#sidebar-color').minicolors({
    change: function(hex) {
        $('#sidebar').css('background-color',hex).lightOrDark();
        if (storageStatus) {
            localStorage.setItem('sidebar-color',hex);
            if ($('#sidebar').hasClass('light')) { localStorage.setItem('sidebar-light',1) } else { localStorage.removeItem('sidebar-light') };
        }
    }
});
$('#header-color').minicolors({
    change: function(hex) {
        $('.box:not(.mini) .header').css('background-color',hex).lightOrDark();
        if (storageStatus) {
            localStorage.setItem('header-color',hex);
            if ($('.box .header').hasClass('dark')) { localStorage.setItem('header-dark',1) } else { localStorage.removeItem('header-dark') };
            if (!$(this).val()) { localStorage.removeItem('header-dark'); };
        }
        if (!$(this).val()) { $('.box .header').removeClass('dark'); };
    }
});

$.fn.reverseChatMsg = function() {
    if ($(this).hasClass('rec')) { $(this).removeClass('rec').addClass('sent');
    } else if ($(this).hasClass('sent')) { $(this).removeClass('sent').addClass('rec'); };
};
if (userName == 'm1chael') {
    $('#chat-usr1 img').attr('src','avatars/alex.jpg'); $('#chat-usr1 .contact-name').text('Alex');
    $('#usr1-msg p').each( function() { $(this).reverseChatMsg(); });
};
if (userName == 'Johnny 1337') {
    $('#chat-usr2 img').attr('src','avatars/alex.jpg'); $('#chat-usr2 .contact-name').text('Alex');
    $('#usr2-msg p').each( function() { $(this).reverseChatMsg(); });
};
