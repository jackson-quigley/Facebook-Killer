#!/bin/bash

pass=$1

echo $pass | ncat 10.154.8.166 42069
