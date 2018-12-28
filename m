From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Sat, 29 Dec 2018 02:35:28 +0900
Message-ID: <CACrvCsZcpuSQjks2vRrELd+j4zsNzfBe-RfKpG8+oko10AiXoA@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1424750318042334498=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============1424750318042334498==
Content-Type: multipart/alternative; boundary="000000000000dffa7c057e10c7ff"

--000000000000dffa7c057e10c7ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrii and everyone still listening,

I am sorry for sending attachments to the mailing list. Below is my github
with the patch I applied and the dts I made to attempt to boot the R-Car H3=
.

https://github.com/nacarino/xen-arm

As Andrii suggested, I attempted only compiling Xen with the SRCREV
24fb44e971a62b345c7b6ca3c03b454a1e150abe.

The compilation went smoothly but I was unable to get any output from the
R-Car H3 past the "Starting kernel" line.

I have a feeling that my configuration of the serial connection or the
serial configuration somewhere is wrong, however I don't have a clue where
I could start debugging.

Does any one have any ideas?

Thank you all for your patience and cooperation.

Best regards,

Jairo

2018=E5=B9=B412=E6=9C=8829=E6=97=A5(=E5=9C=9F) 0:22 LOPEZ, FUENTES NACARINO=
 Jairo Eduardo <
jairo@ruri.waseda.jp>:

