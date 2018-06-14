From: "Chenjia (C)" <chenjia09@huawei.com>
Subject: Is there a faster way to restore Virtual machine status
 in Xen?
Date: Thu, 14 Jun 2018 02:26:29 +0000
Message-ID: <193BC0700AA2F44A8843B8D1C1E6B618D51A7955@nkgeml514-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8051049314058048147=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xbwn=ja=huawei.com=chenjia09@srs-us1.protection.inumbo.net>)
 id 1fTI0d-0002I8-KJ
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 02:29:11 +0000
Received: from nkgeml411-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 0C14CBA90F32
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 10:26:36 +0800 (CST)
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "wangxu (R)" <wangxu0@huawei.com>, "Shentao (Terry)" <shentao8@huawei.com>, zhaobingjian <zhaobingjian@huawei.com>
List-Id: xen-devel@lists.xenproject.org

--===============8051049314058048147==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_193BC0700AA2F44A8843B8D1C1E6B618D51A7955nkgeml514mbxchi_"

--_000_193BC0700AA2F44A8843B8D1C1E6B618D51A7955nkgeml514mbxchi_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RGVhciBYRU4gZXhwZXJ0o7oNCiAgICAgICAgICAgIFdlIG1lZXQgc29tZSBwcm9ibGVtIGluIG91
ciBwcm9qZWN0OiBJbiBvdXIgcHJldmlvdXMgcHJvamVjdCwgd2UgdXNlIEtWTSwgYW5kIHdlIGRv
IHNvbWUgam9iIGxpa2UgdGhpczoNCg0KV2UgY3JlYXRlIEtWTSBzbmFwc2hvdCBieSChsHZpcnNo
IHNuYXBzaG90LWNyZWF0ZSAkRG9tYWluTmFtZSAkU25hcHNob3RYbWyhsSwgdGhlbiBkbyBmb2xs
b3dpbmcgam9iOg0KV2hpbGUoMSkNCnsNClJ1biChsHZpcnNoIHNuYXBzaG90LXJldmVydCAkRG9t
YWluTmFtZSAgJFNuYXBzaG90IC0tcnVubmluZyAtLWZvcmNlobENCkRvIHNvbWUgam9iIGluIDMw
IHNlY2VuZHMNCn0NCg0KDQogICAgICAgICAgICBOb3cgb3VyIHByb2plY3QgaXMgbW92ZSB0byBY
ZW4sIHNvIHdlIG5lZWQgdG8gZG8gc2FtZSB0aGluZyBsaWtlIGluIEtWTSwgYnV0IHdlIGZvdW5k
IHRoYXQgdGhlcmUgaXMgbm8gobBTbmFwc2hvdKGxIGluIHhlbiAsIHNvIHdlIGNoYW5nZSB0aGUg
am9iIGxpa2UgdGhpcyBpbiB4ZW46DQogICAgICAgICAgICBXaGlsZSgxKQ0Kew0KICAgICAgICAg
ICAgICAgICAgICAgICAgUnVuIKGweGwgZGVzdHJveSB3aW43X2NoZWNrcG9pbnRGaWxlobENCiAg
ICAgICAgICAgICAgICAgICAgICAgIFJ1biChsHhsIHJlc3RvcmUgIHdpbjdfY2hlY2twb2ludEZp
bGWhsQ0KICAgICAgICAgICAgICAgICAgICAgICAgRG8gc29tZSBqb2IgaW4gMzAgc2VjZW5kcw0K
fQ0KDQogICAgICAgICAgICBXZSBmb3VuZCB0aGF0obEgeGwgZGVzdHJveSChsGFuZCChsHhsIHJl
c3RvcmWhsSBzcGVuZCAxMCB0aW1lcyBsb25nZXIgdGhhbiChsHZpcnNoIHNuYXBzaG90LXJldmVy
dKGxLCAgaXQgaXMgdW5hY2NlcHRhYmxlIGluIG91ciBwcm9qZWN0DQoNCiAgICAgICAgICAgIFNv
IG91ciBxdWVzdGlvbiBpcyB0aGF0OiBJcyB0aGVyZSBhIGZhc3RlciB3YXkgdG8gcmVzdG9yZSBW
aXJ0dWFsIG1hY2hpbmUgc3RhdHVzIGluIFhlbj8NCg0KDQoNCiAgICAgICAgICAgICAgICBPdXIg
ZW52aXJvbm1lbnQ6DQogICAgICAgICAgICBDUFU6IGludGVsIHhlb24gRTUyNjIwIDIuNDBHSHog
d2l0aCAyNCBjb3JlLA0KbWVtb3J5IDogMjU2RywNClNTRCBoYXJkIGRpc2suDQpIb3N0IG1hY2hp
bmU6IHN1c2UxMg0KeGVuX3ZlcnNpb246IDQuOC4yDQpUaGUgVk0gaXMgV2luNyBPUyB3aXRoIDJH
IG1lbW9yeQ0KDQpCZXN0IHJlZ2FyZHMNCg0K

