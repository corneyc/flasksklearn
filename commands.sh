az webapp up -n $webAppName \
https://$webAppName.scm.azurewebsites.net/api/logs/docker \
pyhton3 -m venv ~/.venv &&\
source ~/.venv/bin/activate