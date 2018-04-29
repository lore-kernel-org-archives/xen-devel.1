From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Sun, 29 Apr 2018 11:30:38 +0530
Message-ID: <CAHP4M8UUEwyG9NgmAiT6WXBbD_gmbJXQP03n3pH58eoGrwPAuQ@mail.gmail.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
 <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
 <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
 <23a0e88b-95c6-9d55-32e1-0c7834999f98@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7316867688815957159=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fcsy=hs=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1fCfO8-0006Jt-CB
 for xen-devel@lists.xenproject.org; Sun, 29 Apr 2018 06:00:44 +0000
In-Reply-To: <23a0e88b-95c6-9d55-32e1-0c7834999f98@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7316867688815957159==
Content-Type: multipart/alternative; boundary="000000000000e90ab6056af674bc"

--000000000000e90ab6056af674bc
Content-Type: text/plain; charset="UTF-8"

I changed the /chosen node in the dts file to

#######################################
    chosen {
        stdout-path = "serial0:115200n8";
        xen,xen-bootargs = "dom0_mem=752M console=dtuart dtuart=serial0
dom0_max_vcpus=4";
        xen,dom0-bootargs = "console=ttyS0,115200 rw root=/dev/mmcblk0p2
ignore_loglevel cma=128M";
        modules {
            #address-cells = <2>;
            #size-cells = <2>;
            module@1 {
                compatible = "xen,linux-zimage", "xen,multiboot-module";
                reg = <0x0 0x7a000000 0x0 0x02000000>;
            };
        };
    };
#######################################



Also, the xen-related features in the kernel are as follows (created by
default after selecting "Kernel features => Xen guest support on ARM" in
menuconfig) :

#######################################
  CONFIG_XEN_DOM0=y
  CONFIG_XEN=y
  CONFIG_XEN_BLKDEV_FRONTEND=y
  CONFIG_XEN_NETDEV_FRONTEND=y
  CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
  CONFIG_HVC_XEN=y
  CONFIG_HVC_XEN_FRONTEND=y
  CONFIG_XEN_FBDEV_FRONTEND=y
  CONFIG_XEN_BALLOON=y
  CONFIG_XEN_SCRUB_PAGES=y
  CONFIG_XEN_DEV_EVTCHN=y
  CONFIG_XEN_BACKEND=y
  CONFIG_XENFS=y
  CONFIG_XEN_COMPAT_XENFS=y
  CONFIG_XEN_SYS_HYPERVISOR=y
  CONFIG_XEN_XENBUS_FRONTEND=y
  CONFIG_XEN_GNTDEV=m
  CONFIG_XEN_GRANT_DEV_ALLOC=m
  CONFIG_SWIOTLB_XEN=y
  CONFIG_XEN_PRIVCMD=y
  CONFIG_XEN_AUTO_XLATE=y


  # CONFIG_XEN_BLKDEV_BACKEND is not set
  # CONFIG_XEN_SCSI_FRONTEND is not set
  # CONFIG_XEN_NETDEV_BACKEND is not set
  # CONFIG_XEN_WDT is not set
  # CONFIG_XEN_PVCALLS_FRONTEND is not set
  # CONFIG_XEN_PVCALLS_BACKEND is not set
#######################################

However, I see absolutely no change in the observations; no xen-related log
on the serial-console, and "sudo xl list" gives the same error messages.

What am I lacking?


On Sat, Apr 28, 2018 at 11:06 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 28/04/18 18:34, Ajay Garg wrote:
>
> Hi Andrew.
>
> Thanks for the reply.
>
> On Sat, Apr 28, 2018 at 10:57 PM, Andrew Cooper <andrew.cooper3@citrix.com
> > wrote:
>
>> On 28/04/18 18:12, Ajay Garg wrote:
>>
>> Hi All.
>>
>> We have brought up the cubieboard2 from almost scratch, following are the
>> steps done :
>>
>> <snip>
>>
>> == getting xen ready ==
>>
>> i)
>> Compiled xen on cubieboard itself, via :
>>
>>    * git clone git://xenbits.xen.org/xen.git
>>    * cd xen
>> .  * ./configure --libdir=/usr/lib
>>    * make debball CONFIG_EARLY_PRINTK=sun7i -j4
>>    * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
>>    * sudo reboot
>>
>> ii)
>> Upon reboot, "sudo xl list" gives following :
>>
>> ##################################################################
>> debian@debian-armhf:~$ sudo  xl list
>> [sudo] password for debian:
>> xencall: error: Could not obtain handle on privileged command interface:
>> No such file or directory
>> libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
>> such file or directory
>> cannot init xl context
>> ##################################################################
>>
>>
>> This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd) device
>> isn't available.
>>
>> First check that you have actually booted Xen with Linux as dom0.  You
>> don't show any logs in this final section, and simply installing the
>> debball and rebooting won't typically cause Xen to be the head of the boot
>> list.
>>
>
> Yes, I haven't been able to setup xen bootup.
>
> That's why, requested help regarding the changes that are required in
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-
> cubieboard2.dts, that would cause dom0 to boot up.
>
>
> Sorry for the confusion.
>
>
> Ah - sorry.  I misunderstood.  I'm afraid you're going to have to wait for
> some people more knowledge about ARM to answer.
>
> ~Andrew
>



