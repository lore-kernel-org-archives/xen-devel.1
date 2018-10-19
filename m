From: "Vasile, Alexandru-catalin" <lexnv@amazon.com>
Subject: dom0/pvh: Dom0 PVH with PCI passthrough support status
Date: Fri, 19 Oct 2018 16:08:45 +0000
Message-ID: <1539965325190.3407@amazon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6382523240928909717=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eqxq=m7=amazon.com=prvs=8236c9450=lexnv@srs-us1.protection.inumbo.net>)
 id 1gDXKW-0007Lu-Jl
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 16:08:52 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6382523240928909717==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_15399653251903407amazoncom_"

--_000_15399653251903407amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to use Dom0 with PVH mode together with PCI passthrough in ord=
er to compare PVH and HVM in a real test scenario for early adoption of PVH=
. The minimum setup needed is to have the possibility to assign to a domain=
 a PCI device that is passthrough.

Are there any patches in review or previous discussions on having PCI passt=
hrough in Dom0 PVH?

Our internal tests showed promising results regarding performance (no PCI p=
assthrough), but nonetheless as expected in this early stage of development=
 a small decrease between 2.5 - 10%. Sacrificing performance for a boost in=
 security offered by PVH should be a priority. For the final results to be =
conclusive and have a fair comparison, it is necessary to have a rough impl=
ementation of PCI passthrough (e.g. for a network device).

Any help towards this matter would be greatly appreciated.

Thanks,
Alex






Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--_000_15399653251903407amazoncom_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} p
	{margin-top:0;
	margin-bottom:0}
a:link
	{color:rgb(0,0,128);
	text-decoration:underline}p
	{margin-bottom:0.1in;
	line-height:115%;
	background:transparent none repeat scroll 0% 0%}
a:link
	{color:rgb(0,0,128);
	text-decoration:underline}--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<style type=3D"text/css">
<!--
p
	{margin-bottom:0.1in;
	line-height:115%;
	background:transparent none repeat scroll 0% 0%}
a:link
	{color:rgb(0,0,128);
	text-decoration:underline}
-->
</style>
<p>Hello,<br>
<br>
I would like to use Dom0 with PVH mode together with PCI passthrough in ord=
er to compare PVH and HVM in a real test scenario for early adoption of PVH=
. The minimum setup needed is to have the possibility to assign to a domain=
 a PCI device that is passthrough.<br>
<br>
Are there any patches in review or previous discussions on having PCI passt=
hrough in Dom0 PVH?<br>
<br>
Our internal tests showed promising results regarding performance (no PCI p=
assthrough), but nonetheless as expected in this early stage of development=
 a small decrease between 2.5 &#8211; 10%. Sacrificing performance for a bo=
ost in security offered by PVH should
 be a priority. For the final results to be conclusive and have a fair comp=
arison, it is necessary to have a rough implementation of PCI passthrough (=
e.g. for a network device).<br>
<br>
Any help towards this matter would be greatly appreciated.<br>
<br>
Thanks,<br>
Alex<br>
<br>
<br>
</p>
<p><br>
</p>
<p></p>

<p><br>
Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.</p>
</body>
</html>

--_000_15399653251903407amazoncom_--



--===============6382523240928909717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6382523240928909717==--
