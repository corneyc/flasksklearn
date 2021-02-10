from locust import HttpUser, TaskSet, task

class MyTask(TaskSet):
    @task
    def get_root_path(self):
        self.client.get("/")
    
    @task
    def get_predictions(self):
        self.client.get("/predict")

class MyLocust(HttpUser):
    task_set = MyTask

    min_wait = 1000
    max_wait = 2000

    
