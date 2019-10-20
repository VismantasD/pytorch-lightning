#!/bin/bash

source ~/venv/bin/activate
tox --sitepackages
python setup.py install --dry-run