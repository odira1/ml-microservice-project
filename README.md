[![CircleCI](https://circleci.com/gh/odira1/ml-microservice-project.svg?style=svg)](https://circleci.com/gh/odira1/ml-microservice-project)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* **Setup and Configure Docker locally**
  * To set up and configure Docker locally, you will need to have the following installed on your system:
    - Docker
  * Once you have Docker installed, you can verify that it is running on your system by running the following command:
    * `docker -v` This will show you the version of Docker that is currently installed.
  * To test that your installation is working properly, you can run the following command:
    * `docker run hello-world` This command will run the "hello-world" image, which is a small image that is built to test whether your Docker installation is working correctly.

* **Setup and Configure Kubernetes locally**
  * Finally, deploy the 
  * To set up and configure Kubernetes locally, you will need to have the following installed on your system:
    - Docker
    - Minikube
    - kubectl
  * Once you have these installed, you can start Minikube with the command:
    * `minikube start`
  * Next, you will need to configure kubectl to communicate with the Minikube cluster. This can be done with the command:
    * `minikube kubectl config current-context`
  
* **Create Flask app in Container**
  * To create the Flask app in a container, you will need need the `dockerfile` in the repo.
    * build and run the image with the `run_docker.sh` script
    * push the created image to your container repository by running the `upload_docker.sh` script
    * **Note**: you may need to modify the username in the `upload_docker.sh` script and you must ensure to 
      * create the DOCKER_PASSWORD env variable before running the script by running `export DOCKER_PASSWORD=<<your docker password>>`
* **Run via kubectl**
  * Now that you have your container image built, you can run it via kubectl. First, create a Kubernetes deployment with the `run_kubernetes.sh` script:
    * chmod u+x run_kubernetes.sh && ./run_kubernetes.sh
  * **Note**:
    - you may want to validate the cluster status, pods and services are running by running `kubectl get pods`, `kubectl get services`, and `kubectl get deployment`
    - If you running on non-linux, you may need to do port forwarding from the minikube vm to the localhost.
    make sure the ports are not occupied or blocked by firewall or another service.

