# Overview

In this project, I will build a Github repository from scratch and create a scaffolding that will assist me in performing both Continuous Integration and Continuous Delivery. I'll use Github Actions along with a ``Makefile``, ``requirements.txt`` and application code to perform an initial lint, test, and install cycle. Next, I'll integrate this project with Azure Pipelines to enable Continuous Delivery to Azure App Service.

This project will give me an opportunity to demonstrate my ability to perform continuous delivery for a Python-based machine learning application using the Flask web framework. I will apply the skills I have acquired in this course to operationalize a Machine Learning Microservice API.

I am using a pre-trained, ``sklearn`` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. This project tests my ability to operationalize a Python flask app—in a provided file, ``app.py``—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Project Plan


* [A link to a Trello board for the project](https://trello.com/invite/b/ovORHXlN/e5107d7ce5e406b9f8ec1e65714e5f9b/agiledevelopmentwithazure-project2)
* [A link to a spreadsheet that includes the original and final project plan](screenshots/project-management.xlsx)

## Instructions
 
* Architectural Diagram (Showing how key parts of the system work)

I started off by setting up a cloud-based development structure using Azure Cloud Shell. Then I created a ``Makefile``, tests, and application scaffolding. Once you complete this step you will be able to test code locally in the Azure Cloud Shell. This is a local continuous integration step. All Python that is created should have a local continuous integration setup as well as a remote build server that runs the same code. I followed a universal, and non-controversial, software engineering best practice to make sure my code is always in a testable and deployable state. I made sure that followed the steps inorder not to easily introduce bugs and unchecked errors. Additionally,  I also learnt that people who use your Github repository will have no idea if the code works.

I adapted the following diagram from the notes provided on the course. In this diagram, the Azure Cloud Shell is used to create an empty scaffold of tests, source code, Makefile, and requirements.

![alt-image](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure-cloud-shell.png?raw=true)


## Instructions for running the Python project.   

The following paragraphs will run you through steps on how run a Python project, GitHub repository creation, use of Azure Pipelines continuous integration and continuous delivery (CI/CD) to deploy a Python web app to Azure App Service on Linux. Finally, you create an Azure Pipelines CI/CD pipeline that automatically builds the code and deploy it to the App Service whenever there's a commit to the repository.

1. Create a GitHub repository. Following the screenshots:

On the left you will see a green icon which reads ``NEW``, click on it

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/screen_1.png)

The following will appear, give your repo a meaningful name of your choice. Mine I have called 'my first repo': and you can also 
add a description.

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/screen_2.png)

Select ``Add a README file``  and ``Add .gitinore`` and in the dropdwon menu type in Python:

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/screen_3.png)

Then click create repository in the green icon

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/screen_5.png)

The last step in the repo you have created is to clone the repo. We will be doing it in Azure.

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/screen_4.png)


2. Create an Azure account. Follow the screensshots below and the instructions that follow on your screen until you get to the screen simlar to the next screen.

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure_screen_6.png)


In Azure, you will get to screen which looks like the one below. 

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure_screen_7.png)

On the icon to the right of the search bar. The icon will open a Command Line Interface (CLI) at the botton of the page. Then follow the instructions on the screen abd select ``Bash``.

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure_screen_8.png)

Eventually, you will be taken the screen as shown below

![alt-image 1](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure_screen_9.png)

In the terminal you are going to clone the repository you created as follows: ``git clone https://github.com/<your-alias>/this-is-my-first-repo.git`` Replace ``<your-alias>`` with the name of the GitHub account you created to fork the repository.

In the Cloud Shell, change directories into the repository folder that will have your Python app, so the az webapp up command will recognize the app as Python. For the purposes of this exercise we will clone an example repository from Microsoft azure: ``git clone https://github.com/Azure-Samples/python-docs-hello-world``. Then navigate into that folder: ``cd python-docs-hello-world``. The sample contains framework-specific code that Azure App Service recognizes when starting the app. 

## Create the Makefile
Inside your GitHub repo from the Cloud shell, your next step will be to create a file named ``Makefile`` and copy the code below into it (remember this needs to use tab formatting). Remember that a ``Makefile`` is a handy way to create shortcuts to build, test, and deploy a project.

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Cloud_screen_11.png)

