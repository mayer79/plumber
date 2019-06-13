library(plumber)
r <- plumb("r/rest_controller.R")
r$run(port = 8000, host='0.0.0.0')

# curl -X GET "http://localhost/predict_price?carat=0.4" -H  "accept: application/json"
# curl -H "Content-Type: application/json" -X GET -d "{\"carat\":0.7}" "http://localhost/predict_price"