From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Sat, 28 Apr 2018 23:04:33 +0530
Message-ID: <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
 <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6616821090707751765=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5x+0=hr=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1fCTk4-0007Zu-Fc
 for xen-devel@lists.xenproject.org; Sat, 28 Apr 2018 17:34:36 +0000
In-Reply-To: <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
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

--===============6616821090707751765==
Content-Type: multipart/alternative; boundary="000000000000a79fc4056aec08df"

--000000000000a79fc4056aec08df
Content-Type: text/plain; charset="UTF-8"

Hi Andrew.

Thanks for the reply.

On Sat, Apr 28, 2018 at 10:57 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 28/04/18 18:12, Ajay Garg wrote:
>
> Hi All.
>
> We have brought up the cubieboard2 from almost scratch, following are the
> steps done :
>
> <snip>
>
> == getting xen ready ==
>
> i)
> Compiled xen on cubieboard itself, via :
>
>    * git clone git://xenbits.xen.org/xen.git
>    * cd xen
> .  * ./configure --libdir=/usr/lib
>    * make debball CONFIG_EARLY_PRINTK=sun7i -j4
>    * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
>    * sudo reboot
>
> ii)
> Upon reboot, "sudo xl list" gives following :
>
> ##################################################################
> debian@debian-armhf:~$ sudo  xl list
> [sudo] password for debian:
> xencall: error: Could not obtain handle on privileged command interface:
> No such file or directory
> libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
> such file or directory
> cannot init xl context
> ##################################################################
>
>
> This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd) device
> isn't available.
>
> First check that you have actually booted Xen with Linux as dom0.  You
> don't show any logs in this final section, and simply installing the
> debball and rebooting won't typically cause Xen to be the head of the boot
> list.
>

Yes, I haven't been able to setup xen bootup.

That's why, requested help regarding the changes that are required in
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts,
that would cause dom0 to boot up.


Sorry for the confusion.


Thanks and Regards,
Ajay

--000000000000a79fc4056aec08df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andrew.<br><br></div>Thanks for the reply.<br><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Apr 28, 2018 =
at 10:57 PM, Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.c=
ooper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <div class=3D"gmail-m_-4521707927368275737moz-cite-prefix">On 28/04/18 =
18:12, Ajay Garg wrote:<br>
    </div>
    </span><blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div><span class=3D"gmail-">Hi All.<br>
          <br>
          We have brought up the cubieboard2 from almost scratch,
          following are the steps done :<br>
          <br></span>
          &lt;snip&gt;</div><span class=3D"gmail-">
        <div><br>
          =3D=3D getting xen ready =3D=3D<br>
          <br>
        </div>
        <div>i)<br>
        </div>
        <div>Compiled xen on cubieboard itself, via :<br>
          <br>
          =C2=A0=C2=A0 * git clone git://<a href=3D"http://xenbits.xen.org/=
xen.git" target=3D"_blank">xenbits.xen.org/xen.git</a><br>
          =C2=A0=C2=A0 * cd xen<br>
          .=C2=A0 * ./configure --libdir=3D/usr/lib<br>
          =C2=A0=C2=A0 * make debball CONFIG_EARLY_PRINTK=3Dsun7i -j4<br>
        </div>
        <div>=C2=A0=C2=A0 * sudo dpkg -i dist/xen-upstream-4.11-<wbr>unstab=
le.deb<br>
        </div>
        <div>=C2=A0=C2=A0 * sudo reboot<br>
          <br>
        </div>
        <div>ii)<br>
        </div>
        <div>Upon reboot, &quot;sudo xl list&quot; gives following :<br>
          <br>
##############################<wbr>##############################<wbr>#####=
#<br>
          debian@debian-armhf:~$ sudo=C2=A0 xl list<br>
          [sudo] password for debian:<br>
          xencall: error: Could not obtain handle on privileged command
          interface: No such file or directory<br>
          libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc
          handle: No such file or directory<br>
          cannot init xl context<br>
##############################<wbr>##############################<wbr>#####=
#<br>
        </div>
      </span></div>
    </blockquote>
    <br>
    This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd)
    device isn&#39;t available.<br>
    <br>
    First check that you have actually booted Xen with Linux as dom0.=C2=A0
    You don&#39;t show any logs in this final section, and simply installin=
g
    the debball and rebooting won&#39;t typically cause Xen to be the head
    of the boot list.<br></div></blockquote><div><br></div><div>Yes, I have=
n&#39;t been able to setup xen bootup.<br><br></div><div>That&#39;s why, re=
quested help regarding the changes that are required in <a href=3D"https://=
github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboar=
d2.dts">https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun=
7i-a20-cubieboard2.dts</a>, that would cause dom0 to boot up.<br><br><br></=
div><div>Sorry for the confusion.<br></div></div><br>=C2=A0<br><div class=
=3D"gmail_signature">Thanks and Regards,<br>Ajay<br></div>
</div></div>

--000000000000a79fc4056aec08df--


--===============6616821090707751765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6616821090707751765==--
