# Questions

1. 如何在 terminal 輸入 `kanban` 來執行程式？

我後來加上 `#!/usr/bin/env ruby` 可以省掉一點指令，變成 ./main.rb 來執行，但不確定有沒有辦法可以直接輸入 main 就執行程式碼

2. 是否需要為 Kanban Item 也建立一個 Class 來儲存屬性跟一些檢查的 method?

原本有想過要拆的更細，但覺得這題的情境好像不需要那麼詳細，在儲存到 items.json 時需要的步驟也會變多

3. cli_reader 結構

這邊就是用 Service Object 來實現了，但總覺得好像有更好的寫法，一時之間想不太到