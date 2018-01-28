From: Pieter Dewachter <pieter.dewachter@student.kuleuven.be>
Subject: Supported hardware
Date: Sun, 28 Jan 2018 11:10:33 +0000
Message-ID: <1517137831941.78119@student.kuleuven.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0578406473019482759=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=uege=ex=student.kuleuven.be=pieter.dewachter@srs-us1.protection.inumbo.net>)
 id 1efkrB-0002Pf-9B
 for xen-devel@lists.xenproject.org; Sun, 28 Jan 2018 11:10:41 +0000
Received: from icts-p-smtps-1.cc.kuleuven.be
 (icts-p-smtps-1e.kulnet.kuleuven.be [134.58.240.33])
 by rhcavuit01.kulnet.kuleuven.be (Postfix) with ESMTP id 9E643120322
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2018 12:10:33 +0100 (CET)
Received: from ICTS-S-EXMBX6.luna.kuleuven.be (icts-s-exmbx6.luna.kuleuven.be
 [10.112.11.14]) (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by icts-p-smtps-1.cc.kuleuven.be (Postfix) with ESMTPS id 9C2C2403B
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2018 12:10:33 +0100 (CET)
Content-Language: nl-NL
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0578406473019482759==
Content-Language: nl-NL
Content-Type: multipart/alternative;
	boundary="_000_151713783194178119studentkuleuvenbe_"

--_000_151713783194178119studentkuleuvenbe_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear developers,


?I'm doing my master thesis this year and I will be using the Xen hyperviso=
r for it. The domain for my thesis is more about the automotive sector, but=
 unfortunately the hardware is too expensive to actually use the automotive=
 drivers for Xen.


The goal is to set up a failover cluster by using two different processors,=
 but the first goal is to actually run Xen on them. Due to the limited budg=
et, we were looking at this development board specifically:

https://www.mouser.be/productdetail/nxp-freescale/frdm-ls1012a-pa?qs=3DsGAE=
piMZZMtw0nEwywcFgPq18vRUkOhrFGI4%252bz5xG70HM4YISmdecw=3D=3D<https://www.mo=
user.be/productdetail/nxp-freescale/frdm-ls1012a-pa?qs=3DsGAEpiMZZMtw0nEwyw=
cFgPq18vRUkOhrFGI4%252bz5xG70HM4YISmdecw>


This is a board based on a single Cortex A53 implemented by NXP, more detai=
ls can be found here:

https://www.nxp.com/products/processors-and-microcontrollers/arm-based-proc=
essors-and-mcus/qoriq-layerscape-arm-processors/qoriq-layerscape-1012a-low-=
power-communication-processor:LS1012A?


Now I have heard the biggest problem is generally the GIC interrupt control=
ler, so I was wondering if it is possible to run Xen on these boards? Once =
I have confirmation I can make the purchase to continue my thesis. It would=
 be a shame to buy unsupported hardware to start with.


Many thanks in advance!


Pieter Dewachter

--_000_151713783194178119studentkuleuvenbe_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Dear developers,</p>
<p><br>
</p>
<p>&#8203;I'm doing my master thesis this year and I will be using the Xen =
hypervisor for it.&nbsp;<span style=3D"font-size: 12pt;">The domain for my =
thesis is more about the automotive sector, but unfortunately the hardware =
is too expensive to actually use the automotive
 drivers for Xen.</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">The goal is to set up a failover cluste=
r&nbsp;by using two different processors, but the first goal is to actually=
 run Xen on them. Due to the limited budget, we were looking at this develo=
pment board specifically:</span></p>
<p><span style=3D"font-size: 12pt;"><a href=3D"https://www.mouser.be/produc=
tdetail/nxp-freescale/frdm-ls1012a-pa?qs=3DsGAEpiMZZMtw0nEwywcFgPq18vRUkOhr=
FGI4%252bz5xG70HM4YISmdecw">https://www.mouser.be/productdetail/nxp-freesca=
le/frdm-ls1012a-pa?qs=3DsGAEpiMZZMtw0nEwywcFgPq18vRUkOhrFGI4%252bz5xG70HM4Y=
ISmdecw=3D=3D</a><br>
</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">This is a board based on a single&nbsp;=
Cortex&nbsp;A53 implemented by NXP, more details can be found here:</span><=
/p>
<p><span style=3D"font-size: 12pt;"><a href=3D"https://www.nxp.com/products=
/processors-and-microcontrollers/arm-based-processors-and-mcus/qoriq-layers=
cape-arm-processors/qoriq-layerscape-1012a-low-power-communication-processo=
r:LS1012A">https://www.nxp.com/products/processors-and-microcontrollers/arm=
-based-processors-and-mcus/qoriq-layerscape-arm-processors/qoriq-layerscape=
-1012a-low-power-communication-processor:LS1012A</a>&#8203;<br>
</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">Now I have heard the biggest problem is=
 generally the GIC interrupt controller, so I was wondering if it is possib=
le to run Xen on these boards? Once I have confirmation I can make the purc=
hase to continue my thesis. It would
 be a shame to buy unsupported hardware to start with.</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">Many thanks in advance!</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">Pieter Dewachter</span></p>
</body>
</html>

--_000_151713783194178119studentkuleuvenbe_--


--===============0578406473019482759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0578406473019482759==--
