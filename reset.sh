#!/bin/sh
echo "Initializing reset of cmpsc131python repository..."

echo "Creating backup..."
git add .
git commit -m "All your old stuff"
branch=backup.$(date +"%s")
git checkout -b $branch
git push origin $branch
echo "...done"

echo "Rolling back commits..."
git branch -D master
git checkout -b master b00ad82272133adbe0bc8b4f639c90829ccb01c0
echo "...done"

echo "Running setup..."
git remote add staff https://github.com/psu-cmpsc131-fa20/CMPSC131PYTHON.git
git pull staff master --allow-unrelated-histories --no-edit
git push -u origin -f master
echo "...done"