-- 
Regards,
Ajay

--000000000000e90ab6056af674bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>I changed the /chosen node in the dts =
file to <br><br>#######################################<br>=C2=A0=C2=A0=C2=
=A0 chosen {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stdout-path =3D =
&quot;serial0:115200n8&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xen,xen-bootargs =3D &quot;dom0_mem=3D752M console=3Ddtuart dtuart=3Dseria=
l0 dom0_max_vcpus=3D4&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
xen,dom0-bootargs =3D &quot;console=3DttyS0,115200 rw root=3D/dev/mmcblk0p2=
 ignore_loglevel cma=3D128M&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 modules {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D &lt;2&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;2&gt;;<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module@1 {<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D &quot;xen,linux-zimage&quot;, &quot;xen,m=
ultiboot-module&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x7a000000 0x0 0=
x02000000&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=
=A0=C2=A0 };<br>#######################################<br><br></div><br><b=
r></div>Also, the xen-related features in the kernel are as follows (create=
d by default after selecting &quot;Kernel features =3D&gt; Xen guest suppor=
t on ARM&quot; in menuconfig) :<br><br>####################################=
###<br>=C2=A0 CONFIG_XEN_DOM0=3Dy<br>=C2=A0 CONFIG_XEN=3Dy<br>=C2=A0 CONFIG=
_XEN_BLKDEV_FRONTEND=3Dy<br>=C2=A0 CONFIG_XEN_NETDEV_FRONTEND=3Dy<br>=C2=A0=
 CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy<br>=C2=A0 CONFIG_HVC_XEN=3Dy<br>=C2=
=A0 CONFIG_HVC_XEN_FRONTEND=3Dy<br>=C2=A0 CONFIG_XEN_FBDEV_FRONTEND=3Dy<br>=
=C2=A0 CONFIG_XEN_BALLOON=3Dy<br>=C2=A0 CONFIG_XEN_SCRUB_PAGES=3Dy<br>=C2=
=A0 CONFIG_XEN_DEV_EVTCHN=3Dy<br>=C2=A0 CONFIG_XEN_BACKEND=3Dy<br>=C2=A0 CO=
NFIG_XENFS=3Dy<br>=C2=A0 CONFIG_XEN_COMPAT_XENFS=3Dy<br>=C2=A0 CONFIG_XEN_S=
YS_HYPERVISOR=3Dy<br>=C2=A0 CONFIG_XEN_XENBUS_FRONTEND=3Dy<br>=C2=A0 CONFIG=
_XEN_GNTDEV=3Dm<br>=C2=A0 CONFIG_XEN_GRANT_DEV_ALLOC=3Dm<br>=C2=A0 CONFIG_S=
WIOTLB_XEN=3Dy<br>=C2=A0 CONFIG_XEN_PRIVCMD=3Dy<br>=C2=A0 CONFIG_XEN_AUTO_X=
LATE=3Dy<br><br><br>=C2=A0 # CONFIG_XEN_BLKDEV_BACKEND is not set<br>=C2=A0=
 # CONFIG_XEN_SCSI_FRONTEND is not set<br>=C2=A0 # CONFIG_XEN_NETDEV_BACKEN=
D is not set<br>=C2=A0 # CONFIG_XEN_WDT is not set<br>=C2=A0 # CONFIG_XEN_P=
VCALLS_FRONTEND is not set<br>=C2=A0 # CONFIG_XEN_PVCALLS_BACKEND is not se=
t<br>#######################################<br><br></div>However, I see ab=
solutely no change in the observations; no xen-related log on the serial-co=
nsole, and &quot;sudo xl list&quot; gives the same error messages.<br><br><=
/div>What am I lacking?<br><div><div><br></div></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Sat, Apr 28, 2018 at 11:06 PM,=
 Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.cooper3@citri=
x.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <div class=3D"m_-8566150150470179879moz-cite-prefix">On 28/04/18 18:34,=
 Ajay Garg wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi Andrew.<br>
          <br>
        </div>
        Thanks for the reply.<br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Sat, Apr 28, 2018 at 10:57 PM,
            Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.co=
oper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</span=
>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#FFFFFF"><span class=3D"m_-856615015047017987=
9gmail-">
                  <div class=3D"m_-8566150150470179879gmail-m_-452170792736=
8275737moz-cite-prefix">On
                    28/04/18 18:12, Ajay Garg wrote:<br>
                  </div>
                </span>
                <blockquote type=3D"cite">
                  <div dir=3D"ltr">
                    <div><span class=3D"m_-8566150150470179879gmail-">Hi Al=
l.<br>
                        <br>
                        We have brought up the cubieboard2 from almost
                        scratch, following are the steps done :<br>
                        <br>
                      </span> &lt;snip&gt;</div>
                    <span class=3D"m_-8566150150470179879gmail-">
                      <div><br>
                        =3D=3D getting xen ready =3D=3D<br>
                        <br>
                      </div>
                      <div>i)<br>
                      </div>
                      <div>Compiled xen on cubieboard itself, via :<br>
                        <br>
                        =C2=A0=C2=A0 * git clone git://<a href=3D"http://xe=
nbits.xen.org/xen.git" target=3D"_blank">xenbits.xen.org/xen.git</a><br>
                        =C2=A0=C2=A0 * cd xen<br>
                        .=C2=A0 * ./configure --libdir=3D/usr/lib<br>
                        =C2=A0=C2=A0 * make debball CONFIG_EARLY_PRINTK=3Ds=
un7i -j4<br>
                      </div>
                      <div>=C2=A0=C2=A0 * sudo dpkg -i dist/xen-upstream-4.=
11-unstabl<wbr>e.deb<br>
                      </div>
                      <div>=C2=A0=C2=A0 * sudo reboot<br>
                        <br>
                      </div>
                      <div>ii)<br>
                      </div>
                      <div>Upon reboot, &quot;sudo xl list&quot; gives foll=
