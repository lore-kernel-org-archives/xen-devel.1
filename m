From: "Hao, Xudong" <xudong.hao@intel.com>
Subject: Xen 4.11.0 RC5 test result
Date: Tue, 5 Jun 2018 08:47:26 +0000
Message-ID: <B8376D2DEA074F45BA033984477C453E3BA35829@shsmsx102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5809821177660775779=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============5809821177660775779==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B8376D2DEA074F45BA033984477C453E3BA35829shsmsx102ccrcor_"

--_000_B8376D2DEA074F45BA033984477C453E3BA35829shsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We performed Xen 4.11 RC5 testing on Intel Xeon Skylake, Broadwell server, =
Intel Atom Denverton platforms, verified many functional features, which in=
clude new feature MBA on Xen 4.11. We'd like to share the result out.

Except Nested, other feature all passed of testing.
https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen

We also integrated XTF into our testing, 65 xtf cases run pass on those Int=
el platforms above.

Features

Test Result

MBA

Pass

Local MCE

Pass

UMIP

Pass

AVX512

Pass

Protection keys

Pass

Altp2m

Pass

RDT(CMT, CAT, CDP, MBM, L2 CAT)

Pass

VT-d PI

Pass

XSAVES

Pass

MPX

Pass

PML (Page-modification Logging)

Pass

Nested

Buggy

VT-d/SR-IOV

Pass

RAS

Pass

ACPI

Pass



Best Regards,
Xudong






--_000_B8376D2DEA074F45BA033984477C453E3BA35829shsmsx102ccrcor_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">We performed Xen 4.11 RC5 testing on Intel Xeon Skyl=
ake, Broadwell server, Intel Atom Denverton platforms, verified many functi=
onal features, which include new feature MBA on Xen 4.11. We&#8217;d like t=
o share the result out.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Except Nested, other feature all passed of testing.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.xenproject.org/wiki/Nested_V=
irtualization_in_Xen">https://wiki.xenproject.org/wiki/Nested_Virtualizatio=
n_in_Xen</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We also integrated XTF into our testing, 65 xtf case=
s run pass on those Intel platforms above.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"0" style=3D"width:388.0pt;margin-left:.2pt;border-collapse:=
collapse">
<tbody>
<tr style=3D"height:15.0pt">
<td width=3D"351" style=3D"width:263.2pt;border:solid windowtext 1.0pt;back=
ground:#8EAADB;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><b><span style=3D"color:black">Features<o:p></o:p></=
span></b></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border:solid black 1.0pt;border-le=
ft:none;background:#8EAADB;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><b><span style=3D"color:black">Test Result<o:p></o:p=
></span></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">MBA<o:p></o:p></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<o:p></o:p></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">Local MCE<o:p></o:p></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<o:p></o:p></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">UMIP<o:p></o:p></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<o:p></o:p></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">AVX512<span style=3D"color:black"><o:p></o:p></span>=
</p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">Protection keys<span style=3D"color:black"><o:p></o:=
p></span></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">Altp2m<span style=3D"color:black"><o:p></o:p></span>=
</p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">RDT(CMT, CAT, CDP, MBM, L2 CAT)<span style=3D"color:=
black"><o:p></o:p></span></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:#A6A6A6"><o:p></o:p></sp=
an></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">VT-d PI<o:p></o:p></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<o:p></o:p></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">XSAVES<span style=3D"color:black"><o:p></o:p></span>=
</p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">MPX<span style=3D"color:black"><o:p></o:p></span></p=
>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">PML (Page-modification Logging)<span style=3D"color:=
black"><o:p></o:p></span></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">Nested<span style=3D"color:black"><o:p></o:p></span>=
</p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Buggy<span style=3D"color:black"><o:p></o:p></spa=
n></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid black 1.0pt;border-to=
p:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">VT-d/SR-IOV<span style=3D"color:black"><o:p></o:p></=
span></p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:wh=
ite;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border-top:none;border-left:solid =
black 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid black 1=
.0pt;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">RAS<span style=3D"color:black"><o:p></o:p></span></p=
>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;backgrou=
nd:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
<tr style=3D"height:.3in">
<td width=3D"351" style=3D"width:263.2pt;border:solid windowtext 1.0pt;bord=
er-top:none;background:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal">ACPI<span style=3D"color:black"><o:p></o:p></span></=
p>
</td>
<td width=3D"166" style=3D"width:124.8pt;border-top:none;border-left:none;b=
order-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;bac=
kground:white;padding:0in 5.4pt 0in 5.4pt;height:.3in">
<p class=3D"MsoNormal"><b>Pass<span style=3D"color:black"><o:p></o:p></span=
></b></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Xudong<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_B8376D2DEA074F45BA033984477C453E3BA35829shsmsx102ccrcor_--


--===============5809821177660775779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5809821177660775779==--
