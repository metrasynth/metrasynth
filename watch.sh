#!/bin/bash
watchmedo shell-command -c 'make html' -p '*.rst;*.py' -R -W .