owing :<br>
                        <br>
                        ##############################<wbr>################=
##############<wbr>######<br>
                        debian@debian-armhf:~$ sudo=C2=A0 xl list<br>
                        [sudo] password for debian:<br>
                        xencall: error: Could not obtain handle on
                        privileged command interface: No such file or
                        directory<br>
                        libxl: error: libxl.c:102:libxl_ctx_alloc:
                        cannot open libxc handle: No such file or
                        directory<br>
                        cannot init xl context<br>
                        ##############################<wbr>################=
##############<wbr>######<br>
                      </div>
                    </span></div>
                </blockquote>
                <br>
                This means that /dev/xen/privcmd (or the legacy
                /proc/xen/privcmd) device isn&#39;t available.<br>
                <br>
                First check that you have actually booted Xen with Linux
                as dom0.=C2=A0 You don&#39;t show any logs in this final se=
ction,
                and simply installing the debball and rebooting won&#39;t
                typically cause Xen to be the head of the boot list.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Yes, I haven&#39;t been able to setup xen bootup.<br>
              <br>
            </div>
            <div>That&#39;s why, requested help regarding the changes that
              are required in <a href=3D"https://github.com/torvalds/linux/=
blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts" target=3D"_blank">=
https://github.com/torvalds/<wbr>linux/blob/master/arch/arm/<wbr>boot/dts/s=
un7i-a20-<wbr>cubieboard2.dts</a>,
              that would cause dom0 to boot up.<br>
              <br>
              <br>
            </div>
            <div>Sorry for the confusion.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Ah - sorry.=C2=A0 I misunderstood.=C2=A0 I&#39;m afraid you&#39;re goin=
g to have to
    wait for some people more knowledge about ARM to answer.<span class=3D"=
HOEnZb"><font color=3D"#888888"><br>
    <br>
    ~Andrew
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Regards,<br>Ajay<br></div>
</div>

--000000000000e90ab6056af674bc--


--===============7316867688815957159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7316867688815957159==--
