#!/bin/bash

# A script to quickly update, destroy, and rebuild the VM used in class

vagrant box update && vagrant destroy --force && vagrant up && vagrant prune