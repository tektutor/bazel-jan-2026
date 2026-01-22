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
sudo apt update
sudo apt install clang lld libclang-dev -y
sudo apt-get install build-essential -y
sudo apt-get install libfontconfig1 -y
sudo apt-get install mesa-common-dev -y
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





# Bazel build tool

## Installing Bazel in Ubuntu
```
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install -y bazel
bazel --version
```
## Info - Bazel Overview
<pre>
- a build system, not a build generator ( invokes the compiler directly )
- with full of functionality for testing ( test reports, flaky tests handling, etc )
- Bazel core is written in Java, rules and macros written in Starlark ( a language similar to python )
- History - From Blaze to Bazel
  - Blaze is a build system at Google ( development started around 2007 )
  - Part of Blaze was open sourced by 2015 as Bazel
  - It moved from beta to general availability in Oct 2019
- Release process
  - Since the general availability release, Bazel follows semantic versioning
  - Minimum 3 months between major releases
  - A minor release every month based on GitHub HEAD
  - Long Term Support (LTS) starting from Bazel 4.0(Dec 2020), a new LTS release will be provided every 9 months
  - https://blog.bazel.build/2020/11/10/long-term-support-release.html
</pre>

## Info - Bazel Features
<pre>
- Fast and correct
  - Incremental builds and test execution
  - Parallel execution
  - Local and remote cache
  - Hermetic builds, thanks to sandboxing
- Multi-language, multi-platform
  - Java, C/C++, Android, ios, Go, Python, etc.,
  - Linux, Windows and Mac OS-X
- Scalable
  - It can handle codebases of any size
  - Multiple repositories or huge monorepo, it handles both
- Extensible
  - If a platform or language is not supported can be easily added
  - Extensions are written in Skylark, a language similar to Python
- Reference
  - https://docs.bazel.build/versions/3.7.0/bazel-overview.html#why-should-i-use-bazel
</pre>

## INfo - Bazel in a Nutshell
<pre>
- It is an artifact based system
  - Inputs are treated as artifacts
  - Outputs are treated as artifacts
  - Actions are treated as artifacts as well
  - For every artifact, a hash can be computed in advance to allow caching
- Each action runs on a sandbox
  - Improving reproducibility
  - Better detection or undeclared dependencies
- Composibility
  - Outputs of an action can be used as inputs or another action
  - An action can be output of another action
</pre>

## Info - Bazel Architecture
<pre>
- Bazel follows client/server architecture
- the first time a Bazel command is executed, a Bazel server is started
- after the Bazel command finishes, the server keeps running
- the following commands executed use the already running server
- Two Bazel clients cannot run in parallel ( with exceptions )
- The Bazel server can be stopped with bazel shutdown
- this architecture allows the server to cache information
</pre>


## Info - Bazel Files
<pre>
- WORKSPACE
  - At the root of the source code that you want to build
  - It can be empty
  - Used to declare external dependencies
- BUILD
  - At the root of the package
  - A package is defined by 
    - all files, folders and subfolders at the same level like the BUILD file except the ones that contain a BUILD file
  - Where targets are defined
- *.bzl
  - Used to define Bazel extensions
  - They can be loaded in BUILD or WORKSPACE file using the load statement
- For details
  - https://docs.bazel.build/versions/3.7.0/build-ref.html#concepts-and-terminology
</pre>

## Info - Bazel Labels
<pre>
- @reposiotory//folder/subfolder:my_target
- Omitting the repository assumes the current directory
  - @repository//folder/subfolder:my_taget
  - //folder/subfolder:my_target
- Omitting the colon assumes the same name like the folder
  //lib:lib
  //lib
- For details
  - https://docs.bazel.build/versions/3.7.0/build.ref.html#labels
</pre>

## Info - Target Visibility
<pre>
- Who can see which files
- //visibility:private (  only from same BUILD file )
- //visibility:public ( anyone can see this target )
- //foo/bar:__subpackages__ ( visible for a specific packages and sub-packages ) 
- //foo/bar:__pkg__ ( visible for a specific package but not sub-packages )
- Visibility can be defined per package, per target or both
- By default, the target visibility is the same like the package
- For details
  - https://docs.bazel.build/versions/3.7.0/visibility.html
- example
cc_library (
   name = "my_lib",
   srcs = ["my_lib.cpp"],
   visibility = [
       "//client:__subpackages__",
   ],
   hdrs = ["my_lib.h"],
)
</pre>

## Lab - Installing JFrog Artifactory open source variant
```
docker run -d --name artifactory-oss \
  --memory=4g \
  -p 8082:8082 \
  -v artifactory-data:/var/opt/jfrog/artifactory \
  releases-docker.jfrog.io/jfrog/artifactory-oss:7.77.5
```

## Lab - Bazel directory structure
```
cd ~
mkdir -p bazel-jan-2026/day1
cd bazel-jan-2026/day1/lab5
tree
#In this lab exercise, we use a emtpy WORKSPACE file - but this is mandatory
cat WORKSPACE
cat BUILD
bazel build hello
```





