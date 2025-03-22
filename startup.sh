#!/bin/bash

function buildProjects () {
    echo assembling...
    # don't always need to clean but sometimes necessary as changing some files isn't noticed by gradle so it doesn't automatically rebuild
    # ./gradlew clean
    ./gradlew assemble
}

function composeDown() {
  echo decomposing...
  docker compose down
}

function composeUp() {
  echo composing...
  docker compose up -d
}

function removeImages() {
  docker image rm  personservice-spring-app -f
}

function __run__() {
  composeDown
  removeImages
  buildProjects
  composeUp $@
}

__run__ $@