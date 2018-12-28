From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Sat, 29 Dec 2018 00:22:18 +0900
Message-ID: <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="000000000000aeb877057e0eeb2e"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

--000000000000aeb877057e0eeb2e
Content-Type: multipart/alternative; boundary="000000000000aeb872057e0eeb2c"

--000000000000aeb872057e0eeb2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrii,

Thanks again for responding and for clarifying some of the underlying
workings of Yocto.

2018=E5=B9=B412=E6=9C=8827=E6=97=A5(=E6=9C=A8) 20:07 Andrii Anisov <andrii.=
anisov@gmail.com>:

> Hello Jairo,
>
> On 25.12.18 18:07, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
> > I believe this is the SoC information. If there is any other method of
> extracting the information, please let me know so I can transmit it.
>
> That output gives a full set of required information. Actually, I worried
> you
> might have an obsolete SoC revision. But it is not your case.
>

I am actually very relieved that this is the case.


> > I took a look at [1] and decided to start from scratch to attempt to ge=
t
> the minimum workspace functioning.
>
> I mainly mentioned point 1 from those limitations. But you have H3 ES2.0 =
so
> ready for the latest BSP as well.
>
> > In previous attempts, I had to modify some recipes to get the
> compilation working, but this time I would like to confirm with everyone
> the initial steps before I take them.
> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: QA Issue: xen:
> Files/directories were installed but not shipped in any package:
> >    /usr/lib/libxenfsimage.so
> >    /usr/lib/libxenfsimage.so.4.12
> >    /usr/lib/libxenfsimage.so.4.12.0
> >    /usr/lib/xenfsimage/ext2fs-lib/fsimage.so
> >    /usr/lib/xenfsimage/ufs/fsimage.so
> >    /usr/lib/xenfsimage/fat/fsimage.so
> >    /usr/lib/xenfsimage/iso9660/fsimage.so
> >    /usr/lib/xenfsimage/reiserfs/fsimage.so
> >    /usr/lib/xenfsimage/zfs/fsimage.so
> >    /usr/lib/xen/bin/depriv-fd-checker
> >    /usr/sbin/xenmon
> > Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install=
.
> > xen: 11 installed and not shipped files. [installed-vs-shipped]
> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Fatal QA error=
s
> found, failing task.
> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Function
> failed: do_package
> > ERROR: Logfile of failure stored in:
> /home/yocto/r-car/build/tmp/work/aarch64-poky-linux/xen/unstable+gitAUTOI=
NC+9d357cbaf7-r0/temp/log.do_package.8954
> > ERROR: Task 329
> (/home/yocto/r-car/meta-virtualization/recipes-extended/xen/xen_git.bb <
> http://xen_git.bb>, do_package) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3642 tasks of which 3641 didn't need to
> be rerun and 1 failed.
> > No currently running tasks (2517 of 3653)
> >
> > Summary: 1 task failed:
> >    /home/yocto/r-car/meta-virtualization/recipes-extended/xen/xen_git.b=
b
> <http://xen_git.bb>, do_package
> > Summary: There were 3 WARNING messages shown.
> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
>
> It's a known issue. Let's say Yocto's specifics. XEN does evolve so its
> tools
> set of libs and apps is being changed. But Yocto tracks all products of
> compilation and eager to know what to do with each of those files.
>
> > I am aware I am using a very old BSP. If there is a slightly better
> version with which to start with, I would greatly like everyone's opinion=
.
>
> It is mainly not because of BSP, but the meta-virtualization layer
> version, it
> describes how to build and install XEN. As you can see in the last patch =
to
> xen_git.bbappend [1] it is adjusted for 4.10-rc1. I suppose you already d=
id
> required changes for the current 4.12-unstable version when saying:
>
> > In previous attempts, I had to modify some recipes to get the
> compilation working
>
> Good, you have the BSP with XEN built. Could you please reveal your
> changes to
> let me know which XEN you actually built?



In order to get Xen to compile and to prepare for the boot, I modified the
meta-demo layer to include the Xen files that were not already included and
the hand modified dts file. I have attempted to attach these to the mail.

I am not sure if there is an easier way to get that information, but I
basically did a git show within the tmp/work/aarch64-poky-linux/xen folder
and got the hash 7f28661f6a7ce3d82f881b9afedfebca7f2cf116 which points to
the current head of the master branch of the xen.git repository, if I am
not mistaken.

In the previous email you said, you
> tried running freshly built BSP with XEN, and it does not show anything t=
o
> display. But what about the console output for that case?
>
>
Via serial console I get the following output for the images created after
modifying the dts and applying the patch below:

U-Boot 2015.04 (Jun 22 2018 - 13:36:27)

CPU: Renesas Electronics R8A7795 rev 2.0
Board: H3ULCB
I2C:   ready
DRAM:  3.9 GiB
MMC:   sh-sdhi: 0, sh-sdhi: 1
In:    serial
Out:   serial
Err:   serial
Net:   ravb
Hit any key to stop autoboot:  0
=3D> setenv bootargs
=3D> setenv serverip 192.168.1.100
=3D> tftp 0x48080000 xen-h3ulcb.uImage
ravb Waiting for PHY auto negotiation to complete...... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'xen-h3ulcb.uImage'.
Load address: 0x48080000
Loading: #############################################################
         171.9 KiB/s
done
Bytes transferred =3D 886160 (d8590 hex)
=3D> tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'Image-r8a7795-h3ulcb-xen-local.dtb'.
Load address: 0x48000000
Loading: #####
         11.7 KiB/s
done
Bytes transferred =3D 63810 (f942 hex)
=3D> tftp 0x7a000000 Image
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete........ done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'Image'.
Load address: 0x7a000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ############################################
         2.1 MiB/s
done
Bytes transferred =3D 15911424 (f2ca00 hex)
=3D> bootm 0x48080000 - 0x48000000
## Booting kernel from Legacy Image at 48080000 ...
   Image Name:   XEN
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    886096 Bytes =3D 865.3 KiB
   Load Address: 78080000
   Entry Point:  78080000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000048000000, end 0000000048012941

Starting kernel ...


And that is it.
Please note that although I am getting the images and dtb from tftp, the
root filesystem is on the microSD card.

I am guessing I should have seen the console output for Xen. I also am not
sure how to test if dom0 is actually running at this stage.


> >  From the log it would seem that the xen_git.bb <http://xen_git.bb> in
> the meta-virtualization layer is being called and thus the recipe is
> attempting to compile the newest version of Xen.
>
> Right you are. That is the idea. But Yocto's way of BSP compilation makes
> it
> tending to break up. You can edit XEN recipe to build it from a specific
> revision, e.g. 4.10.0-rc1. You should replace `${AUTOREV}` in this line [=
2]
> with the correspondent commit-id
> `24fb44e971a62b345c7b6ca3c03b454a1e150abe` to
> do so.
> But I suppose it is not what you really need. Since 4.10.0-rc1 there are =
a
> number of changes to scheduling. You might need have those bits up to dat=
e
> for
> your work.
>

> > So my second question would be, what version of Xen should I point
> towards for the board I am using?I guess it is better to use the latest a=
nd
> greatest for your work, so XEN 4.12 unstable should suit you.
>
>
Yes, I have been tracking some of the scheduling changes being done to Xen
and I would really like to have a relatively newer version up and running.
However, just having something, anything, running at this stage would be
great.

Also I do understand that we have our meta-demo layer quite outdated both
> from
> XEN and BSP sides. Renesas's 2.x BSPs are baked with Linux kernel 4.9.x,
> it is
> really old. Even with LK 4.14, we are using from BSP 3.9, I faced an issu=
e
> [3]
> while playing with the latest and greatest XEN.
>
> [1]
> https://github.com/xen-troops/meta-demo/commit/a4178158ca3ebb739c9bc71c51=
7ec7b65f563218
> [2]
> https://github.com/xen-troops/meta-demo/blob/master/meta-rcar-gen3-xen/re=
cipes-extended/xen/xen_git.bbappend#L9
> [3]
> https://lists.xenproject.org/archives/html/xen-devel/2018-12/msg01373.htm=
l
>
> --
> Sincerely,
> Andrii Anisov.
>

Thank you very much for all your support.

Best regards,

Jairo

--000000000000aeb872057e0eeb2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Andrii,</div><div><b=
r></div><div>Thanks again for responding and for clarifying some of the und=
erlying workings of Yocto.</div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">2018=E5=B9=B412=E6=9C=8827=E6=97=A5(=E6=9C=A8) 20:07 Andri=
i Anisov &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.anisov@gmail=
.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">He=
llo Jairo,<br>
<br>
On 25.12.18 18:07, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
&gt; I believe this is the SoC information. If there is any other method of=
 extracting the information, please let me know so I can transmit it.<br>
<br>
That output gives a full set of required information. Actually, I worried y=
ou<br>
might have an obsolete SoC revision. But it is not your case.<br></blockquo=
te><div><br></div><div>I am actually very relieved that this is the case. <=
br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I took a look at [1] and decided to start from scratch to attempt to g=
et the minimum workspace functioning.<br>
<br>
I mainly mentioned point 1 from those limitations. But you have H3 ES2.0 so=
<br>
ready for the latest BSP as well.<br>
<br>
&gt; In previous attempts, I had to modify some recipes to get the compilat=
ion working, but this time I would like to confirm with everyone the initia=
l steps before I take them.<br>
&gt; ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: QA Issue: xen=
: Files/directories were installed but not shipped in any package:<br>
&gt;=C2=A0 =C2=A0 /usr/lib/libxenfsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/libxenfsimage.so.4.12<br>
&gt;=C2=A0 =C2=A0 /usr/lib/libxenfsimage.so.4.12.0<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/ext2fs-lib/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/ufs/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/fat/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/iso9660/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/reiserfs/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xenfsimage/zfs/fsimage.so<br>
&gt;=C2=A0 =C2=A0 /usr/lib/xen/bin/depriv-fd-checker<br>
&gt;=C2=A0 =C2=A0 /usr/sbin/xenmon<br>
&gt; Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.<=
br>
&gt; xen: 11 installed and not shipped files. [installed-vs-shipped]<br>
&gt; ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Fatal QA erro=
rs found, failing task.<br>
&gt; ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Function fail=
ed: do_package<br>
&gt; ERROR: Logfile of failure stored in: /home/yocto/r-car/build/tmp/work/=
aarch64-poky-linux/xen/unstable+gitAUTOINC+9d357cbaf7-r0/temp/log.do_packag=
e.8954<br>
&gt; ERROR: Task 329 (/home/yocto/r-car/meta-virtualization/recipes-extende=
d/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xe=
n_git.bb</a> &lt;<a href=3D"http://xen_git.bb" rel=3D"noreferrer" target=3D=
"_blank">http://xen_git.bb</a>&gt;, do_package) failed with exit code &#39;=
1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 3642 tasks of which 3641 didn&#39;t nee=
d to be rerun and 1 failed.<br>
&gt; No currently running tasks (2517 of 3653)<br>
&gt; <br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0 /home/yocto/r-car/meta-virtualization/recipes-extended/xe=
n/<a href=3D"http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xen_gi=
t.bb</a> &lt;<a href=3D"http://xen_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://xen_git.bb</a>&gt;, do_package<br>
&gt; Summary: There were 3 WARNING messages shown.<br>
&gt; Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.<br>
<br>
It&#39;s a known issue. Let&#39;s say Yocto&#39;s specifics. XEN does evolv=
e so its tools<br>
set of libs and apps is being changed. But Yocto tracks all products of<br>
compilation and eager to know what to do with each of those files.<br>
<br>
&gt; I am aware I am using a very old BSP. If there is a slightly better ve=
rsion with which to start with, I would greatly like everyone&#39;s opinion=
.<br>
<br>
It is mainly not because of BSP, but the meta-virtualization layer version,=
 it<br>
describes how to build and install XEN. As you can see in the last patch to=
<br>
xen_git.bbappend [1] it is adjusted for 4.10-rc1. I suppose you already did=
<br>
required changes for the current 4.12-unstable version when saying:<br>
<br>
&gt; In previous attempts, I had to modify some recipes to get the compilat=
ion working<br>
<br>
Good, you have the BSP with XEN built. Could you please reveal your changes=
 to<br>
let me know which XEN you actually built? </blockquote><div><br><div><br></=
div><div>In order to get Xen to compile and to prepare for=20
the boot, I modified the meta-demo layer to include the Xen files that=20
were not already included and the hand modified dts file. I have=20
attempted to attach these to the mail.</div><div><br></div><div>I am not su=
re if there is an easier way to get that information, but I basically did a=
 git show within the tmp/work/aarch64-poky-linux/xen folder and got the has=
h 7f28661f6a7ce3d82f881b9afedfebca7f2cf116 which points to the current head=
 of the master branch of the xen.git repository, if I am not mistaken.</div=
><div><br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In =
the previous email you said, you<br>
tried running freshly built BSP with XEN, and it does not show anything to<=
br>
display. But what about the console output for that case?<br>
<br></blockquote><div><br></div><div>Via serial console I get the following=
 output for the images created after modifying the dts and applying the pat=
ch below:<br></div><div><br></div><div>U-Boot 2015.04 (Jun 22 2018 - 13:36:=
27)<br><br>CPU: Renesas Electronics R8A7795 rev 2.0<br>Board: H3ULCB<br>I2C=
:=C2=A0=C2=A0 ready<br>DRAM:=C2=A0 3.9 GiB<br>MMC:=C2=A0=C2=A0 sh-sdhi: 0, =
sh-sdhi: 1<br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Er=
r:=C2=A0=C2=A0 serial<br>Net:=C2=A0=C2=A0 ravb<br>Hit any key to stop autob=
oot:=C2=A0 0 <br>=3D&gt; setenv bootargs<br>=3D&gt; setenv serverip 192.168=
.1.100<br>=3D&gt; tftp 0x48080000 xen-h3ulcb.uImage<br>ravb Waiting for PHY=
 auto negotiation to complete...... done<br>ravb: 1000Base/Full<br>Using ra=
vb device<br>TFTP from server 192.168.1.100; our IP address is 192.168.1.40=
<br>Filename &#39;xen-h3ulcb.uImage&#39;.<br>Load address: 0x48080000<br>Lo=
ading: #############################################################<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 171.9 KiB/s<br>done<br>Bytes =
transferred =3D 886160 (d8590 hex)<br>=3D&gt; tftp 0x48000000 Image-r8a7795=
-h3ulcb-xen-local.dtb<br>ravb:0 is connected to ravb.=C2=A0 Reconnecting to=
 ravb<br>ravb Waiting for PHY auto negotiation to complete... done<br>ravb:=
 1000Base/Full<br>Using ravb device<br>TFTP from server 192.168.1.100; our =
IP address is 192.168.1.40<br>Filename &#39;Image-r8a7795-h3ulcb-xen-local.=
dtb&#39;.<br>Load address: 0x48000000<br>Loading: #####<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.7 KiB/s<br>done<br>Bytes transferred =
=3D 63810 (f942 hex)<br>=3D&gt; tftp 0x7a000000 Image<br>ravb:0 is connecte=
d to ravb.=C2=A0 Reconnecting to ravb<br>ravb Waiting for PHY auto negotiat=
ion to complete........ done<br>ravb: 1000Base/Full<br>Using ravb device<br=
>TFTP from server 192.168.1.100; our IP address is 192.168.1.40<br>Filename=
 &#39;Image&#39;.<br>Load address: 0x7a000000<br>Loading: #################=
################################################<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############################################=
##################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ####=
#############################################################<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###################################=
##############################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 #################################################################=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ######################=
###########################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #####################################################=
############<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ##########=
#######################################################<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #########################################=
########################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 #################################################################<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ##########################=
#######################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ########################################################=
#########<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #############=
####################################################<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ############################################=
#####################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
################################################################<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################################=
#################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ############################################<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.1 MiB/s<br>done<br>Bytes transferred=
 =3D 15911424 (f2ca00 hex)<br>=3D&gt; bootm 0x48080000 - 0x48000000<br>## B=
ooting kernel from Legacy Image at 48080000 ...<br>=C2=A0=C2=A0 Image Name:=
=C2=A0=C2=A0 XEN<br>=C2=A0=C2=A0 Image Type:=C2=A0=C2=A0 AArch64 Linux Kern=
el Image (uncompressed)<br>=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 886096=
 Bytes =3D 865.3 KiB<br>=C2=A0=C2=A0 Load Address: 78080000<br>=C2=A0=C2=A0=
 Entry Point:=C2=A0 78080000<br>=C2=A0=C2=A0 Verifying Checksum ... OK<br>#=
# Flattened Device Tree blob at 48000000<br>=C2=A0=C2=A0 Booting using the =
fdt blob at 0x48000000<br>=C2=A0=C2=A0 Loading Kernel Image ... OK<br>=C2=
=A0=C2=A0 Using Device Tree in place at 0000000048000000, end 0000000048012=
941<br><br>Starting kernel ...<br></div><div><br></div><div><br></div><div>=
And that is it. <br></div><div>Please note that although I am getting the i=
mages and dtb from tftp, the root filesystem is on the microSD card.</div><=
div><br></div><div>I am guessing I should have seen the console output for =
Xen. I also am not sure how to test if dom0 is actually running at this sta=
ge.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;=C2=A0 From the log it would seem that the <a href=3D"http://xen_git.bb=
" rel=3D"noreferrer" target=3D"_blank">xen_git.bb</a> &lt;<a href=3D"http:/=
/xen_git.bb" rel=3D"noreferrer" target=3D"_blank">http://xen_git.bb</a>&gt;=
 in the meta-virtualization layer is being called and thus the recipe is at=
tempting to compile the newest version of Xen.<br>
<br>
Right you are. That is the idea. But Yocto&#39;s way of BSP compilation mak=
es it<br>
tending to break up. You can edit XEN recipe to build it from a specific<br=
>
revision, e.g. 4.10.0-rc1. You should replace `${AUTOREV}` in this line [2]=
<br>
with the correspondent commit-id `24fb44e971a62b345c7b6ca3c03b454a1e150abe`=
 to<br>
do so.<br>
But I suppose it is not what you really need. Since 4.10.0-rc1 there are a<=
br>
number of changes to scheduling. You might need have those bits up to date =
for<br>
your work.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; So my second question would be, what version of Xen should I point tow=
ards for the board I am using?I guess it is better to use the latest and gr=
eatest for your work, so XEN 4.12 unstable should suit you.<br>
<br></blockquote><div><br></div><div>Yes, I have been tracking some of the =
scheduling changes being done to=20
Xen and I would really like to have a relatively newer version up and=20
running. However, just having something, anything, running at this stage
 would be great.</div><div> <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Also I do understand that we have our meta-demo layer quite outdated both f=
rom<br>
XEN and BSP sides. Renesas&#39;s 2.x BSPs are baked with Linux kernel 4.9.x=
, it is<br>
really old. Even with LK 4.14, we are using from BSP 3.9, I faced an issue =
[3]<br>
while playing with the latest and greatest XEN.<br>
<br>
[1] <a href=3D"https://github.com/xen-troops/meta-demo/commit/a4178158ca3eb=
b739c9bc71c517ec7b65f563218" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xen-troops/meta-demo/commit/a4178158ca3ebb739c9bc71c517ec7b65f563=
218</a><br>
[2] <a href=3D"https://github.com/xen-troops/meta-demo/blob/master/meta-rca=
r-gen3-xen/recipes-extended/xen/xen_git.bbappend#L9" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/xen-troops/meta-demo/blob/master/meta-rca=
r-gen3-xen/recipes-extended/xen/xen_git.bbappend#L9</a><br>
[3] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-12=
/msg01373.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproje=
ct.org/archives/html/xen-devel/2018-12/msg01373.html</a><br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br></blockquote><div><br></div><div>Thank you very much for =
all your support.<br></div><div><br></div><div>Best regards,</div><div><br>=
</div><div>Jairo<br></div></div></div></div></div></div></div>

--000000000000aeb872057e0eeb2c--

--000000000000aeb877057e0eeb2e
Content-Type: application/octet-stream; name="r8a7795-h3ulcb-xen-local.dts"
Content-Disposition: attachment; filename="r8a7795-h3ulcb-xen-local.dts"
Content-Transfer-Encoding: base64
Content-ID: <f_jq85l0fz0>
X-Attachment-Id: f_jq85l0fz0

LyoKICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgSDNVTENCIChSLUNhciBTdGFydGVyIEtp
dCBQcmVtaWVyKSBib2FyZAogKgogKiBDb3B5cmlnaHQgKEMpIDIwMTYtMjAxNyBSZW5lc2FzIEVs
ZWN0cm9uaWNzIENvcnAuCiAqIENvcHlyaWdodCAoQykgMjAxNi0yMDE3IENvZ2VudCBFbWJlZGRl
ZCwgSW5jLgogKgogKiBUaGlzIGZpbGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQogKiB2ZXJzaW9uIDIuICBUaGlzIHByb2dyYW0g
aXMgbGljZW5zZWQgImFzIGlzIiB3aXRob3V0IGFueSB3YXJyYW50eSBvZiBhbnkKICoga2luZCwg
d2hldGhlciBleHByZXNzIG9yIGltcGxpZWQuCiAqLwoKL2R0cy12MS87CiNpbmNsdWRlICJyOGE3
Nzk1LmR0c2kiCiNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+CgovIHsKCW1vZGVsID0gIlJlbmVzYXMgSDNVTENCIGJv
YXJkIGJhc2VkIG9uIHI4YTc3OTUiOwoJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGgzdWxjYiIsICJy
ZW5lc2FzLHI4YTc3OTUiOwoKCWFsaWFzZXMgewoJCXNlcmlhbDAgPSAmc2NpZjI7CgkJZXRoZXJu
ZXQwID0gJmF2YjsKCX07CgogICAgICAgIGNob3NlbiB7CgkJc3Rkb3V0LXBhdGggPSAic2VyaWFs
MDoxMTUyMDBuOCI7CgkJeGVuLHhlbi1ib290YXJncyA9ICJkb20wX21lbT03NTJNIGNvbnNvbGU9
ZHR1YXJ0IGR0dWFydD1zZXJpYWwwIGRvbTBfbWF4X3ZjcHVzPTQiOwoJCXhlbixkb20wLWJvb3Rh
cmdzID0gImNvbnNvbGU9aHZjMCBjbGtfaWdub3JlX3VudXNlZCByb290PS9kZXYvbW1jYmxrMXAy
IHJ3IHJvb3R3YWl0IGlnbm9yZV9sb2dsZXZlbCBjbWE9MTI4TSI7CgoJCSNhZGRyZXNzLWNlbGxz
ID0gPDI+OwoJCSNzaXplLWNlbGxzID0gPDI+OwoJCW1vZHVsZXMgewoJCQltb2R1bGVAMCB7CgkJ
CQljb21wYXRpYmxlID0gInhlbixsaW51eC16aW1hZ2UiLCAieGVuLG11bHRpYm9vdC1tb2R1bGUi
OwoJCQkJcmVnID0gPDB4MCAweDdhMDAwMDAwIDB4MCAweDAyMDAwMDAwPjsKCQkJfTsKCQl9OwoJ
fTsKCgltZW1vcnlANDgwMDAwMDAgewoJCWRldmljZV90eXBlID0gIm1lbW9yeSI7CgkJLyogZmly
c3QgMTI4TUIgaXMgcmVzZXJ2ZWQgZm9yIHNlY3VyZSBhcmVhLiAqLwoJCXJlZyA9IDwweDAgMHg0
ODAwMDAwMCAweDAgMHgzODAwMDAwMD47Cgl9OwoKCW1lbW9yeUA1MDAwMDAwMDAgewoJCWRldmlj
ZV90eXBlID0gIm1lbW9yeSI7CgkJcmVnID0gPDB4NSAweDAwMDAwMDAwIDB4MCAweDQwMDAwMDAw
PjsKCX07CgoJbWVtb3J5QDYwMDAwMDAwMCB7CgkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKCQly
ZWcgPSA8MHg2IDB4MDAwMDAwMDAgMHgwIDB4NDAwMDAwMDA+OwoJfTsKCgltZW1vcnlANzAwMDAw
MDAwIHsKCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwoJCXJlZyA9IDwweDcgMHgwMDAwMDAwMCAw
eDAgMHg0MDAwMDAwMD47Cgl9OwoKCXJlc2VydmVkLW1lbW9yeSB7CgkJI2FkZHJlc3MtY2VsbHMg
PSA8Mj47CgkJI3NpemUtY2VsbHMgPSA8Mj47CgkJcmFuZ2VzOwoKCQkvKiBkZXZpY2Ugc3BlY2lm
aWMgcmVnaW9uIGZvciBMb3NzeSBEZWNvbXByZXNzaW9uICovCgkJbG9zc3lfZGVjb21wcmVzczog
bGludXgsbG9zc3lfZGVjb21wcmVzcyB7CgkJCW5vLW1hcDsKCQkJcmVnID0gPDB4MDAwMDAwMDAg
MHg1NDAwMDAwMCAweDAgMHgwMzAwMDAwMD47CgkJfTsKCgkJLyogZ2xvYmFsIGF1dG9jb25maWd1
cmVkIHJlZ2lvbiBmb3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAqLwoJCWxpbnV4LGNtYSB7CgkJ
CWNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKCQkJcmV1c2FibGU7CgkJCXJlZyA9IDww
eDAwMDAwMDAwIDB4NTgwMDAwMDAgMHgwIDB4MTgwMDAwMDA+OwoJCQlsaW51eCxjbWEtZGVmYXVs
dDsKCQl9OwoKCQkvKiBkZXZpY2Ugc3BlY2lmaWMgcmVnaW9uIGZvciBjb250aWd1b3VzIGFsbG9j
YXRpb25zICovCgkJbW1wX3Jlc2VydmVkOiBsaW51eCxtdWx0aW1lZGlhIHsKCQkJY29tcGF0aWJs
ZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwoJCQlyZXVzYWJsZTsKCQkJcmVnID0gPDB4MDAwMDAwMDAg
MHg3MDAwMDAwMCAweDAgMHgxMDAwMDAwMD47CgkJfTsKCX07CgoJbGVkcyB7CgkJY29tcGF0aWJs
ZSA9ICJncGlvLWxlZHMiOwoKCQlsZWQ1IHsKCQkJZ3Bpb3MgPSA8JmdwaW82IDEyIEdQSU9fQUNU
SVZFX0hJR0g+OwoJCX07CgkJbGVkNiB7CgkJCWdwaW9zID0gPCZncGlvNiAxMyBHUElPX0FDVElW
RV9ISUdIPjsKCQl9OwoJfTsKCglrZXlib2FyZCB7CgkJY29tcGF0aWJsZSA9ICJncGlvLWtleXMi
OwoKCQlrZXktMSB7CgkJCWxpbnV4LGNvZGUgPSA8S0VZXzE+OwoJCQlsYWJlbCA9ICJTVzMiOwoJ
CQl3YWtldXAtc291cmNlOwoJCQlkZWJvdW5jZS1pbnRlcnZhbCA9IDwyMD47CgkJCWdwaW9zID0g
PCZncGlvNiAxMSBHUElPX0FDVElWRV9MT1c+OwoJCX07Cgl9OwoKCW1tbmdyIHsKCQljb21wYXRp
YmxlID0gInJlbmVzYXMsbW1uZ3IiOwoJCW1lbW9yeS1yZWdpb24gPSA8Jm1tcF9yZXNlcnZlZD4s
IDwmbG9zc3lfZGVjb21wcmVzcz47Cgl9OwoKCW1tbmdyYnVmIHsKCQljb21wYXRpYmxlID0gInJl
bmVzYXMsbW1uZ3JidWYiOwoJfTsKCglhdmItbWNoIHsKCQljb21wYXRpYmxlID0gInJlbmVzYXMs
YXZiLW1jaC1nZW4zIjsKCQlyZWcgPQk8MCAweGVjNWEwMTAwIDAgMHgxMDA+OyAgLyogQURHX0FW
QiAqLwoJCXJlZy1uYW1lID0gImFkZ19hdmIiOwoKCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDky
Mj47CgkJY2xvY2stbmFtZXMgPSAiYWRnIjsKCX07CgoJeDEyX2NsazogeDEyIHsKCQljb21wYXRp
YmxlID0gImZpeGVkLWNsb2NrIjsKCQkjY2xvY2stY2VsbHMgPSA8MD47CgkJY2xvY2stZnJlcXVl
bmN5ID0gPDI0NTc2MDAwPjsKCX07CgoJcmVnXzFwOHY6IHJlZ3VsYXRvcjAgewoJCWNvbXBhdGli
bGUgPSAicmVndWxhdG9yLWZpeGVkIjsKCQlyZWd1bGF0b3ItbmFtZSA9ICJmaXhlZC0xLjhWIjsK
CQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQlyZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDwxODAwMDAwPjsKCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQlyZWd1bGF0b3ItYWx3
YXlzLW9uOwoJfTsKCglyZWdfM3AzdjogcmVndWxhdG9yMSB7CgkJY29tcGF0aWJsZSA9ICJyZWd1
bGF0b3ItZml4ZWQiOwoJCXJlZ3VsYXRvci1uYW1lID0gImZpeGVkLTMuM1YiOwoJCXJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0g
PDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1ib290LW9uOwoJCXJlZ3VsYXRvci1hbHdheXMtb247Cgl9
OwoKCXZjY19zZGhpMDogcmVndWxhdG9yLXZjYy1zZGhpMCB7CgkJY29tcGF0aWJsZSA9ICJyZWd1
bGF0b3ItZml4ZWQiOwoKCQlyZWd1bGF0b3ItbmFtZSA9ICJTREhJMCBWY2MiOwoJCXJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0g
PDMzMDAwMDA+OwoKCQlncGlvID0gPCZncGlvNSAyIEdQSU9fQUNUSVZFX0hJR0g+OwoJCWVuYWJs
ZS1hY3RpdmUtaGlnaDsKCX07CgoJdmNjcV9zZGhpMDogcmVndWxhdG9yLXZjY3Etc2RoaTAgewoJ
CWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWdwaW8iOwoKCQlyZWd1bGF0b3ItbmFtZSA9ICJTREhJ
MCBWY2NRIjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQlyZWd1bGF0
b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCgkJZ3Bpb3MgPSA8JmdwaW81IDEgR1BJT19B
Q1RJVkVfSElHSD47CgkJZ3Bpb3Mtc3RhdGVzID0gPDE+OwoJCXN0YXRlcyA9IDwzMzAwMDAwIDEK
CQkJICAxODAwMDAwIDA+OwoJfTsKCglhdWRpb19jbGtvdXQ6IGF1ZGlvLWNsa291dCB7CgkJLyoK
CQkgKiBUaGlzIGlzIHNhbWUgYXMgPCZyY2FyX3NvdW5kIDA+CgkJICogYnV0IG5lZWRlZCB0byBh
dm9pZCBjczIwMDAvcmNhcl9zb3VuZCBwcm9iZSBkZWFkLWxvY2sKCQkgKi8KCQljb21wYXRpYmxl
ID0gImZpeGVkLWNsb2NrIjsKCQkjY2xvY2stY2VsbHMgPSA8MD47CgkJY2xvY2stZnJlcXVlbmN5
ID0gPDExMjg5NjAwPjsKCX07CgoJcnNuZF9hazQ2MTM6IHNvdW5kIHsKCQljb21wYXRpYmxlID0g
InNpbXBsZS1hdWRpby1jYXJkIjsKCgkJc2ltcGxlLWF1ZGlvLWNhcmQsZm9ybWF0ID0gImxlZnRf
aiI7CgkJc2ltcGxlLWF1ZGlvLWNhcmQsYml0Y2xvY2stbWFzdGVyID0gPCZzbmRjcHU+OwoJCXNp
bXBsZS1hdWRpby1jYXJkLGZyYW1lLW1hc3RlciA9IDwmc25kY3B1PjsKCgkJc25kY3B1OiBzaW1w
bGUtYXVkaW8tY2FyZCxjcHUgewoJCQlzb3VuZC1kYWkgPSA8JnJjYXJfc291bmQ+OwoJCX07CgoJ
CXNuZGNvZGVjOiBzaW1wbGUtYXVkaW8tY2FyZCxjb2RlYyB7CgkJCXNvdW5kLWRhaSA9IDwmYWs0
NjEzPjsKCQl9OwoJfTsKCgl2c3BtX2lmIHsKCQljb21wYXRpYmxlID0gInJlbmVzYXMsdnNwbV9p
ZiI7Cgl9OwoKCWhkbWkwLW91dCB7CgkJY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7CgkJ
dHlwZSA9ICJhIjsKCgkJcG9ydCB7CgkJCWhkbWkwX2NvbjogZW5kcG9pbnQgewoJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZyY2FyX2R3X2hkbWkwX291dD47CgkJCX07CgkJfTsKCX07Cn07CgomZHVf
ZG90Y2xraW4wIHsKCWNsb2NrLWZyZXF1ZW5jeSA9IDwxNDg1MDAwMDA+Owp9OwoKJmR1X2RvdGNs
a2luMSB7CgljbG9jay1mcmVxdWVuY3kgPSA8MzMwMDAwMDA+Owp9OwoKJmR1X2RvdGNsa2luMiB7
CgljbG9jay1mcmVxdWVuY3kgPSA8MzMwMDAwMDA+Owp9OwoKJmR1X2RvdGNsa2luMyB7CgljbG9j
ay1mcmVxdWVuY3kgPSA8MTA4MDAwMDAwPjsKfTsKCiZhNTdfMCB7CgljcHUtc3VwcGx5ID0gPCZ2
ZGRfZHZmcz47Cn07CgomZHUgewoJc3RhdHVzID0gIm9rYXkiOwoKCXBvcnRzIHsKCQlwb3J0QDEg
ewoJCQllbmRwb2ludCB7CgkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnJjYXJfZHdfaGRtaTBfaW4+
OwoJCQl9OwoJCX07Cgl9Owp9OwoKJmhkbWkwIHsKCXN0YXR1cyA9ICJva2F5IjsKCglwb3J0cyB7
CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJcG9ydEAwIHsK
CQkJcmVnID0gPDA+OwoJCQlyY2FyX2R3X2hkbWkwX2luOiBlbmRwb2ludCB7CgkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmR1X291dF9oZG1pMD47CgkJCX07CgkJfTsKCQlwb3J0QDEgewoJCQlyZWcg
PSA8MT47CgkJCXJjYXJfZHdfaGRtaTBfb3V0OiBlbmRwb2ludCB7CgkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JmhkbWkwX2Nvbj47CgkJCX07CgkJfTsKCX07Cn07CgomZXh0YWxfY2xrIHsKCWNsb2Nr
LWZyZXF1ZW5jeSA9IDwxNjY2NjY2Nj47Cn07CgomZXh0YWxyX2NsayB7CgljbG9jay1mcmVxdWVu
Y3kgPSA8MzI3Njg+Owp9OwoKJnBmYyB7CglwaW5jdHJsLTAgPSA8JnNjaWZfY2xrX3BpbnM+OwoJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCglzY2lmMl9waW5zOiBzY2lmMiB7CgkJZ3JvdXBz
ID0gInNjaWYyX2RhdGFfYSI7CgkJZnVuY3Rpb24gPSAic2NpZjIiOwoJfTsKCglzY2lmX2Nsa19w
aW5zOiBzY2lmX2NsayB7CgkJZ3JvdXBzID0gInNjaWZfY2xrX2EiOwoJCWZ1bmN0aW9uID0gInNj
aWZfY2xrIjsKCX07CgoJaTJjMl9waW5zOiBpMmMyIHsKCQlncm91cHMgPSAiaTJjMl9hIjsKCQlm
dW5jdGlvbiA9ICJpMmMyIjsKCX07CgoJYXZiX3BpbnM6IGF2YiB7CgkJZ3JvdXBzID0gImF2Yl9t
ZGMiOwoJCWZ1bmN0aW9uID0gImF2YiI7Cgl9OwoKCXNkaGkwX3BpbnM6IHNkMCB7CgkJZ3JvdXBz
ID0gInNkaGkwX2RhdGE0IiwgInNkaGkwX2N0cmwiOwoJCWZ1bmN0aW9uID0gInNkaGkwIjsKCQlw
b3dlci1zb3VyY2UgPSA8MzMwMD47Cgl9OwoKCXNkaGkwX3BpbnNfdWhzOiBzZDBfdWhzIHsKCQln
cm91cHMgPSAic2RoaTBfZGF0YTQiLCAic2RoaTBfY3RybCI7CgkJZnVuY3Rpb24gPSAic2RoaTAi
OwoJCXBvd2VyLXNvdXJjZSA9IDwxODAwPjsKCX07CgoJc2RoaTJfcGluczogc2QyIHsKCQlncm91
cHMgPSAic2RoaTJfZGF0YTgiLCAic2RoaTJfY3RybCIsICJzZGhpMl9kcyI7CgkJZnVuY3Rpb24g
PSAic2RoaTIiOwoJCXBvd2VyLXNvdXJjZSA9IDwzMzAwPjsKCX07CgoJc2RoaTJfcGluc191aHM6
IHNkMl91aHMgewoJCWdyb3VwcyA9ICJzZGhpMl9kYXRhOCIsICJzZGhpMl9jdHJsIiwgInNkaGky
X2RzIjsKCQlmdW5jdGlvbiA9ICJzZGhpMiI7CgkJcG93ZXItc291cmNlID0gPDE4MDA+OwoJfTsK
Cgltc2lvZjFfcGluczogc3BpMiB7CgkJZ3JvdXBzID0gIm1zaW9mMV9jbGtfYSIsICJtc2lvZjFf
c3luY19hIiwKCQkJCSJtc2lvZjFfcnhkX2EiLCAgIm1zaW9mMV90eGRfYSI7CgkJZnVuY3Rpb24g
PSAibXNpb2YxIjsKCX07CgoJc291bmRfcGluczogc291bmQgewoJCWdyb3VwcyA9ICJzc2kwMTIz
OV9jdHJsIiwgInNzaTBfZGF0YSIsICJzc2kxX2RhdGFfYSI7CgkJZnVuY3Rpb24gPSAic3NpIjsK
CX07CgoJc291bmRfY2xrX3BpbnM6IHNvdW5kLWNsayB7CgkJZ3JvdXBzID0gImF1ZGlvX2Nsa19h
X2EiLCAiYXVkaW9fY2xrX2JfYSIsICJhdWRpb19jbGtfY19hIiwKCQkJICJhdWRpb19jbGtvdXRf
YSIsICJhdWRpb19jbGtvdXQzX2EiOwoJCWZ1bmN0aW9uID0gImF1ZGlvX2NsayI7Cgl9OwoKCXVz
YjFfcGluczogdXNiMSB7CgkJZ3JvdXBzID0gInVzYjEiOwoJCWZ1bmN0aW9uID0gInVzYjEiOwoJ
fTsKfTsKCiZzY2lmMiB7CglwaW5jdHJsLTAgPSA8JnNjaWYyX3BpbnM+OwoJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKCglzdGF0dXMgPSAib2theSI7Cn07Cgomc2NpZl9jbGsgewoJY2xvY2st
ZnJlcXVlbmN5ID0gPDE0NzQ1NjAwPjsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmMyIHsKCXBp
bmN0cmwtMCA9IDwmaTJjMl9waW5zPjsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgoJc3Rh
dHVzID0gIm9rYXkiOwoKCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OwoKCWFrNDYxMzogY29k
ZWNAMTAgewoJCWNvbXBhdGlibGUgPSAiYXNhaGkta2FzZWksYWs0NjEzIjsKCQkjc291bmQtZGFp
LWNlbGxzID0gPDA+OwoJCXJlZyA9IDwweDEwPjsKCQljbG9ja3MgPSA8JnJjYXJfc291bmQgMz47
CgoJCWFzYWhpLWthc2VpLGluMS1zaW5nbGUtZW5kOwoJCWFzYWhpLWthc2VpLGluMi1zaW5nbGUt
ZW5kOwoJCWFzYWhpLWthc2VpLG91dDEtc2luZ2xlLWVuZDsKCQlhc2FoaS1rYXNlaSxvdXQyLXNp
bmdsZS1lbmQ7CgkJYXNhaGkta2FzZWksb3V0My1zaW5nbGUtZW5kOwoJCWFzYWhpLWthc2VpLG91
dDQtc2luZ2xlLWVuZDsKCQlhc2FoaS1rYXNlaSxvdXQ1LXNpbmdsZS1lbmQ7CgkJYXNhaGkta2Fz
ZWksb3V0Ni1zaW5nbGUtZW5kOwoJfTsKCgljczIwMDA6IGNsay1tdWx0aXBsaWVyQDRmIHsKCQkj
Y2xvY2stY2VsbHMgPSA8MD47CgkJY29tcGF0aWJsZSA9ICJjaXJydXMsY3MyMDAwLWNwIjsKCQly
ZWcgPSA8MHg0Zj47CgkJY2xvY2tzID0gPCZhdWRpb19jbGtvdXQ+LCA8JngxMl9jbGs+OwoJCWNs
b2NrLW5hbWVzID0gImNsa19pbiIsICJyZWZfY2xrIjsKCgkJYXNzaWduZWQtY2xvY2tzID0gPCZj
czIwMDA+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0NTc2MDAwPjsgLyogMS8xIGRpdmlk
ZSAqLwoJfTsKfTsKCiZpMmM0IHsKCXN0YXR1cyA9ICJva2F5IjsKCgljbG9jay1mcmVxdWVuY3kg
PSA8NDAwMDAwPjsKfTsKCiZyY2FyX3NvdW5kIHsKCXBpbmN0cmwtMCA9IDwmc291bmRfcGlucyAm
c291bmRfY2xrX3BpbnM+OwoJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCgkvKiBTaW5nbGUg
REFJICovCgkjc291bmQtZGFpLWNlbGxzID0gPDA+OwoKCS8qIGF1ZGlvX2Nsa291dDAvMS8yLzMg
Ki8KCSNjbG9jay1jZWxscyA9IDwxPjsKCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjI4ODAwMCAxMTI4
OTYwMD47CgljbGtvdXQtbHItc3luY2hyb25vdXM7CgoJc3RhdHVzID0gIm9rYXkiOwoKCS8qIHVw
ZGF0ZSA8YXVkaW9fY2xrX2I+IHRvIDxjczIwMDA+ICovCgljbG9ja3MgPSA8JmNwZyBDUEdfTU9E
IDEwMDU+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMDY+LCA8JmNwZyBDUEdfTU9EIDEwMDc+LAoJCSA8
JmNwZyBDUEdfTU9EIDEwMDg+LCA8JmNwZyBDUEdfTU9EIDEwMDk+LAoJCSA8JmNwZyBDUEdfTU9E
IDEwMTA+LCA8JmNwZyBDUEdfTU9EIDEwMTE+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMTI+LCA8JmNw
ZyBDUEdfTU9EIDEwMTM+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMTQ+LCA8JmNwZyBDUEdfTU9EIDEw
MTU+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMjI+LCA8JmNwZyBDUEdfTU9EIDEwMjM+LAoJCSA8JmNw
ZyBDUEdfTU9EIDEwMjQ+LCA8JmNwZyBDUEdfTU9EIDEwMjU+LAoJCSA8JmNwZyBDUEdfTU9EIDEw
MjY+LCA8JmNwZyBDUEdfTU9EIDEwMjc+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMjg+LCA8JmNwZyBD
UEdfTU9EIDEwMjk+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMzA+LCA8JmNwZyBDUEdfTU9EIDEwMzE+
LAoJCSA8JmNwZyBDUEdfTU9EIDEwMjA+LCA8JmNwZyBDUEdfTU9EIDEwMjE+LAoJCSA8JmNwZyBD
UEdfTU9EIDEwMjA+LCA8JmNwZyBDUEdfTU9EIDEwMjE+LAoJCSA8JmNwZyBDUEdfTU9EIDEwMTk+
LCA8JmNwZyBDUEdfTU9EIDEwMTg+LAoJCSA8JmF1ZGlvX2Nsa19hPiwgPCZjczIwMDA+LAoJCSA8
JmF1ZGlvX2Nsa19jPiwKCQkgPCZjcGcgQ1BHX0NPUkUgUjhBNzc5NV9DTEtfUzBEND47CgoJcmNh
cl9zb3VuZCxkYWkgewoJCWRhaTAgewoJCQlwbGF5YmFjayA9IDwmc3NpMCAmc3JjMCAmZHZjMD47
CgkJCWNhcHR1cmUgID0gPCZzc2kxICZzcmMxICZkdmMxPjsKCQl9OwoJfTsKfTsKCiZzZGhpMCB7
CglwaW5jdHJsLTAgPSA8JnNkaGkwX3BpbnM+OwoJcGluY3RybC0xID0gPCZzZGhpMF9waW5zX3Vo
cz47CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic3RhdGVfdWhzIjsKCgl2bW1jLXN1cHBs
eSA9IDwmdmNjX3NkaGkwPjsKCXZxbW1jLXN1cHBseSA9IDwmdmNjcV9zZGhpMD47CgljZC1ncGlv
cyA9IDwmZ3BpbzMgMTIgR1BJT19BQ1RJVkVfTE9XPjsKCWJ1cy13aWR0aCA9IDw0PjsKCXNkLXVo
cy1zZHI1MDsKCXNkLXVocy1zZHIxMDQ7CglzdGF0dXMgPSAib2theSI7Cn07Cgomc2RoaTIgewoJ
LyogdXNlZCBmb3Igb24tYm9hcmQgOGJpdCBlTU1DICovCglwaW5jdHJsLTAgPSA8JnNkaGkyX3Bp
bnM+OwoJcGluY3RybC0xID0gPCZzZGhpMl9waW5zX3Vocz47CglwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiLCAic3RhdGVfdWhzIjsKCgl2bW1jLXN1cHBseSA9IDwmcmVnXzNwM3Y+OwoJdnFtbWMt
c3VwcGx5ID0gPCZyZWdfMXA4dj47CgltbWMtaHMyMDAtMV84djsKCW1tYy1oczQwMC0xXzh2OwoJ
YnVzLXdpZHRoID0gPDg+OwoJbm9uLXJlbW92YWJsZTsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZz
c2kxIHsKCXNoYXJlZC1waW47Cn07Cgomd2R0MCB7Cgl0aW1lb3V0LXNlYyA9IDw2MD47CglzdGF0
dXMgPSAib2theSI7Cn07CgomYXVkaW9fY2xrX2EgewoJY2xvY2stZnJlcXVlbmN5ID0gPDIyNTc5
MjAwPjsKfTsKCiZpMmNfZHZmcyB7CglzdGF0dXMgPSAib2theSI7CgljbG9jay1mcmVxdWVuY3kg
PSA8NDAwMDAwPjsKCgl2ZGRfZHZmczogcmVndWxhdG9yQDMwIHsKCQljb21wYXRpYmxlID0gInJv
aG0sYmQ5NTcxbXd2IjsKCQlyZWcgPSA8MHgzMD47CgoJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0
ID0gPDc1MDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTAzMDAwMD47CgkJcmVn
dWxhdG9yLWJvb3Qtb247CgkJcmVndWxhdG9yLWFsd2F5cy1vbjsKCX07Cn07CgomYXZiIHsKCXBp
bmN0cmwtMCA9IDwmYXZiX3BpbnM+OwoJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCXJlbmVz
YXMsbm8tZXRoZXItbGluazsKCXBoeS1oYW5kbGUgPSA8JnBoeTA+OwoJc3RhdHVzID0gIm9rYXki
OwoJcGh5LWdwaW9zID0gPCZncGlvMiAxMSBHUElPX0FDVElWRV9MT1c+OwoJcGh5LXJlc2V0LWdw
aW9zID0gPCZncGlvMiAxMCBHUElPX0FDVElWRV9MT1c+OwoKCXBoeTA6IGV0aGVybmV0LXBoeUAw
IHsKCQlyeGMtc2tldy1wcyA9IDwxNTAwPjsKCQlyeGR2LXNrZXctcHMgPSA8NDIwPjsgLyogZGVm
YXVsdCAqLwoJCXJ4ZDAtc2tldy1wcyA9IDw0MjA+OyAvKiBkZWZhdWx0ICovCgkJcnhkMS1za2V3
LXBzID0gPDQyMD47IC8qIGRlZmF1bHQgKi8KCQlyeGQyLXNrZXctcHMgPSA8NDIwPjsgLyogZGVm
YXVsdCAqLwoJCXJ4ZDMtc2tldy1wcyA9IDw0MjA+OyAvKiBkZWZhdWx0ICovCgkJdHhjLXNrZXct
cHMgPSA8OTAwPjsgLyogZGVmYXVsdCAqLwoJCXR4ZW4tc2tldy1wcyA9IDw0MjA+OyAvKiBkZWZh
dWx0ICovCgkJdHhkMC1za2V3LXBzID0gPDQyMD47IC8qIGRlZmF1bHQgKi8KCQl0eGQxLXNrZXct
cHMgPSA8NDIwPjsgLyogZGVmYXVsdCAqLwoJCXR4ZDItc2tldy1wcyA9IDw0MjA+OyAvKiBkZWZh
dWx0ICovCgkJdHhkMy1za2V3LXBzID0gPDQyMD47IC8qIGRlZmF1bHQgKi8KCQlyZWcgPSA8MD47
CgkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzI+OwoJCWludGVycnVwdHMgPSA8MTEgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsKCX07Cn07CgomdXNiMl9waHkxIHsKCXBpbmN0cmwtMCA9IDwmdXNiMV9w
aW5zPjsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgoJc3RhdHVzID0gIm9rYXkiOwp9OwoK
JmVoY2kxIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZvaGNpMSB7CglzdGF0dXMgPSAib2theSI7
Cn07CgombXNpb2ZfcmVmX2NsayB7CgljbG9jay1mcmVxdWVuY3kgPSA8NjY2NjY2NjY+Owp9OwoK
Jm1zaW9mMSB7CglwaW5jdHJsLTAgPSA8Jm1zaW9mMV9waW5zPjsKCXBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7CglzdGF0dXMgPSAib2theSI7CgoJc3BpZGV2QDAgewoJCWNvbXBhdGlibGUgPSAi
cmVuZXNhcyxzaC1tc2lvZiI7CgkJcmVnID0gPDA+OwoJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDY2
NjY2NjY2PjsKCQlzcGktY3BoYTsKCQlzcGktY3BvbDsKCX07Cn07CgomdnNwYmMgewoJc3RhdHVz
ID0gIm9rYXkiOwp9OwoKJnZzcGJkIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZ2c3BpMCB7Cglz
dGF0dXMgPSAib2theSI7Cn07CgomdnNwaTEgewoJc3RhdHVzID0gIm9rYXkiOwp9Owo=
--000000000000aeb877057e0eeb2e
Content-Type: text/x-patch; charset="US-ASCII"; name="xen-20181228.patch"
Content-Disposition: attachment; filename="xen-20181228.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jq85lbyw1>
X-Attachment-Id: f_jq85lbyw1

ZGlmZiAtLWdpdCBhL21ldGEtcmNhci1nZW4zLXhlbi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5f
Z2l0LmJiYXBwZW5kIGIvbWV0YS1yY2FyLWdlbjMteGVuL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hl
bl9naXQuYmJhcHBlbmQKaW5kZXggYjQ4YTcxMC4uOTAyMWNlZSAxMDA2NDQKLS0tIGEvbWV0YS1y
Y2FyLWdlbjMteGVuL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmJhcHBlbmQKKysrIGIv
bWV0YS1yY2FyLWdlbjMteGVuL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmJhcHBlbmQK
QEAgLTYxLDMgKzYxLDk5IEBAIFJERVBFTkRTXyR7UE59LWJhc2VfcmVtb3ZlID0gIlwKICAgICAk
e1BOfS1saWJ2aGQgXAogICAgICIKIAorRklMRVNfJHtQTn0tc3RhdGljZGV2ICs9ICJcCisgICAg
JHtsaWJkaXJ9L2xpYnhlbmZvcmVpZ25tZW1vcnkuYSBcCisgICAgJHtsaWJkaXJ9L2xpYnhlbnRv
b2xsb2cuYSBcCisgICAgJHtsaWJkaXJ9L2xpYnhlbmdudHRhYi5hIFwKKyAgICAke2xpYmRpcn0v
bGlieGVuZGV2aWNlbW9kZWwuYSBcCisgICAgJHtsaWJkaXJ9L2xpYnhlbmV2dGNobi5hIFwKKyAg
ICAke2xpYmRpcn0vbGlieGVuY2FsbC5hIFwKKyAgICAke2xpYmRpcn0vbGlieGVudG9vbGNvcmUu
YSBcCisgICAgIgorCitGSUxFU18ke1BOfS1saWJ4ZW5jYWxsLWRldiArPSAiIFwKKyAgICAke2xp
YmRpcn0vbGlieGVuY2FsbC5zbyBcCisgICAgJHtkYXRhZGlyfS9wa2djb25maWcveGVuY2FsbC5w
YyBcCisgICAgIgorCitGSUxFU18ke1BOfS1saWJ4ZW5jdHJsLWRldiArPSAiIFwKKyAgICAke2xp
YmRpcn0vbGlieGVuY3RybC5zbyBcCisgICAgJHtkYXRhZGlyfS9wa2djb25maWcveGVuY29udHJv
bC5wYyBcCisgICAgIgorCitGSUxFU18ke1BOfS1saWJ4ZW5kZXZpY2Vtb2RlbCArPSAiJHtsaWJk
aXJ9L2xpYnhlbmRldmljZW1vZGVsLnNvLioiCitGSUxFU18ke1BOfS1saWJ4ZW5kZXZpY2Vtb2Rl
bC1kZXYgKz0gIiBcCisgICAgJHtsaWJkaXJ9L2xpYnhlbmRldmljZW1vZGVsLnNvIFwKKyAgICAk
e2RhdGFkaXJ9L3BrZ2NvbmZpZy94ZW5kZXZpY2Vtb2RlbC5wYyBcCisgICAgIgorCitGSUxFU18k
e1BOfS1saWJ4ZW5ldnRjaG4tZGV2ICs9ICIgXAorICAgICR7bGliZGlyfS9saWJ4ZW5ldnRjaG4u
c28gXAorICAgICR7ZGF0YWRpcn0vcGtnY29uZmlnL3hlbmV2dGNobi5wYyBcCisgICAgIgorCitG
SUxFU18ke1BOfS1saWJ4ZW5mb3JlaWdubWVtb3J5LWRldiArPSAiXAorICAgICR7bGliZGlyfS9s
aWJ4ZW5mb3JlaWdubWVtb3J5LnNvIFwKKyAgICAke2RhdGFkaXJ9L3BrZ2NvbmZpZy94ZW5mb3Jl
aWdubWVtb3J5LnBjIFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbmdudHRhYi1kZXYgKz0g
IiBcCisgICAgJHtsaWJkaXJ9L2xpYnhlbmdudHRhYi5zbyBcCisgICAgJHtkYXRhZGlyfS9wa2dj
b25maWcveGVuZ250dGFiLnBjIFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbmd1ZXN0LWRl
diArPSAiIFwKKyAgICAke2xpYmRpcn0vbGlieGVuZ3Vlc3Quc28gXAorICAgICR7ZGF0YWRpcn0v
cGtnY29uZmlnL3hlbmd1ZXN0LnBjIFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbnN0YXQt
ZGV2ICs9ICIgXAorICAgICR7bGliZGlyfS9saWJ4ZW5zdGF0LnNvIFwKKyAgICAke2RhdGFkaXJ9
L3BrZ2NvbmZpZy94ZW5zdGF0LnBjIFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbnN0b3Jl
LWRldiArPSAiIFwKKyAgICAke2xpYmRpcn0vbGlieGVuc3RvcmUuc28gXAorICAgICR7ZGF0YWRp
cn0vcGtnY29uZmlnL3hlbnN0b3JlLnBjIFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbnRv
b2xjb3JlICs9ICIke2xpYmRpcn0vbGlieGVudG9vbGNvcmUuc28uKiIKK0ZJTEVTXyR7UE59LWxp
YnhlbnRvb2xjb3JlLWRldiArPSAiIFwKKyAgICAke2xpYmRpcn0vbGlieGVudG9vbGNvcmUuc28g
XAorICAgICR7ZGF0YWRpcn0vcGtnY29uZmlnL3hlbnRvb2xjb3JlLnBjIFwKKyAgICAiCisKK0ZJ
TEVTXyR7UE59LWxpYnhlbnRvb2xsb2ctZGV2ICs9ICIgXAorICAgICR7bGliZGlyfS9saWJ4ZW50
b29sbG9nLnNvIFwKKyAgICAke2RhdGFkaXJ9L3BrZ2NvbmZpZy94ZW50b29sbG9nLnBjIFwKKyAg
ICAiCisKK0ZJTEVTXyR7UE59LWxpYnhlbnZjaGFuLWRldiArPSAiIFwKKyAgICAke2xpYmRpcn0v
bGlieGVudmNoYW4uc28gXAorICAgICR7ZGF0YWRpcn0vcGtnY29uZmlnL3hlbnZjaGFuLnBjIFwK
KyAgICAiCisKK0ZJTEVTXyR7UE59LW1pc2MgKz0gIlwKKyAgICAke3NiaW5kaXJ9L3hlbi1kaWFn
IFwKKyAgICAke2xpYmRpcn0veGVuL2Jpbi9kZXByaXYtZmQtY2hlY2tlciBcCisgICAgIgorCitG
SUxFU18ke1BOfS1lZmkgPSAiXAorICAgICR7ZXhlY19wcmVmaXh9L2xpYjY0L2VmaS94ZW4qIFwK
KyAgICAiCisKK0ZJTEVTXyR7UE59LXhlbm1vbiArPSAiXAorICAgICR7c2JpbmRpcn0veGVubW9u
IFwKKyAgICAiCisKK0ZJTEVTXyR7UE59LWZzaW1hZ2UgKz0gIlwKKyAgICAke2xpYmRpcn0veGVu
ZnNpbWFnZS8qL2ZzaW1hZ2Uuc28gXAorICAgICIKKworRklMRVNfJHtQTn0tbGliZnNpbWFnZSAr
PSAiXAorICAgICR7bGliZGlyfS9saWJ4ZW5mc2ltYWdlLnNvLiogXAorICAgICIKKworRklMRVNf
JHtQTn0tbGliZnNpbWFnZS1kZXYgKz0gIlwKKyAgICAke2xpYmRpcn0vbGlieGVuZnNpbWFnZS5z
byBcCisgICAgIgpkaWZmIC0tZ2l0IGEvbWV0YS1yY2FyLWdlbjMteGVuL3JlY2lwZXMta2VybmVs
L2xpbnV4L2xpbnV4LXJlbmVzYXNfNC45LmJiYXBwZW5kIGIvbWV0YS1yY2FyLWdlbjMteGVuL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXJlbmVzYXNfNC45LmJiYXBwZW5kCmluZGV4IDIwMGIy
OTkuLjUwZWEzOGYgMTAwNjQ0Ci0tLSBhL21ldGEtcmNhci1nZW4zLXhlbi9yZWNpcGVzLWtlcm5l
bC9saW51eC9saW51eC1yZW5lc2FzXzQuOS5iYmFwcGVuZAorKysgYi9tZXRhLXJjYXItZ2VuMy14
ZW4vcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtcmVuZXNhc180LjkuYmJhcHBlbmQKQEAgLTEx
LDMgKzExLDggQEAgU1JDX1VSSV9hcHBlbmRfc2FsdmF0b3IteCA9ICIgXAogICAgIGZpbGU6Ly9y
OGE3Nzk1LXNhbHZhdG9yLXgteGVuLmR0cztzdWJkaXI9Z2l0L2FyY2gvJHtBUkNIfS9ib290L2R0
cy9yZW5lc2FzIFwKICIKIEtFUk5FTF9ERVZJQ0VUUkVFX2FwcGVuZF9zYWx2YXRvci14ID0gInJl
bmVzYXMvcjhhNzc5NS1zYWx2YXRvci14LXhlbi5kdGIiCisKK1NSQ19VUklfYXBwZW5kX2gzdWxj
YiA9ICIgXAorZmlsZTovL3I4YTc3OTUtaDN1bGNiLXhlbi1sb2NhbC5kdHM7c3ViZGlyPWdpdC9h
cmNoLyR7QVJDSH0vYm9vdC9kdHMvcmVuZXNhcyBcCisiCitLRVJORUxfREVWSUNFVFJFRV9hcHBl
bmRfaDN1bGNiID0gInJlbmVzYXMvcjhhNzc5NS1oM3VsY2IteGVuLWxvY2FsLmR0YiIK
--000000000000aeb877057e0eeb2e
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000aeb877057e0eeb2e--
