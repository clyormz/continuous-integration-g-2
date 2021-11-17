#!/bin/bash

python3 manage.py db init
python3  manage.py db migrate
python3 manage.py db upgrade

flask run --host=0.0.0.0