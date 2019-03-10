Prerequisites
===========
1. Download https://github.com/PradheepaV/HousePricePrediction 

2. Navigate to HousePricePrediction folder, place the following files from this project in the same folder.
	  - nginx.conf
	  - pod.yaml
	  - Dockerfile
	  - requirements

3. Run the following commands to build docker images, containerize and run nginx & HousePricePrediction in a pod.


Commands to be run
====================

1. Dockerfile to build image for  housepriceprediction app :
	  - docker build --rm -f "Dockerfile" -t housepriceprediction:latest 

2. Create configmap for nginx.conf
	  - kubectl create configmap confnginx --from-file=./nginx.conf

3. Start pod in kubernetes
	  - kubectl apply -f .\pod.yaml

4. Ensure "multicontainer" pod is up and running ( shoud show as ready =2/2, status ="Running"),
   using the following commands:
	    - kubectl get pods
	    - kubectl get pods --output=wide

5. Expose kubernetes multicontainers and fetch the "Node Port" its running on
	    - kubectl expose pod multicontainers --type=NodePort --port=80
	    - kubectl describe service multicontainers

6. Access external host:port to access the app.
	    - https://localhost:<Node Port>/ping ,
	    - redirects to nginx-->app server, that shows the page as "alive"

7. Steps to bring down pod 
      - kubectl delete pod multicontainers
      - kubectl delete configmap confnginx
      - kubectl delete services multicontainers
      - kubectl get service multicontainers // to ensure service is down
      - kubectl get pods // to ensure pod is killed
