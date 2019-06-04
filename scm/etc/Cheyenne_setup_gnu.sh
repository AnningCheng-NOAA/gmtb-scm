#!/bin/bash

echo "Setting environment variables for SCM-CCPP on Cheyenne with gcc/gfortran"

#load the modules in order to compile the GMTB SCM
echo "Loading gnu and netcdf modules..."
module purge
module load ncarenv/1.2
module load gnu/8.1.0
module load ncarcompilers/0.4.1
module load mpt/2.19
module load netcdf/4.6.1


echo "Setting CC/CXX/FC environment variables"
export CC=gcc
export CXX=g++
export FC=gfortran

#install f90nml for the local user

#check to see if f90nml is installed locally
echo "Checking if f90nml python module is installed"
python -c "import f90nml"

if [ $? -ne 0 ]; then
	echo "Not found; installing f90nml"
	cd etc/scripts/f90nml-0.19
	python setup.py install --user
	cd ../..
else
	echo "f90nml is installed"
fi
