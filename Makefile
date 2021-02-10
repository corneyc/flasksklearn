setup:
	python3 -m venv ~/.udacity-devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
lint:
	pylint --disable=R,C,W1203,E999 app.py
	#uncomment to explore linting Dockerfiles
	#hadolint Dockerfile 
	

<<<<<<< HEAD
all: install lint test
=======
all: install lint test
>>>>>>> e9e66ab6988ca9521cff5ec8218b04beb08e9ca4
