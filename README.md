I am planning to document the process of running an old (licensed) version of LOTUS123 on the reMarkable tablet, via BOCHS emulation.
<br><br>
<h2>DISCLAIMER</h2>
Still a work in progress!<br><br>
Everything is published 'as-is', no responsability taken. Some steps may be different from a box to another, please take this as a general, not precise or detailed guide.

<h2>BACKGROUND</h2>
As a reMarkable user I always wanted to get some useful apps to expand my possibilites, a spreadsheet is much needed in my teacher job. Unfortunately there is no native app for that, except for some linux apps like SC, which I don't want to get crazy to compile on my rM. But what about emulating DOS and getting back to the old good 90's software, that taught excel to be what it is now? :)<br>
So I choose Lotus123, which I used back in school, and I still got a valid license for.

<h2>REQUIREMENTS</h2>
  The reMarkable Tablet (1 or 2)<br>
  Basic reMarkable hacking (toltec repository, oxide laucher, yaft, ssh access to the thing)<br>
  A linux box + virtualbox and relative tools<br>
  Lotus123 2.4 disk images and a valid license, if possible ;)<br>
  The BOCHS emulator (available on toltec repository)<br>
  A minimal FreeDOS running copy on BOCHS<br>
  A full FreeDOS running copy on Virtualbox<br>
  Basic linux knowledge<br>
  Basic DOS commands knowledge (or google skills)<br>
  
<h2>WHY VIRTUALBOX</h2>
Lotus123 v.2.4 comes in a 9 disk setup. I first tried to extract those images to create a new one to run in bochs, but Lotus is a bit choosy, it will not install this way. Here's why Virtualbox. It lets you mount floppy images on the fly, BOCHS don't (or I don't know, anyway..).

<h2>PREPARATION</h2>
  Install Virtualbox on your machine (use your favorite package manager) and run a FreeDOS 1.3 LiveCD from it. (freedos.org)<br>
  Install BOCHS on your reMarkable. You must have toltec repositories (toltec-dev.org), just type: opkg install bochs<br>
  Download the pre-made FreeDOS image for BOCHS, it works out the box (https://sourceforge.net/projects/bochs/files/Disk%20Images/FreeDos/) you will upgrade it later.<br>
  scp it to your reMarkable (scp fdos-10meg.tar.gz root@your-remarkable-ip:/home/root)<br>
  ssh to your reMarkable and extract your FreeDOS (tar xfvz fdos-10meg.tar.gz), files goes into freedos-img folder, try if it works with BOCHS, there should be no problem..<br>
  Google for your Lotus123 v2.4 images, extract the files on your linux box. Don't violate copyright doing this, make sure you have a license.

<h2>INSTALLING LOTUS ON VIRTUAL MACHINE</h2>
Mount the first Lotus disk on Virtualbox and start your FreeDOS virtual machine, then move to your a: drive and start the installation process (a: -enter- install -enter) this way Lotus wants to install itself, but will ask you further disks, which you will mount on the fly with Virtualbox until you reach disk9.<br><br>

Now you have a working FreeDOS in Virtualbox, with Lotus installed, try if it works and stop your virtual machine.

<h2>CONVERTING VIRTUALBOX MACHINE, AND WHY</h2>
I tried several ways to get my Lotus into BOCHS, bximage which needs to create BOCHS images was not a thing, too much thing to do to be able to write into those images. Other means went into failure (I will not get into this...). So I just converted my Virtualbox VDI disk containg all software and system, into an IMG file to be used into BOCHS (and update my FreeDOS installation on BOCHS, because the full image can't be read by the emulator - almost in my case - don't ask me why...).<br><br>

  So, use the Virtualbox tools to convert your image: vboxmanage clonehd --format RAW source.vdi destination.img<br>
  Rename your destination.img, let's assume file.img, and scp it to remarkable (scp file.img root@your-remarkable-ip:/home/root)<br>
  On reMarkable, move it in your freedos-img folder (mv file.img freedos-img)<br>
  Modify yourc bochsrc file to include a new drive (ata2-slave:  type=disk, path=file.img)<br>
  Run BOCHS via ssh and cross your fingers. If you can access your new drive with d:, you are almost done.<br>
  Copy all the content of disk d: into disk c: and you are done (xcopy is not available on the basic FreeDOS image, so it will be a lot of fun in typing "mkdir" and "copy" until done.<br>
  Reboot your BOCHS machine and try using Lotus from ssh (suggested: run INSTALL into the Lotus folder, you will have to try different graphic settings for it to work correctly)
  
<h2>ON REMARKABLE</h2>
I will post the necessary files to run an app on reMarkable, which will be registered with the rot tool, and that launches your bochs emulator into yaft. From here you will run your Lotus software, and finally have a spreadsheed on your reMarkable (see photos).
<br><br>
gat.
