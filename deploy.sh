docker build -t wafeekolatunji/multi-client:latest -t wafeekolatunji/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t wafeekolatunji/multi-server:latest -t wafeekolatunji/multi-server:$SHA -f  ./server/Dockerfile ./server
docker build -t wafeekolatunji/multi-worker:latest -t wafeekolatunji/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push wafeekolatunji/multi-client:latest
docker push wafeekolatunji/multi-server:latest
docker push wafeekolatunji/multi-worker:latest
docker push wafeekolatunji/multi-client:$SHA
docker push wafeekolatunji/multi-server:$SHA
docker push wafeekolatunji/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=wafeekolatunji/multi-server:$SHA
kubectl set image deployments/client-deployment client=wafeekolatunji/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=wafeekolatunji/multi-worker:$SHA