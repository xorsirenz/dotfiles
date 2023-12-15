#!/bin/bash
#
cd /home
for usr in *
do
  chown -R ${usr} ${usr}
done
