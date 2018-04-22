#!/bin/bash

pass=$1

echo $pass | ncat 127.0.0.1 42069
