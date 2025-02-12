# This is the Load test file that will simulate traffic from production.
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def create_user(self):
        self.client.get("/world")