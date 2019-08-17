Salons::Reservation.seed(:id,
                           {
                               id: 1,
                               customer_id: 1,
                               reservation_time: '2019-08-01 12:00:00',
                               operation_time: 60,
                               memo: '',
                               status: false
                           }, {
                               id: 2,
                               customer_id: 1,
                               reservation_time: '2019-09-01 12:00:00',
                               operation_time: 120,
                               memo: '',
                               status: false
                           }
)