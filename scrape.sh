#!/bin/bash

pass=$1

echo $pass | ncat 10.154.40.212 42069
