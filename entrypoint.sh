#!/bin/bash

nginx && \
code-server --auth none --bind-addr 0.0.0.0:5000 /workdir
