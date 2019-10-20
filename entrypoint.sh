#!/bin/bash

tox --sitepackages
python setup.py install --dry-run