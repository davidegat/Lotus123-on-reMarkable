<H2>Running LOTUS 123 v4.2 spreadsheet software on the reMarkable tablet, via BOCHS emulator</h2>
See it in action on reMarkable 1: <br>https://www.dropbox.com/s/nvuqo4zncsqhizt/YouCut_20221107_222834913.mp4?dl=0
<br>https://www.dropbox.com/s/dwr0lfvecjm23te/YouCut_20221109_002503546.mp4?dl=0
<br>See it in action on reMarkable 2:<br>
https://www.dropbox.com/s/ywzghewt1q2dfax/YouCut_20221109_005323969.mp4?dl=0
<br><br>Other DOS software I managed to run on reMarkable:<br>
<li>Wordstar Professional 4:
<br>https://www.dropbox.com/s/6evvrcgn3e6s5kw/ws1.jpg?dl=0
<br>https://www.dropbox.com/s/i16kbc7x19qr9gw/ws2.jpg?dl=0
<li>DOS Edit and Ospedit (open source version of Edit):
<br>https://www.dropbox.com/s/0cnm2bjipzaq961/ospedit.jpg?dl=0
<li>MS Word 5.0:
<br>https://www.dropbox.com/s/77ww4c0ndrh4by7/word5.jpg?dl=0
<li>CAL2 - Yearly calendar
<br>https://www.dropbox.com/s/kzk4b04ag6pzkyu/cal2.jpg?dl=0
<li>QBASIC
<br>https://www.dropbox.com/s/fiz52l6jcn7o15r/qbasic.jpg?dl=0
<li>Borland 4 pro
<br>https://www.dropbox.com/s/nntw4t5zyfz2f7r/4pro.jpg?dl=0
<li>WordStar 4
<br>https://www.dropbox.com/s/732l6coajtyayiw/wordstar4.jpg?dl=0
<li>Norton Classic Editor
<br>https://www.dropbox.com/s/nlxt0xellsltc6h/nce.jpg?dl=0
<br><br>More to come...


<h2>Disclaimer</h2>
Everything is published 'as-is', no responsability taken. Some steps may be different depending on your setup, please consider this as a general, inspiring, not detailed guide. I am not a coder, just an enthusiast linux user with some (few) skills, please understand. 

<h2>Background</h2>
As a <a href="https://www.remarkable.com">reMarkable</a> user, I always wanted to get some useful apps to expand my possibilites, a spreadsheet is what I needed more as a teacher. Unfortunately, there's still no native spreadsheet app for reMarkable, except for some linux software like "SC", but didn't want to get crazy porting it on reMarkable. But, what about emulating DOS on reMarkable via BOCHS and getting back to the old good 90's? :)<br>
BOCHS is available on reMarkable thanks to Toltec repositories, Lotus 123 was a powerful piece of software I used back in school, and I still got a license, so why not? :D<br><br>
Lotus 123 has everything you can expect from a spreadsheet, like formulas and charts, it is useful both for basic and advanced use and it can compete with modern spreadsheet software easily!

