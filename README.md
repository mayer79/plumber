# plumber
Demo of the R package "plumber". How to deploy web services in R

How to test: Run script "make_model.R" to generate the model first. Then run "main.R" to set up a local R server that can either be called

- from within R-Studio through a mini-GUI or

- from the console or

As soon as it works, you can use the "dockerfile" to run the same app from within a Linux container:

1. Install and register Docker

2. Open powershell in the folder where "dockerfile" sits.

3. Build an image by running "docker build -t demo ." (without quotes, but with the dot)

4. Start a container by entering "docker run --rm -p 80:80 demo" (rm removes the container automatically on stop)

5. Open a browser and enter e.g. "http://127.0.0.1:80/predict_price?carat=0.4" to get the expected price of a 0.4 carat diamond.

6. Stop all running containers by entering "docker stop $(docker ps -a -q)" into powershell. Entering "docker ps -a" lists all containers.

