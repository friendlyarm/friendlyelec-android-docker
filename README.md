## **FriendlyELEC-Android-Docker**

This docker image is used to build android open source project for FriendlyELEC's boards, support for the following android versions:  
* Android7 (for RK3399)  
* Android5.1 (for S5P4418/S5P6818)  
* Android4.4 (for S5P4418) 
* Android4.4 (for Allwinner H3)

Build docker image
------------

```
$ git clone https://github.com/friendlyarm/friendlyelec-android-docker.git
$ docker build -t "fa-android" friendlyelec-android-docker
```

Run
------------

Enter docker shell:  
```
$ mkdir -p ~/work
$ docker run -it  -v ~/work:/work fa-android /bin/bash
```

This will mount the local ~/work directory to the container's /work directory.  

Build
------------

* Android 7 (for RK3399)
```
$ cd /work
$ git clone https://gitlab.com/friendlyelec/rk3399-nougat.git
$ cd rk3399-nougat
$ ./build-nanopc-t4.sh -F -M
```

* Android 5.1.1_r6 (for S5P4418 & S5P6818)
```
$ cd /work
$ tar xvf android-5.1.1_r6-20180206.tar.xz
$ cd android
$ cp /usr/bin/ld.gold prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.11-4.6/x86_64-linux/bin/ld
$ source build/envsetup.sh
$ lunch aosp_nanopi3-userdebug
$ make update-api
$ make -j4
```

* Android4.4 (for S5P4418)
```
$ cd /work
$ tar xvf android-4.4.2-20180207.tar.xz 
$ export PATH=/usr/lib/jvm/jdk1.6.0_45/bin:$PATH
$ cd kitkat
$ sed -i -e "s/) = 3.82))/) = 4.1))/g" build/core/main.mk
$ source build/envsetup.sh
$ lunch aosp_nanopi2-userdebug
$ make -j4
```

* Android 4.4 (for Allwinner H3)
```
$ cd /work/
$ git clone https://github.com/friendlyarm/h3_lichee.git --depth 1 -b master lichee
$ cp gcc-linaro-arm.tar.xz lichee/brandy/toolchain/
$ cd lichee/fa_tools/
$ ./build.sh -b nanopi-m1 -p android -t all
$ cd ../../
$ 7z x h3-android-20170608.7z.001
$ cd android
$ sed -i -e "s/) = 3.82))/) = 4.1))/g" build/core/main.mk
$ ./build.sh -b nanopi-m1
```

Resources
------------
* How to Install and Use Docker on Ubuntu 18.04  
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

## License

The MIT License (MIT)
Copyright (C) 2018 FriendlyELEC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
