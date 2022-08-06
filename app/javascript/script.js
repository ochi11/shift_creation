 /*$('#calendar').fullCalendar({
        events: '/events.json',
        //カレンダー上部を年月で表示させる
        titleFormat: 'YYYY年 M月',
        //曜日を日本語表示
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        //ボタンのレイアウト
        header: {
            // title, prev, next, prevYear, nextYear, today
            left: 'prev,next today',
            center: 'title',
            right: 'month agendaWeek agendaDay'
        },
        events: '/store_managers/<%= @id %>/reservations.json',

viewRender : function(view, element) {
          // 月表示の時
          if (view.type == "month") {
            document.getElementsByClassName('fc-prev-button fc-button fc-state-default fc-corner-left')[0].textContent = "前月"
            document.getElementsByClassName('fc-next-button fc-button fc-state-default fc-corner-right')[0].textContent = "次月"
          }
          // 週表示の時
          if (view.type == "agendaWeek") {
            document.getElementsByClassName('fc-prev-button fc-button fc-state-default fc-corner-left')[0].textContent = "前週"
            document.getElementsByClassName('fc-next-button fc-button fc-state-default fc-corner-right')[0].textContent = "次週"
          }
          // 日表示の時
          if (view.type == "agendaDay") {
            document.getElementsByClassName('fc-prev-button fc-button fc-state-default fc-corner-left')[0].textContent = "前日"
            document.getElementsByClassName('fc-next-button fc-button fc-state-default fc-corner-right')[0].textContent = "翌日"
          }
        },
        //ヘッダーボタンの名前
        buttonText: {
            prev: '前',
            next: '次',
            prevYear: '前年',
            nextYear: '翌年',
            today: '今日',
            month: '月',
            week: '週',
            day: '日'
        }
});

*/