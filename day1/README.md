## Lab - Cloning TekTutor Training Repository
```
cd ~
git clone https://github.com/tektutor/bazel-jan-2026.git
```

## Lab - Building a C++ application with make build utility
```
cd ~
cd bazel-jan-2026
git pull
cd Day1/lab1
cat Makefile

# The below command will build the c++ application using make build utility
make

# The below command will run the c++ hello world application
bin/hello

# The below command will delete all the binary files and the
# intermediate object files that were created by the build
make clean
```
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e981d7b5-adbf-489d-8986-4bf6a85b3bb0" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4b541eb1-8605-485a-85f6-de176fde9b52" />

## Lab - Install Qt Framework in Ubuntu
```
## Lab - Install Qt Creator in Ubuntu from command-line
```
sudo apt update
sudo apt install clang lld libclang-dev
sudo apt-get install build-essential
sudo apt-get install libfontconfig1
sudo apt-get install mesa-common-dev
sudo apt-get install libglu1-mesa-dev -y

sudo apt install -y qtcreator qtbase5-dev qt5-qmake cmake
qmake --version
qtcreator --version
qtcreator
```

## Lab3 - Building a Qt Widgets application using qmake and make utility
```
cd ~
cd bazel-jan-2026
git pull
cd day1/lab2
ls
tree

#Let's generate a .pro - qt creator project file
qmake -project

#Edit the lab2.pro file and add the line
QT += widgets

#Generate Makefile using qmake - qmake takes lab2.pro as input file from current dir
qmake

cat Makefile
make

# To run the qt widgets application
./lab2
```

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f749c970-ff91-4319-a30e-0c05da921f1a" />






