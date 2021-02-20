# Hướng dẫn tạo package
# Cài 1 số packages hỗ trợ
#install.packages(c("devtools", "roxygen2", "usethis", "available"))
library(devtools)
library(roxygen2)
library(usethis)
# Kiểm tra xem tên package đã có trên cran chưa
# Nếu có ý định upload package này lên cran thì có thể dùng hàm này để kiểm tra xem package đã có trên cran hay chưa.

library(available)
available("git.manual")
# Tạo package
# Tạo package và thêm git vào.

usethis::create_package("D:/R/build.model.web")
use_git()
use_github()

# Chỉnh sửa DESCRIPTION
# Có thể chỉnh sửa trực tiếp bằng tay (làm cách này khi mất code thì phải làm đi làm lại). Nên trong phần này mình sẽ chỉnh sửa file DESCRIPTION sử dụng package desc

library(desc)
# Xóa DESCRIPTION mặc định
unlink("DESCRIPTION")

# Tạo mới và clean file DESCRIPTION
# Do package sử dụng object R6, nên có thể dùng hàm hoặc toán tử $ để chỉnh sửa các thành phần của object

my_desc <- description$new("!new")

# Đặt tên package của bạn
my_desc$set("Package", "build.model.web")

# Tên của tác giả
my_desc$set("Authors@R", "person('Ngoc Binh', 'Nguyen', email = 'nguyenngocbinhneu@gmail.com', role = c('cre', 'aut'))")

#Xóa 1 số trường liên quan đến tác giả hoặc người duy trì
my_desc$del("Maintainer")

#Đặt phiên bản
my_desc$set_version("0.0.0.9000")

#Title của package
my_desc$set(Title = "Utility to build models in web")

# Mô tả về package
my_desc$set(Description = "Build models in website using shiny.")

# urls
my_desc$set("URL", "https://github.com/nguyenngocbinh/build.model.web/")
my_desc$set("BugReports", "https://github.com/nguyenngocbinh/build.model.web/issues")

# Tạo file DESCRIPTION mới
my_desc$write(file = "DESCRIPTION")

# Tạo file license
# Sau khi đã chỉnh sửa file DESCRIPTION ở trên. Phần này sẽ tạo ra file license. Ví dụ với MIT license.

# options(usethis.full_name = "Nguyen Ngoc Binh")
use_mit_license("Nguyen Ngoc Binh")
# use_gpl3_license()
# use_apl2_license()
# use_cc0_license()

# Thêm readme
use_readme_rmd()

# Thêm raw data
use_data_raw()

# tạo ra folder data-raw. Trong này sẽ chứa code để setup raw data.

# Thêm file chứa các nhóm hàm
#tạo ra 1 file .R trong folder /R/
use_r("sfa")

# testthat
use_testthat()
use_test("function_name")

# Thêm packages dependencies
use_package("dplyr")
use_package("purrr")

# Sử dụng file new để cập nhật những thay đổi
use_news_md()

# Thêm hướng dẫn sử dụng/ báo cáo đầu ra
use_vignette("git.manual", "Simulate git")

# Chỉnh sửa version
use_version()

# Tạo các help file
# Đây là những file .md được lưu trong folder man/

use_roxygen_md()

# Format lại file DESCRIPTION
use_tidy_description()

# Tham khảo thêm
?use_github_action()
use_appveyor()
use_coverage(type = c("codecov"))
use_spell_check()
