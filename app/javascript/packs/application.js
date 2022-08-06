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

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import monthGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';

document.addEventListener('turbolinks:load', function() {
  /* var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ monthGridPlugin, dayGridPlugin, interactionPlugin ]
  });
*/


    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
        plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin ],
        //~省略~//

        events: '/admin/homes/top.json', // <=これを追加。表示させたい画面に。
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
    });

    calendar.render();

  calendar.render();
});
