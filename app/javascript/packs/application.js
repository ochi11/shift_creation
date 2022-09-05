// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'
import "script.js"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import monthGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';

  document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
        plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin ],
        //~省略~//

        events: '/public/hope_shifts.json', // <=これを追加。表示させたい画面に。
        // 書き方のルールとしては['/コントローラー名.json']としてください

        headerToolbar: {
            // ここ
            start: 'dayGridMonth dayGridWeek timeGridDay',
            center: 'title',
            end: 'today prev,next'
        },

        buttonText: {
           today: '今日',
           month: '月',
           week: '週',
           day: '日'
        },

        locale: 'ja',

        selectable: true,
        selectHelper: true,
        ignoreTimezone: false,
        editable: true,
        eventLimit: true, 
        //select: select,

        /*dateClick: function(info) {
          alert('Clicked on: ' + info.dateStr);
          // change the day's background color just for fun
          //info.dayEl.style.backgroundColor = 'green'; 背景色選択
        },*/

        select: function (info) {
        //alert("selected " + info.startStr + " to " + info.endStr);

          // 入力ダイアログ
          const eventName = prompt("イベントを入力してください");
        
          if (eventName) {
            // イベントの追加
              calendar.addEvent({
                title: eventName,
                start: info.start,
                end: info.end,
                allDay: false,
            }); 
        }
    }, 
    
        /*select: function(start, end) {
          $*getScript('/events/new', function() {
            $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"));
            date_range_picker();
            $('.start_hidden').val(moment(start).format("MM/DD/YYYY HH:mm"));
            $('.end_hidden').val(moment(end).format("MM/DD/YYYY HH:mm"));
          });
          
          calendar.fullCalendar('unselect');
        }*/


    });

    

  calendar.render();
  });