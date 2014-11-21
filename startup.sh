#!/bin/bash
bundle install --system --without=test development
thin $@ -R config.ru start
