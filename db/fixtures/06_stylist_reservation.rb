Stylists::Reservation.seed(:id,
                           {
                               id: 1,
                               customer_id: 2,
                               reservation_time: '2019-08-01 12:00:00',
                               operation_time: 60,
                               activity_scope: '渋谷区道玄坂',
                               memo: '',
                               status: false
                           }, {
                               id: 2,
                               customer_id: 2,
                               reservation_time: '2019-09-01 12:00:00',
                               operation_time: 120,
                               activity_scope: '渋谷区道玄坂',
                               memo: '',
                               status: false
                           }
)