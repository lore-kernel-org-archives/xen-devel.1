From: Saumya Rajesh <saumyarajesh93@gmail.com>
Subject: Re: Access I2C bus from guest/DomU on ARM board
Date: Wed, 17 Jan 2018 19:33:33 +0530
Message-ID: <CAONE6OCM9wEd6zJCH5147vTMWyt4CGH9uXbBX0y29di9cC3QaQ@mail.gmail.com>
References: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
 <37217807-7f20-bdbf-f852-033fcae1bd01@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0056612264206240184=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q8xv=em=gmail.com=saumyarajesh93@srs-us1.protection.inumbo.net>)
 id 1eboJU-0004qo-K5
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 14:03:36 +0000
In-Reply-To: <37217807-7f20-bdbf-f852-033fcae1bd01@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel@lists.xenproject.org, embedded-pv-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============0056612264206240184==
Content-Type: multipart/alternative; boundary="001a114eb4601ac9820562f95016"

--001a114eb4601ac9820562f95016
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 16, 2018 at 9:22 PM, Andrii Anisov <andrii_anisov@epam.com>
wrote:

> Dear Rajesh,
>
>
> You can try to get an I2C bus controller in DomU in PIO mode following
> [1], keeping in mind [2].
>
> If you want it DMA capable you need Renesas IPMMU support in XEN [3], [4]
> to be incorporated.
>
>
> [1] - https://xenbits.xen.org/docs/unstable/misc/arm/passthrough.txt
>
> [2] - https://lists.xenproject.org/archives/html/xen-users/2017-10
> /msg00031.html
>
> [3] - https://lists.xenproject.org/archives/html/xen-devel/2017-07
> /msg02545.html
>
> [4] - https://lists.xenproject.org/archives/html/xen-devel/2017-07
> /msg02679.html
>
>
> --
>
> *Andrii Anisov*
>
>
>
Thank you Andrii for replying. I will try the device passthrough way of
using I2C bus from guest and post the updates.

Just out of curiosity, is it possible to split the Driver for the Renesas
RCar I2C unit [1] into frontend and backend to use the i2c bus from guest?
Or to do something similar to PCI passthrough? Please forgive me if I sound
illogical. I'm just curious.

Regards
Saumya

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/drivers/i2c/busses/i2c-rcar.c?h=v4.14.13

--001a114eb4601ac9820562f95016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jan 16, 2018 at 9:22 PM, Andrii Anisov <span dir=3D"ltr">&lt;<a href=3D=
"mailto:andrii_anisov@epam.com" target=3D"_blank">andrii_anisov@epam.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">De=
ar Rajesh,<br>
<br>
<br>
You can try to get an I2C bus controller in DomU in PIO mode following [1],=
 keeping in mind [2].<br>
<br>
If you want it DMA capable you need Renesas IPMMU support in XEN [3], [4] t=
o be incorporated.<br>
<br>
<br>
[1] - <a href=3D"https://xenbits.xen.org/docs/unstable/misc/arm/passthrough=
.txt" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/u<w=
br>nstable/misc/arm/passthrough.t<wbr>xt</a><br>
<br>
[2] - <a href=3D"https://lists.xenproject.org/archives/html/xen-users/2017-=
10/msg00031.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenpro=
ject.org/a<wbr>rchives/html/xen-users/2017-10<wbr>/msg00031.html</a><br>
<br>
[3] - <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-=
07/msg02545.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenpro=
ject.org/a<wbr>rchives/html/xen-devel/2017-07<wbr>/msg02545.html</a><br>
<br>
[4] - <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-=
07/msg02679.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenpro=
ject.org/a<wbr>rchives/html/xen-devel/2017-07<wbr>/msg02679.html</a><span c=
lass=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
<br>
-- <br>
<br>
*Andrii Anisov*<br>
<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><div =
class=3D"gmail_extra"><font face=3D"tahoma, sans-serif">Thank you Andrii fo=
r replying. I will try the device passthrough way of using I2C bus from gue=
st and post the updates.=C2=A0</font></div><div class=3D"gmail_extra"><font=
 face=3D"tahoma, sans-serif"><br></font></div><div class=3D"gmail_extra"><f=
ont face=3D"tahoma, sans-serif">Just out of curiosity, is it possible to sp=
lit the Driver for the Renesas RCar I2C unit [1] into frontend and backend =
to use the i2c bus from guest? Or to do something similar to PCI passthroug=
h? Please forgive me if I sound illogical. I&#39;m just curious.</font></di=
v><div class=3D"gmail_extra"><font face=3D"tahoma, sans-serif"><br></font><=
/div><div class=3D"gmail_extra"><font face=3D"tahoma, sans-serif">Regards</=
font></div><div class=3D"gmail_extra"><font face=3D"tahoma, sans-serif">Sau=
mya</font></div><div class=3D"gmail_extra"><font face=3D"tahoma, sans-serif=
"><br></font></div><div class=3D"gmail_extra"><font face=3D"tahoma, sans-se=
rif">[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/=
linux-stable.git/tree/drivers/i2c/busses/i2c-rcar.c?h=3Dv4.14.13">https://g=
it.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/drivers=
/i2c/busses/i2c-rcar.c?h=3Dv4.14.13</a></font></div></div></div>

--001a114eb4601ac9820562f95016--


--===============0056612264206240184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0056612264206240184==--
