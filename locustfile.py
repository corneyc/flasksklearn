import random
from locust import HttpUser, task, TaskSet

class MyTaskSet(HttpUser):
    
    @task
    def index(self):
        self.client.get("/")
    @task(3)
    def checkPredict(self):
        self.client.post("/predict")

class MyLocust(HttpUser):
    task_set = MyTaskSet

    min_wait = 1000
    max_wait = 5000

    
    