Follow type in ``touch Makefile`` in the Cloud Shell terminal and enter. A file called ``Makefile`` will be created and see the screen below to navigate to the editor.

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Cloud_screen_12.png)

Next click on the two curley braces to open the editor.

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Cloud_screen_13.png)

On the screen below navigate to the files and find the ``Makefile`` you created.

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Cloud_screen_14.png)

Open the file and paste the code below.

```
install:
    pip install --upgrade pip &&\
        pip install -r requirements.txt

test:
    python -m pytest -vv test_hello.py


lint:
    pylint --disable=R,C hello.py

all: install lint test
```

This is how the code will look like:

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Cloud_screen_15.png)

## Create requirements.txt
Inside the same repo you created ``Makefile``, there is a text file already, named ``requirements.txt``. Navigate to it and it should include the following items below. Remember that a ``requirements.txt`` is a convenient way to list what packages a project needs. Another optional best practice would be to "pin" the exact version of the package you use.

```pylint
   pytest
   ```
## Create the Python Virtual Environment
Inside your Azure Cloud Shell environment create a Python virtual environment. Remember that by creating the virtual environment in a home directory it won't accidentally be checked into your project.

```
python3 -m venv .venv
source .venv/bin/activate
```
## Create the script file and test file.
The next step is to create the script file and test file. We are going to ignore the ``app.py`` thats already in the repo for now.  This is a boilerplate code to get the initial continuous integration process working. It will later be replaced by the real application code.

First, you will need to create ``hello.py`` with the following code at the top level of your Github repo:

```
def toyou(x):
    return "hi %s" % x


def add(x):
    return x + 1


def subtract(x):
    return x - 1
```
    
Next, you will need to create ``test_hello.py`` with the following code at the top level of your Github repo:

```
from hello import toyou, add, subtract


def setup_function(function):
    print("Running Setup: %s" % function.__name__)
    function.x = 10


def teardown_function(function):
    print("Running Teardown: %s" % function.__name__)
    del function.x


### Run to see failed test
#def test_hello_add():
#    assert add(test_hello_add.x) == 12

def test_hello_subtract():
    assert subtract(test_hello_subtract.x) == 9
```

3. Local Test

Now it is time to run ``make all`` which will install, lint, and test code. This enables us to ensure we don't check in broken code to GitHub as it installs, lints, and tests the code in one command. Later we will have a remote build server perform the same step. The following screen is the outcome.

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/make_all_scrn.png)


## Project running on Azure App Service
I created the Resource group and the App Service from the Azure Cloud Shell using the following : ``az webapp up --sku B1 --name flaskproject-ml``. This created the Resource group in the Azure Consol:

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/rg.png)

And the App name flaskproject-ml was also created in the App services.

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/appname.png)

Running ``az webapp up flaskproject-ml`` produced the following screen:

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/az_web_up.png)

## * Passing tests that are displayed after running the `make all` command from the `Makefile`

Running ``make all`` produced the following:

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/make_all.png)

## Project cloned into Azure Cloud Shell

The project repository was cloned into Azure Cloud Shell using ``git clone git@github.com:corneyc/AgileDevelopmentwithAzure-Project-2.git``
![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/proj_cloned.png)

## Output of a test run

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/make_all.png)

Launching the app at ``https://flaskproject-ml.azurewebsites.net/`` yielded the following:

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/applaunch.png)

## Successful deploy of the project in Azure Pipelines. 

Azure Deployement center

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/azure_deploy.png)

## Running Azure App Service from Azure Pipelines automatic deployment

![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/pipeline_deploy.png)


![alti-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/deploy_az%20_webapp.png)


## Successful prediction from deployed flask app in Azure Cloud Shell.  
The output should look similar to this:

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/test_1.png)

With ``cat ./make_predict_azure_app.sh``

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/test_2.png)


## Output of streamed log files from deployed application

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/streamed_logs_az.png)


![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/streamed_logs_1.png)


![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/build_deploy_github.png)

Log stream screenshot

![alt-img](https://github.com/corneyc/AgileDevelopmentwithAzure-Project-2/blob/main/flask-sklearn/images/Log_stream.png)


## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


