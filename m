From: Jennifer Herbert <jennifer.herbert@citrix.com>
Subject: Legacy PIC (x86) support (RTC) in dom0 with Linux 4.12
 and newer is broken for some hardware.
Date: Tue, 4 Dec 2018 17:24:08 +0000
Message-ID: <a46c25e311ed4a42a201583709920ab0@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4479491446057027705=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ayjk=on=citrix.com=prvs=86984d89c=jennifer.herbert@srs-us1.protection.inumbo.net>)
 id 1gUEnS-0004AK-7V
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 17:47:46 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============4479491446057027705==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_a46c25e311ed4a42a201583709920ab0AMSPEX02CL03citritenet_"

--_000_a46c25e311ed4a42a201583709920ab0AMSPEX02CL03citritenet_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since Linux 4.12, there has been a commit a1e23a42f1bdc00e32fc4869caef12e4e=
6272f26

"rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs"



The commit effectively disabled requesting IRQ 8 for systems without PIC

controller present (As in the case when used at dom0 under Xen) and at

the same time where this IRQ is not explicitly described in ACPI tables.



I have found hardware without this IRQ in the ACPI tables, and indeed,

found the RTC to be broken in dom 0.  Temporarily, I reverted this

commit, which fixed the problem, but I was wondering if anyone here

knew of a better solution?

Cheers,

-jenny


--_000_a46c25e311ed4a42a201583709920ab0AMSPEX02CL03citritenet_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:Consolas;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<pre>Since Linux 4.12, there has been a commit <span style=3D"font-family:&=
quot;Courier New&quot;">a1e23a42f1bdc00e32fc4869caef12e4e6272f26<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-family:&quot;Courier New&quot;">&#8220;rtc: cmos: =
Do not assume irq 8 for rtc when there are no legacy irqs&#8221;<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p><=
/span></pre>
<pre><span style=3D"font-family:&quot;Courier New&quot;">The commit effecti=
vely disabled requesting IRQ 8 for systems without PIC<o:p></o:p></span></p=
re>
<pre><span style=3D"font-family:&quot;Courier New&quot;">controller present=
 (As in the case when used at dom0 under Xen) and at<o:p></o:p></span></pre=
>
<pre><span style=3D"font-family:&quot;Courier New&quot;">the same time wher=
e this IRQ is not explicitly described in ACPI tables.<o:p></o:p></span></p=
re>
<pre><span style=3D"font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p><=
/span></pre>
<pre><span style=3D"font-family:&quot;Courier New&quot;">I have found hardw=
are without this IRQ in the ACPI tables, and indeed,<o:p></o:p></span></pre=
>
<pre><span style=3D"font-family:&quot;Courier New&quot;">found the RTC to b=
e broken in dom 0.&nbsp; Temporarily, I reverted this<o:p></o:p></span></pr=
e>
<pre><span style=3D"font-family:&quot;Courier New&quot;">commit, which fixe=
d the problem, but I was wondering if anyone here<o:p></o:p></span></pre>
<pre><span style=3D"font-family:&quot;Courier New&quot;">knew of a better s=
olution?<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-jenny<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_a46c25e311ed4a42a201583709920ab0AMSPEX02CL03citritenet_--


--===============4479491446057027705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4479491446057027705==--
