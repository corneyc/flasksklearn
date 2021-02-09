setup:
	python3 -m venv ~/.udacity-devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
<<<<<<< HEAD
lint:
	pylint --disable=R,C,W1203 app.py
	#uncomment to explore linting Dockerfiles
	#hadolint Dockerfile 
	
=======


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,E0001,E0001 app.py
>>>>>>> dacd05d80242b49e4037365d25ea0a8661d95cc0

all: install lint test
