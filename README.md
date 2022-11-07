I am planning to document the process of running an old (licensed) version of LOTUS 123 v4.2 on the reMarkable tablet, via BOCHS emulation. <br>
See it in action: https://www.dropbox.com/s/nvuqo4zncsqhizt/YouCut_20221107_222834913.mp4?dl=0
<br><br>
<h2>DISCLAIMER</h2>
This guide is still a work in progress!<br><br>
Everything is published 'as-is', no responsability taken. Some steps may be different depending on your setup, please take this as a general, inspiring, not detailed guide. I am not a programmer, just an enthusiast linux user with some (few) skills, please understand. 

<h2>BACKGROUND</h2>
As a <a href="https://www.remarkable.com">reMarkable</a> user I always wanted to get some useful apps to expand my possibilites, a spreadsheet is what I needed more as a teacher. Unfortunately, there's still no native spreadsheet app for reMarkable, except for some linux apps like SC, and I didn't want to get crazy porting it on my ARM reMarkable. But what about emulating DOS on reMarkable via BOCHS and getting back to the old good 90's? :)<br>
BOCHS is available on rM thanks to Toltec repositories, Lotus 123 was a powerful piece of software I used back in school, and I still got a license, so why not? :D

<h2>REQUIREMENTS</h2>
  <li>The reMarkable Tablet (1 or 2) and a motivated person, nerd-like guy/girl/* should be fine<br>
  <li>Basic reMarkable hacking: <a href="https://toltec-dev.org">Toltec</a> repository, oxide laucher, yaft, simple, ssh access to the thing<br>
  <li>A linux box + <a href="https://www.virtualbox.org">Virtualbox</a> and relative tools<br>
  <li>Lotus123 2.4 disk images and a valid license, if possible ;)<br>
  <li>The <a href="https://bochs.sourceforge.io/">BOCHS</a> emulator (available on Toltec repository)<br>
  <li>A minimal FreeDOS running copy on BOCHS (reMarkable side)<br>
  <li>A full FreeDOS running copy on Virtualbox<br>
  <li>I have no time to get technical enough, so you will also need: Basic linux, DOS, Virtualbox and BOCHS knowledge, or google skills.<br>
  <li>A decent amount of coffee and time to debug BOCHS laziness in seeing your imgs as drives :O
  
<h2>WHY VIRTUALBOX</h2>
Lotus 123 v.2.4 comes in 9 parts, 5.25-inch disk setup. I first tried to extract images to create a new one to run in bochs, but Lotus is a bit choosy, it will not install this way. Here's why Virtualbox, it lets you mount floppy images on the fly, BOCHS don't (or I don't know how to easily do it in a text enviroment like bash, anyway..).

<h2>FIRST STEPS</h2>
  <li>Install Virtualbox on your machine (use your favorite package manager) and run a FreeDOS 1.3 LiveCD from it. https://freedos.org/download.<br>
  <li>Install BOCHS on your reMarkable. You must have toltec repositories (instructions on how to install the repository on your remarkable at https://toltec-dev.org). Ssh into your reMarkable and type: <b>opkg install bochs</b> to get it.<br>
  <li>Download the pre-made FreeDOS image for BOCHS, it works out the box (https://sourceforge.net/projects/bochs/files/Disk%20Images/FreeDos/) we will upgrade it later.<br> <li>Scp it to your reMarkable: <b>scp fdos-10meg.tar.gz root@your-remarkable-ip:/home/root</b><br>
  <li>ssh to your reMarkable and extract your FreeDOS (<b>tar xfvz fdos-10meg.tar.gz</b>), files should be extracted into freedos-img folder, get into the folder try if it works: <b>bochs -q -unlock -f bochsrc</b><br>
  <li>Google for your Lotus123 v2.4 images, extract files on your linux box. Don't violate copyright doing this, make sure you have a license.

<h2>INSTALLING LOTUS ON VIRTUAL MACHINE</h2>
<li>Create a DOS machine on Virtualbox and a virtual drive. I suggest not an expandable one, but fixed, because when you will convert your disk into a BOCHS readable img it may be BIG.
<li>Mount the first Lotus disk on Virtualbox and start your FreeDOS virtual machine, then move to your a: drive and start the installation process <b>a: -enter- install -enter</b>, this way Lotus choosiness goes away, but it will ask you further disks, which you will mount on the fly with Virtualbox until you reach disk9 and complete the installation. Oh good old msdos times...<br><br>

Now you have a working FreeDOS machine in Virtualbox, with a Lotus copy installed upon, try if it works locally and stop your virtual machine.

<h2>CONVERTING VIRTUALBOX VDI DRIVE, AND WHY</h2>
Ok, we have choosiness in the installation process by Lotus, but also I failed several times trying to get my Lotus into BOCHS. bximage which creates BOCHS images was not a thing for me, I am too lazy to be able to write into those read only images. Other methods went into failure, I will not get into this, still hurts... So I just converted my Virtualbox VDI disk with all software and system, into an IMG file to be used into BOCHS. Then I updated my FreeDOS installation on BOCHS, because the full image can't be read by the emulator - almost in my case - don't ask me why...<br><br>

  <li>Use Virtualbox tools to convert your Virtualbox VDI disk image: <b>vboxmanage clonehd --format RAW source.vdi destination.img</b><br> where "source" is the name of your virtual hard drive on Virtualbox.
  <li>Rename your destination.img, let's assume file.img, and scp it to remarkable: <b>scp file.img root@your-remarkable-ip:/home/root</b><br>
  <li>On reMarkable, move file.img in your freedos-img folder: <b>mv file.img freedos-img</b><br>
  <li>Modify yourc bochsrc configuration file to include a new drive: <b>ata0-slave:  type=disk, path=file.img, type=flat</b><br>
  <li>Run BOCHS on reMarkable via ssh and cross your fingers. If you can access your new drive with the DOS command <b>d:</b>, you are almost done, else let me know if you had enough coffee and time to debug the issue :)<br>
  <li>Copy all the content of disk d: into disk c: and you are done. xcopy is not available on the basic FreeDOS image, so it will be a lot of fun in typing "mkdir" and "copy" until done. This is where basic DOS commands skills are needed. Anyway, on your disk image from Virtualbox you should have xcopy: don't do like me, copy it on c: first ;) <br>
  <li>Reboot your BOCHS machine and try using Lotus from ssh (suggested: run INSTALL into the Lotus folder, you will have to try different graphic settings for it to work correctly)
  
<h2>ON REMARKABLE</h2>
<li>scp to reMarkable both <b>dos.sh</b> and <b>startdos.sh</b> on /home/root.<br>
<li><b>dos.sh</b> a simple "app" for reMarkable which runs BOCHS via yaft, it uses the "simple" scripting language, if you didn't installed it in your previous geeky journeys, do it with: <b>opkg install simple</b><br>
<li><b>startdos.sh</b> a basic shell script called by dos.sh to be run under yaft.<br>
<li>Now you must register the new app to be seen by oxide launcer. In your reMarkable type <b>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</b><br>
<li>Refresh oxide apps, you should see the FreeDOS icon, by tapping it yaft comes up, and the BOCHS emulator starts your FreeDOS machine on the reMarkable.<br>
<li>Season it as you like, I made a simple 123.bat file to launch directly Lotus, or you can add a command in your AUTOEXEC.BAT to autostart it.

<h2>VERY, VERY BASIC TROUBLESHOOTING</h2>
<li>BOCHS with FreeDOS is choosy, due to limitations both of BOCHS and FreeDOS (more on the last), it may be needed to use <b>fdisk</b> into your reMarkable DOS box, to create partitions, than load back the img to Virtualbox to exchange files betweeen you and your newborn reMarkaDOS<br>
<li>FreeDOS in BOCHS doesn't eat disk images always the right way, it has to do with disk geometry, don't try to mount big images, it's DOS..<br>
<li>Once you run a full copy of FreeDOS on BOCHS you will be able to mount almost everything, cd images included... since then, you will have to struggle to make BOCHS eat your images :(<br>
<li>Be careful: if you install the WYSIWYG addon during the installation process (like I did) your Lotus won't start on reMarkable. If you did this mistake, delete all the WYSIWYG files in the Lotus folder (i didn't delete the WYSIWYG folder indeed, just the files) and delete the 123.cnf file, the startup of Lotus will be slower, but you will be able to use it without errors.<br>
<li>Graphic issues: try to f-ck around with INSTALL.EXE, try different graphic settings and you will be fine!<br><br>
gat.