> Hello Andrii,
>
> Thanks again for responding and for clarifying some of the underlying
> workings of Yocto.
>
> 2018=E5=B9=B412=E6=9C=8827=E6=97=A5(=E6=9C=A8) 20:07 Andrii Anisov <andri=
i.anisov@gmail.com>:
>
>> Hello Jairo,
>>
>> On 25.12.18 18:07, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
>> > I believe this is the SoC information. If there is any other method of
>> extracting the information, please let me know so I can transmit it.
>>
>> That output gives a full set of required information. Actually, I worrie=
d
>> you
>> might have an obsolete SoC revision. But it is not your case.
>>
>
> I am actually very relieved that this is the case.
>
>
>> > I took a look at [1] and decided to start from scratch to attempt to
>> get the minimum workspace functioning.
>>
>> I mainly mentioned point 1 from those limitations. But you have H3 ES2.0
>> so
>> ready for the latest BSP as well.
>>
>> > In previous attempts, I had to modify some recipes to get the
>> compilation working, but this time I would like to confirm with everyone
>> the initial steps before I take them.
>> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: QA Issue: xen=
:
>> Files/directories were installed but not shipped in any package:
>> >    /usr/lib/libxenfsimage.so
>> >    /usr/lib/libxenfsimage.so.4.12
>> >    /usr/lib/libxenfsimage.so.4.12.0
>> >    /usr/lib/xenfsimage/ext2fs-lib/fsimage.so
>> >    /usr/lib/xenfsimage/ufs/fsimage.so
>> >    /usr/lib/xenfsimage/fat/fsimage.so
>> >    /usr/lib/xenfsimage/iso9660/fsimage.so
>> >    /usr/lib/xenfsimage/reiserfs/fsimage.so
>> >    /usr/lib/xenfsimage/zfs/fsimage.so
>> >    /usr/lib/xen/bin/depriv-fd-checker
>> >    /usr/sbin/xenmon
>> > Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_instal=
l.
>> > xen: 11 installed and not shipped files. [installed-vs-shipped]
>> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Fatal QA
>> errors found, failing task.
>> > ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Function
>> failed: do_package
>> > ERROR: Logfile of failure stored in:
>> /home/yocto/r-car/build/tmp/work/aarch64-poky-linux/xen/unstable+gitAUTO=
INC+9d357cbaf7-r0/temp/log.do_package.8954
>> > ERROR: Task 329
>> (/home/yocto/r-car/meta-virtualization/recipes-extended/xen/xen_git.bb <
>> http://xen_git.bb>, do_package) failed with exit code '1'
>> > NOTE: Tasks Summary: Attempted 3642 tasks of which 3641 didn't need to
>> be rerun and 1 failed.
>> > No currently running tasks (2517 of 3653)
>> >
>> > Summary: 1 task failed:
>> >    /home/yocto/r-car/meta-virtualization/recipes-extended/xen/
>> xen_git.bb <http://xen_git.bb>, do_package
>> > Summary: There were 3 WARNING messages shown.
>> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
>> code.
>>
>> It's a known issue. Let's say Yocto's specifics. XEN does evolve so its
>> tools
>> set of libs and apps is being changed. But Yocto tracks all products of
>> compilation and eager to know what to do with each of those files.
>>
>> > I am aware I am using a very old BSP. If there is a slightly better
>> version with which to start with, I would greatly like everyone's opinio=
n.
>>
>> It is mainly not because of BSP, but the meta-virtualization layer
>> version, it
>> describes how to build and install XEN. As you can see in the last patch
>> to
>> xen_git.bbappend [1] it is adjusted for 4.10-rc1. I suppose you already
>> did
>> required changes for the current 4.12-unstable version when saying:
>>
>> > In previous attempts, I had to modify some recipes to get the
>> compilation working
>>
>> Good, you have the BSP with XEN built. Could you please reveal your
>> changes to
>> let me know which XEN you actually built?
>
>
>
> In order to get Xen to compile and to prepare for the boot, I modified th=
e
> meta-demo layer to include the Xen files that were not already included a=
nd
> the hand modified dts file. I have attempted to attach these to the mail.
>
> I am not sure if there is an easier way to get that information, but I
> basically did a git show within the tmp/work/aarch64-poky-linux/xen folde=
r
> and got the hash 7f28661f6a7ce3d82f881b9afedfebca7f2cf116 which points to
> the current head of the master branch of the xen.git repository, if I am
> not mistaken.
>
> In the previous email you said, you
>> tried running freshly built BSP with XEN, and it does not show anything =
to
>> display. But what about the console output for that case?
>>
>>
> Via serial console I get the following output for the images created afte=
r
> modifying the dts and applying the patch below:
>
> U-Boot 2015.04 (Jun 22 2018 - 13:36:27)
>
> CPU: Renesas Electronics R8A7795 rev 2.0
> Board: H3ULCB
> I2C:   ready
> DRAM:  3.9 GiB
> MMC:   sh-sdhi: 0, sh-sdhi: 1
> In:    serial
> Out:   serial
> Err:   serial
> Net:   ravb
> Hit any key to stop autoboot:  0
> =3D> setenv bootargs
> =3D> setenv serverip 192.168.1.100
> =3D> tftp 0x48080000 xen-h3ulcb.uImage
> ravb Waiting for PHY auto negotiation to complete...... done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'xen-h3ulcb.uImage'.
> Load address: 0x48080000
> Loading: #############################################################
>          171.9 KiB/s
> done
> Bytes transferred =3D 886160 (d8590 hex)
> =3D> tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete... done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'Image-r8a7795-h3ulcb-xen-local.dtb'.
> Load address: 0x48000000
> Loading: #####
>          11.7 KiB/s
> done
> Bytes transferred =3D 63810 (f942 hex)
> =3D> tftp 0x7a000000 Image
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete........ done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'Image'.
> Load address: 0x7a000000
> Loading: ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ############################################
>          2.1 MiB/s
> done
> Bytes transferred =3D 15911424 (f2ca00 hex)
> =3D> bootm 0x48080000 - 0x48000000
> ## Booting kernel from Legacy Image at 48080000 ...
>    Image Name:   XEN
>    Image Type:   AArch64 Linux Kernel Image (uncompressed)
>    Data Size:    886096 Bytes =3D 865.3 KiB
>    Load Address: 78080000
>    Entry Point:  78080000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 48000000
>    Booting using the fdt blob at 0x48000000
>    Loading Kernel Image ... OK
>    Using Device Tree in place at 0000000048000000, end 0000000048012941
>
> Starting kernel ...
>
>
> And that is it.
> Please note that although I am getting the images and dtb from tftp, the
> root filesystem is on the microSD card.
>
> I am guessing I should have seen the console output for Xen. I also am no=
t
> sure how to test if dom0 is actually running at this stage.
>
>
>> >  From the log it would seem that the xen_git.bb <http://xen_git.bb> in
>> the meta-virtualization layer is being called and thus the recipe is
>> attempting to compile the newest version of Xen.
>>
>> Right you are. That is the idea. But Yocto's way of BSP compilation make=
s
>> it
>> tending to break up. You can edit XEN recipe to build it from a specific
>> revision, e.g. 4.10.0-rc1. You should replace `${AUTOREV}` in this line
>> [2]
>> with the correspondent commit-id
>> `24fb44e971a62b345c7b6ca3c03b454a1e150abe` to
>> do so.
>> But I suppose it is not what you really need. Since 4.10.0-rc1 there are=
 a
>> number of changes to scheduling. You might need have those bits up to
>> date for
>> your work.
>>
>
>> > So my second question would be, what version of Xen should I point
>> towards for the board I am using?I guess it is better to use the latest =
and
>> greatest for your work, so XEN 4.12 unstable should suit you.
>>
>>
> Yes, I have been tracking some of the scheduling changes being done to Xe=
n
> and I would really like to have a relatively newer version up and running=
.
> However, just having something, anything, running at this stage would be
> great.
>
> Also I do understand that we have our meta-demo layer quite outdated both
>> from
>> XEN and BSP sides. Renesas's 2.x BSPs are baked with Linux kernel 4.9.x,
>> it is
>> really old. Even with LK 4.14, we are using from BSP 3.9, I faced an
>> issue [3]
>> while playing with the latest and greatest XEN.
>>
>> [1]
>> https://github.com/xen-troops/meta-demo/commit/a4178158ca3ebb739c9bc71c5=
17ec7b65f563218
>> [2]
>> https://github.com/xen-troops/meta-demo/blob/master/meta-rcar-gen3-xen/r=
ecipes-extended/xen/xen_git.bbappend#L9
>> [3]
>> https://lists.xenproject.org/archives/html/xen-devel/2018-12/msg01373.ht=
ml
>>
>> --
>> Sincerely,
>> Andrii Anisov.
>>
>
> Thank you very much for all your support.
>
> Best regards,
>
> Jairo
>

--000000000000dffa7c057e10c7ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Andrii and ev=
eryone still listening,</div><div><br></div><div>I am sorry for sending att=
achments to the mailing list. Below is my github with the patch I applied a=
nd the dts I made to attempt to boot the R-Car H3.<br></div><div><br></div>=
<div><a href=3D"https://github.com/nacarino/xen-arm">https://github.com/nac=
arino/xen-arm</a><br></div><div><br></div><div>As Andrii suggested, I attem=
pted only compiling Xen with the SRCREV 24fb44e971a62b345c7b6ca3c03b454a1e1=
50abe.</div><div><br></div><div>The compilation went smoothly but I was una=
ble to get any output from the R-Car H3 past the &quot;Starting kernel&quot=
; line.</div><div><br></div><div>I have a feeling that my configuration of =
the serial connection or the serial configuration somewhere is wrong, howev=
er I don&#39;t have a clue where I could start debugging.</div><div><br></d=
iv><div>Does any one have any ideas?</div><div><br></div><div>Thank you all=
 for your patience and cooperation.</div><div><br></div><div>Best regards,<=
/div><div><br></div><div>Jairo<br></div></div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">2018=E5=B9=B412=E6=9C=8829=E6=97=A5(=E5=9C=
=9F) 0:22 LOPEZ, FUENTES NACARINO Jairo Eduardo &lt;<a href=3D"mailto:jairo=
@ruri.waseda.jp">jairo@ruri.waseda.jp</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Hello Andrii,</div><div><br></div><div>Thanks again for responding a=
nd for clarifying some of the underlying workings of Yocto.</div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">2018=E5=B9=B412=E6=9C=882=
7=E6=97=A5(=E6=9C=A8) 20:07 Andrii Anisov &lt;<a href=3D"mailto:andrii.anis=
ov@gmail.com" target=3D"_blank">andrii.anisov@gmail.com</a>&gt;:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello Jairo,<br>
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
</blockquote></div>

--000000000000dffa7c057e10c7ff--


--===============1424750318042334498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1424750318042334498==--
