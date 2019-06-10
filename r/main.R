library(plumber)
r <- plumb("r/rest_controller.R")
r$run(port = 80, host = "0.0.0.0")

# curl -X GET "http://127.0.0.1:80/predict_price?carat=0.4" -H  "accept: application/json"
# curl -H "Content-Type: application/json" -X GET -d "{\"carat\":0.7}" "http://127.0.0.1:80/predict_price"