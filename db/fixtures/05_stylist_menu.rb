Stylists::Menu.seed(:id,
                    {
                        id:             1,
                        customer_id:    2,
                        name:           'カット',
                        price:          5980,
                        operation_time: 60,
                        content:        'カット+シャンプー',
                        sales_copy:     '髪型の相談から丁寧に対応します',
                        memo:           'ヘアーカット集準備あります'
                    }, {
                        id:             2,
                        customer_id:    2,
                        name:           'カット+カラー',
                        price:          8990,
                        operation_time: 120,
                        content:        'カット+カラー+シャンプー',
                        sales_copy:     'こだわりのカラー剤で艶のあるカラーを実現します',
                        memo:           '持ち込みのカラー剤でも対応します'
                    }
)