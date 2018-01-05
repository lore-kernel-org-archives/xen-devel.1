From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 5 Jan 2018 14:54:25 +0000
Message-ID: <7586D6AD-2EE4-413D-81CD-A333D7336123@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <CAEC2CxqA9DagoV=qibqW=ucuhPymRcRH61kb9r5M0PiG+1dmuA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: multipart/mixed; boundary="===============6912901353651769218=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wlwn=ea=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eXTOA-00067c-Bq
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:54:30 +0000
In-Reply-To: <CAEC2CxqA9DagoV=qibqW=ucuhPymRcRH61kb9r5M0PiG+1dmuA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============6912901353651769218==
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_25C038CA-E557-40CF-BA9C-B0DBD1A4F612"


--Apple-Mail=_25C038CA-E557-40CF-BA9C-B0DBD1A4F612
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Julien,

> On 5 Jan 2018, at 14:40, Julien Grall <julien.grall@linaro.org> wrote:
>=20
> (apologies for the formatting)
>=20
> Hi Lars,
>=20
> Thank you for putting together an FAQ.
>=20
> Few comments below around Arm.
>=20
> Systems running Xen, like all operating systems and hypervisors, are =
potentially affected by Spectre (referred to as SP1 and SP2 in Advisory =
254 [1]). For Arm Processors information, you can find which processors =
are impacted here [2].  In general, both the hypervisor and a guest =
kernel are vulnerable to attack via SP1 and SP2.
>=20
> The website list processors designed by Arm (i.e Cortex family). It =
does not include processors made by Arm licensees. I will leave the =
various licensees speak for themselves here.
>=20
> Regarding Arm-designed processors, most of them are not vulnerable to =
any variant. Those affected will mostly be vulnerable to attack via SP1 =
and SP2.
>=20
> But this does not rule out attack via SP3 on Arm. =46rom the website, =
one Cortex processor is affected.
>=20
> While this will not affect Xen (the hypervisor is using a different =
set  of page-tables). Guest kernel will be vulnerable to it.

I would be quite happy to have a specific question covering ARM/ARM =
eco-system where you can explain all this. Feel free to formulate a =
question + answer and I will add it
Lars=

--Apple-Mail=_25C038CA-E557-40CF-BA9C-B0DBD1A4F612
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Julien,<div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 5 Jan 2018, at 14:40, Julien =
Grall &lt;<a href=3D"mailto:julien.grall@linaro.org" =
class=3D"">julien.grall@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"auto" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><div dir=3D"auto" class=3D"">(apologies for the =
formatting)</div><div dir=3D"auto" class=3D""><br class=3D""></div><div =
class=3D"">Hi Lars,</div><div dir=3D"auto" class=3D""><div dir=3D"auto" =
class=3D""><br class=3D""></div><div dir=3D"auto" class=3D"">Thank you =
for putting together an FAQ.</div><div dir=3D"auto" class=3D""><br =
class=3D""></div><div dir=3D"auto" class=3D"">Few comments below around =
Arm.</div><div class=3D"gmail_extra" dir=3D"auto"><br class=3D""><div =
class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left-width: 1px; border-left-style: solid; =
border-left-color: rgb(204, 204, 204); padding-left: 1ex;">Systems =
running Xen, like all operating systems and hypervisors, are potentially =
affected by Spectre (referred to as SP1 and SP2 in Advisory 254 [1]). =
For Arm Processors information, you can find which processors are =
impacted here [2].&nbsp; In general, both the hypervisor and a guest =
kernel are vulnerable to attack via SP1 and =
SP2.</blockquote></div></div></div><div dir=3D"auto" class=3D""><br =
class=3D""></div><div dir=3D"auto" class=3D""></div><div dir=3D"auto" =
class=3D"">The website list processors designed by Arm (i.e Cortex =
family). It does not include processors made by Arm licensees. I will =
leave the various licensees speak for themselves here.</div><div =
dir=3D"auto" class=3D""><br class=3D""></div><div dir=3D"auto" =
class=3D"">Regarding Arm-designed processors, most of them are not =
vulnerable to any variant. Those affected will mostly be vulnerable to =
attack via SP1 and SP2.</div><div dir=3D"auto" class=3D""><br =
class=3D""></div><div dir=3D"auto" class=3D"">But this does not rule out =
attack via SP3 on Arm. =46rom the website, one Cortex processor is =
affected.</div><div dir=3D"auto" class=3D""><br class=3D""></div><div =
dir=3D"auto" class=3D"">While this will not affect Xen (the hypervisor =
is using a different set&nbsp; of page-tables). Guest kernel will be =
vulnerable to it.</div></div></div></blockquote></div><br =
class=3D""></div><div class=3D"">I would be quite happy to have a =
specific question covering ARM/ARM eco-system where you can explain all =
this. Feel free to formulate a question + answer and I will add =
it</div><div class=3D"">Lars</div></body></html>=

--Apple-Mail=_25C038CA-E557-40CF-BA9C-B0DBD1A4F612--


--===============6912901353651769218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6912901353651769218==--
