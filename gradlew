#!/bin/sh
##############################################################################
# Gradle start up script - launches Gradle via the wrapper JAR.
# If gradle-wrapper.jar is missing, run: gradle wrapper  (with any local Gradle install)
# or simply open this project in Android Studio, which regenerates the wrapper
# automatically the first time you open/sync the project.
##############################################################################
DIR="$(cd "$(dirname "$0")" && pwd)"
exec gradle "$@" -p "$DIR"