--_000_193BC0700AA2F44A8843B8D1C1E6B618D51A7955nkgeml514mbxchi_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.HTMLChar
	{mso-style-name:"HTML =D4=A4=C9=E8=B8=F1=CA=BD Char";
	mso-style-priority:99;
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1698044016;
	mso-list-type:hybrid;
	mso-list-template-ids:-1975347188 540172936 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:%1=A1=A2;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:109.5pt;
	text-indent:-18.0pt;
	mso-fareast-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:145.5pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:181.5pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:217.5pt;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:253.5pt;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:289.5pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:325.5pt;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:361.5pt;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:397.5pt;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Dear XEN expert</sp=
an><span lang=3D"ZH-CN" style=3D"font-size:14.0pt;font-family:=CB=CE=CC=E5"=
>=A3=BA</span><span style=3D"font-size:14.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We meet some problem in our=
 project: In our previous project, we use KVM, and we do some job like this=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">We create KVM snapshot by =A1=B0virsh snapshot-create $DomainName=
 $SnapshotXml=A1=B1, then do following job:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">While(1)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt;text-indent:36.0pt"><spa=
n style=3D"font-size:14.0pt">Run =A1=B0virsh snapshot-revert $DomainName &n=
bsp;$Snapshot --running --force=A1=B1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt;text-indent:36.0pt"><spa=
n style=3D"font-size:14.0pt">Do some job in 30 secends<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now our project is move to =
Xen, so we need to do same thing like in KVM, but we found that there is no=
 =A1=B0Snapshot=A1=B1 in xen , so we change the job like this in xen:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; While(1)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><span style=3D"font-siz=
e:14.0pt">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Run =A1=B0xl destroy win7_checkpoin=
tFile=A1=B1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Run =A1=B0xl restore &nbsp;win7_che=
ckpointFile=A1=B1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Do some job in 30 secends<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><span style=3D"font-siz=
e:14.0pt">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We found that=A1=B1 xl dest=
roy =A1=B0and =A1=B0xl restore=A1=B1 spend 10 times longer than =A1=B0virsh=
 snapshot-revert=A1=B1, &nbsp;it is unacceptable in our project<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So our question is that: Is=
 there a faster way to restore Virtual machine status in Xen?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<pre><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;</span><span style=3D"color:black"><o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span=
><span style=3D"font-size:14.0pt">Our environment:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CPU: intel xeon E52620 2.40=
GHz with 24 core,&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">memory : 256G,
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">SSD hard disk.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">Host machine: suse12<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">xen_version: 4.8.2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt">The VM is Win7 OS with 2G memory<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:14.0pt"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Best regards<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
</body>
</html>

--_000_193BC0700AA2F44A8843B8D1C1E6B618D51A7955nkgeml514mbxchi_--


--===============8051049314058048147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8051049314058048147==--