<h2>Proof of concept, or a real solution?</h2>
I understand that for some users it's a proof of concept, or just not appealing. Some will not find useful to have a spreadsheet running this way. For me it has been life changing... A simple scenario: student breaks into my coffee time, test in hand. He complains about his results, and ask me to check points if it's alright. I open my reMarkable, insert test points into my pre-made spreadsheet, show him the right result in real time. No pc, no laptop, just my tablet I use everytime. Coffee is life :)<br>
<br><b>"Ok, but what about managing your spreadsheet via a tiny keyboard on reMarkable?"</b><br>
A regular calculator has smaller buttons, but no one complains :) plus, I usually connect via SSH, run Lotus, and set up some pre-made spreadsheet in a more comfortable enviroment. Data input on reMarkable, once my spreadsheet is made, is not hard to manage. reMarkable native UI for regular use can be as tricky as input numbers on the yaft (Yet Another Finger Terminal) keyboard.<br>
<br><b>"You miss some new formulas modern spreedsheet have" - "Excel is much better, just use your laptop"</b><br>
Obviously, it can't be a replacement for Excel or modern spreadsheet solutions running on a regular pc/laptop. If you do extensive use of spreadsheets for your job, how can a reMarkable (spreadsheet) can be useful? There are some situations where you just need a help for simple calculation, for me it means: test results, absence count, and other things a teacher may need, that do not require a full Excel installation, complicated formulas or top performances.<br>
<br><b>"reMarkable is made for paper people, why do you want to run a spreadsheet on it?"</b><br>
reMarkable changed my life as a teacher. It hosts all my student's books, annotated pdfs of my slides, my mental maps to use in class, class register, my timetable, meeting notes, I write on it everytime and mostly use it as real paper. I just needed a little more spreadsheety tablet, to fill the gap in some situations. Why run a whole operating system on pc, or boot my laptop with its times, when I can automate simple calculations I need on my reMarkable, which is always in my hands?<br><br>
<b>"How long did you take to get this? Is it worth it?"</b><br>
Geek/Nerd people would answer: yes, is it worth it. It took one day to get this, but nevermind, nerd nature is stronger: we can work one day, to get a daily 5 minutes time save the rest of our lives. It's all about being nerd. Are you? :)
<h2>Requirements</h2>
  <li>The reMarkable Tablet (1 or 2) and a motivated person, nerd-like guy/girl/* should be fine<br>
  <li>Basic reMarkable hacking: <a href="https://toltec-dev.org">Toltec</a> repository, oxide laucher, yaft, simple, ssh access to the thing<br>
  <li>A linux box + <a href="https://www.virtualbox.org">Virtualbox</a> and relative tools<br>
  <li>Lotus123 2.4 disk images and a valid license, if possible ;)<br>
  <li>The <a href="https://bochs.sourceforge.io/">BOCHS</a> emulator (available on Toltec repository)<br>
  <li>A minimal FreeDOS running copy on BOCHS (reMarkable side)<br>
  <li>A full FreeDOS running copy on Virtualbox<br>
  <li>I have no time to get technical enough, so you will also need: Basic linux, DOS, Virtualbox and BOCHS knowledge, or google skills.<br>
  <li>A decent amount of coffee and time to debug BOCHS laziness in seeing your imgs as drives :O
  
<h2>Why Virtualbox</h2>
Lotus 123 v.2.4 comes in 9 parts, 5.25-inch disk setup. I first tried to extract images to create a new one to run in bochs, but Lotus is a bit choosy, it will not install this way, and something like <a href="https://forum.winworldpc.com/uploads/editor/q4/vd8bs7xeckcd.png">a bad error</a> happens. Here's why Virtualbox, it lets you mount floppy images on the fly, BOCHS doesn't (or I don't know how to easily do it in a text enviroment, anyway..).

<h2>First steps</h2>
  <li>Install Virtualbox on your machine (use your favorite package manager), create a DOS machine on Virtualbox and a virtual drive. I suggest not an expandable one, but fixed, because when you will convert your disk into a BOCHS readable img it may be BIG. So, no 1gb expandable drive just to have 200mb of software in it, or you'll get a 1gb image. Choose a small size, you can expand it with bximage later on your reMarkable directly.
    <li>Mount a FreeDOS 1.3 LiveCD on Virtualbox https://freedos.org/download. Start the machine booting frome livecd, and follow the instructions to install FreeDOS on your virtual drive.<br>
      <li>Install BOCHS on your reMarkable. You must have toltec repositories (instructions on how to install the repository on your reMarkable at https://toltec-dev.org). Ssh into your reMarkable and type: <br><code>opkg install bochs</code><br> to get it.<br>
  <li>Download the pre-made FreeDOS image for BOCHS, it works out the box on your reMarkable! (https://sourceforge.net/projects/bochs/files/Disk%20Images/FreeDos/) we will upgrade it later.<br> <li>Scp it to your reMarkable: <br><code>scp fdos-10meg.tar.gz root@your-remarkable-ip:/home/root</code><br>
  <li>ssh to your reMarkable and extract your FreeDOS <br><code>tar xfvz fdos-10meg.tar.gz</code><br> files should be extracted into freedos-img folder, get into the folder try if it works: <br><code>bochs -q -unlock -f bochsrc</code><br>
  <li><b>Please note:</b> in bochsrc the option <code>display_library: term</code> is mandatory, or BOCHS won't start!
  <li>Google for your Lotus123 v2.4 images, extract files on your linux box. Don't violate copyright doing this, make sure you have a license.

<h2>Installing Lotus in Virtualbox machine</h2>

Mount the first Lotus disk on Virtualbox and start your FreeDOS virtual machine, then move to your a: drive and start the installation process <code>a: -enter- install -enter</code>, this way Lotus choosiness goes away, but it will ask you further disks, which you will mount on the fly with Virtualbox until you reach disk9 and complete the installation. Oh good old msdos times...<br>

Now you have a working FreeDOS machine in Virtualbox, with a Lotus copy installed upon, try if it works locally and stop your virtual machine.

<h2>Converting Virtualbox VDI virtual drive, and why</h2>
Ok, we have choosiness in the installation process by Lotus, but also I failed several times trying to get my Lotus into BOCHS. bximage which creates BOCHS images was not a thing for me, I am too lazy to be able to write into those read only images. Other methods went into failure, I will not get into this, still hurts... So I just converted my Virtualbox VDI disk with all software and system, into an IMG file to be used into BOCHS. Then I updated my FreeDOS installation on BOCHS, also because the full image can't be read by the emulator - almost in my case.<br><br>

  <li>Use Virtualbox tools to convert your Virtualbox VDI disk image: <br><code>vboxmanage clonehd --format RAW source.vdi destination.img</code><br> where "source" is the name of your virtual hard drive on Virtualbox.
  <li>Rename your destination.img, let's assume file.img, and scp it to remarkable:<br><code>scp file.img root@your-remarkable-ip:/home/root</code><br>
  <li>On reMarkable, move file.img in your freedos-img folder: <br><code>mv file.img freedos-img</code><br>
  <li>Modify yourc bochsrc configuration file to include a new drive: <br><code>ata0-slave:  type=disk, path=file.img, type=flat</code><br>
  <li>Run BOCHS on reMarkable via ssh and cross your fingers. If you can access your new drive with the DOS command <code>d:</code>, you are almost done, else let me know if you had enough coffee and time to debug the issue :)<br>
  <li>Copy all the content of disk d: into disk c: and you are done. xcopy is not available on the basic FreeDOS image, so it will be a lot of fun in typing "mkdir" and "copy" until done. This is where basic DOS commands skills are needed. Anyway, on your disk image from Virtualbox you should have xcopy: don't do like me, copy it on c: first ;) <br>
  <li>Reboot your BOCHS machine and try using Lotus from ssh (suggested: run INSTALL into the Lotus folder, you will have to try different graphic settings for it to work correctly)
    
<h2>What if BOCHS doesn't eat my image?</h2>
Try another way, hack into BOCHS by mounting on drive a the FreeDOS 1.3 Floppy Edition, in <b>bochsrc</b> set the boot drive with <code>boot: a</code>, reboot from a:, copy the system from a: to c: overwriting the existing FreeDOS system, stop the machine. Get back to <b>bochsrc</b> to modify again the boot order, and boot from c: once done to test it out.
You should have a better enviroment now with some drivers, and -fingers crossed- mount via bochsrc your own converted image, and even mount iso images as cdroms (see <a href="https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html">BOCHS documentation</a>). <br><br>
    <b>Other method to exchange files</b><br>
 Put your desired files into a folder, create an ISO image with <b>mkisofs</b> and mount it with BOCHS (it must be upgraded withc cdrom driver, or launched via floppy edition).
<h2>On reMarkable</h2>
<li>scp to reMarkable both <b>dos.sh</b> and <b>startdos.sh</b> on /home/root.<br>
<li><b>dos.sh</b> a simple "app" for reMarkable, it uses the "simple" scripting language, if you didn't installed it in your previous geeky journeys, do it with: <br><code>opkg install simple</code>
<li><b>startdos.sh</b> a basic shell script called by dos.sh to run your VM under yaft. I prefer this than a direct command in dos.sh, so that I can launch my VM via ssh with no need to write the whole BOCHS command.<br>
<li>Now you must register the new app to be seen by oxide launcer. In your reMarkable type <br><code>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</code><br>
<li>Refresh oxide apps on your reMarkable: you now should see the FreeDOS icon, by tapping it yaft comes up, and the BOCHS emulator starts your FreeDOS machine on the reMarkable.<br>
<li>Season it as you like, I made a simple 123.bat file to launch directly Lotus, or you can add a command in your FDAUTO.BAT to autostart it.
  
<h2>Very, very basic troubleshooting and infos</h2>
<li>BOCHS with FreeDOS is choosy, due to limitations both of BOCHS and FreeDOS (more on the last), it may be needed to use <b>fdisk</b> into your reMarkable DOS box, to create partitions, than load back the img to Virtualbox to exchange files betweeen you and your newborn reMarkaDOS. Mounting a regular ISO image should also work (See above).<br>
<li>FreeDOS in BOCHS doesn't eat disk images always the right way, it has to do with disk geometry, don't try to mount big images, it's DOS..<br>
<li>Once you run a full copy of FreeDOS on BOCHS you will be able to mount almost everything, cd images included... since then, you will have to struggle to make BOCHS eat your images :(<br>
<li>Lotus startup will be a little bit slow, depending on some BOCHS settins i found (see down). Tap two or three times -enter- and -space- and don't panic, just wait. Once run, I usually leave this in background, so tapping again the FreeDOS icon will bring it back immediatly when needed.
<li>If you arrange your startup files in dos (exclude cdrom drive -comment the "call CDROM.BAT" line-, optimize the boot process in general) BOCHS will boot -obviously- faster. 
<li>Be careful: if you install the WYSIWYG addon during the installation process (like I did) your Lotus won't start on reMarkable. If you did this mistake, delete all the WYSIWYG files in the Lotus folder (i didn't delete the WYSIWYG folder indeed, just the files). This way you will get an error (See files or attached video), just press ESC and work. If you want to bypass the error, delete also the 123.cnf file, and Lotus will start without errors, just a little bit slower.
<li>Graphic issues: try to f-ck around with INSTALL.EXE, try different graphic settings and you will be fine!
<li>I managed to attach a virtual ethernet in BOCHS, then I tried to configure BOCHS to use reMarkable dhcp server running for usb interfaces, with still no results. It is not so necessary, but it would be fine to dowload dos software directly from your reMarkaDOS with the LINKS browser  ;) let me know if you can.
<li>Some dos software require a mouse or it will not run. FreeDOS offers "cutemouse" software, but everything I tried resulted only in a mouse recognized by FreeDOS, with no results while running on the reMarkable tablet. So forget this mouse based software, and have fun with the tiny yaft keyboard :(
<li>If you set too much memory, cores or ips on your BOCHS machine, Lotus startup will be even slower (!), in my setup 512 megs even prevent BOCHS  from booting. I found out that <br><code>megs: 320</code><br><code>vga: extension=vbe, update_freq=5, realtime=1</code><br><code>cpu: count=2, ips=25000000</code><br>works just fine for me, and Lotus starts up more quickly!

<li><b>Easter egg: in Lotus 123 the 3 reMarkable buttons work, the middle one brings you to the first cell, the side buttons lets you move left and right through cells and menu. Nice, isn't it?</b>
<h2>How to stop BOCHS once launched?</h2>
<h3>Via terminal:</h3> ssh again to your reMarkable and kill BOCHS, or install tmux to have access a second shell if you run your Lotus via ssh. A simple script to get the PID and kill it right away is included in the repository.
<h3>On reMarkable:</h3> simply kill your oxide FreeDOS app the regular way (long press on icon and kill button), BOCHS will die too.<br>
Due to the command line options, BOCHS will ignore .lock files remaining when BOCHS is killed, so it can start again the next time without lock errors.<br>  
Note: you can leave it running, it will not impact on your device performance, plus, once you tap again on the FreeDOS icon the same istance will come back, without running a new one. I usually leave it open once rM starts, and use it throughout the day.
  <h2>Just to be clear</h2>
I could simply upload the BOCHS c: drive image of my full system, and let you run it without any fuss on your reMarkable, but... no? I just can't spread copyrighted software. Anyway, you can of course backup the c.img file to restore it in case of an update or else, or just to put it into another rM of your own. To backup your setup, just use scp: <code>scp "root@your-remarkable-ip:/home/root/freedos-img/*" .</code> (don't forget the last dot).<br><br>
Enjoy.<br>
Gat.
