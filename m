From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Subject: [bug]xen 4.10 + dom0 4.15 couldn't boot up
Date: Mon, 29 Jan 2018 05:28:14 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC1C703026@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2728838183652548689=="
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
To: Xen-devel <xen-devel@lists.xen.org>
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
List-Id: xen-devel@lists.xenproject.org

--===============2728838183652548689==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8082FF9BCB2B054996454E47167FF4EC1C703026SHSMSX104ccrcor_"

--_000_8082FF9BCB2B054996454E47167FF4EC1C703026SHSMSX104ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Today I found xen 4.10 (or staging branch) with dom0 4.15 kernel, dom0 coul=
dn't boot up and it print the following error, is it a known issue ?
(XEN) ..................................done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input t=
o Xen)
(XEN) Freed 460kB init memory
(XEN) d0v0 Unhandled page fault fault/trap [#14, ec=3D0000]
(XEN) Pagetable walk from 0000000000000028:
(XEN)  L4[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN) domain_crash_sync called from entry.S: fault at ffff82d0803530e4 x86_=
64/entry.S#create_bounce_frame+0x135/0x151
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.11-unstable  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e033:[<ffffffff8103f78b>]
(XEN) RFLAGS: 0000000000000292   EM: 1   CONTEXT: pv guest (d0v0)
(XEN) rax: 0000000000000000   rbx: ffffffff81e06020   rcx: 0000000000000000
(XEN) rdx: 0000000000000000   rsi: ffffffff82403e90   rdi: ffffffff82403e8c
(XEN) rbp: ffffffff82403ec8   rsp: ffffffff82403e10   r8:  ffffffff82403f00
(XEN) r9:  00000000ffffffff   r10: ffffffff82403f04   r11: 0000000000000000
(XEN) r12: ffffffff82403e88   r13: ffffffff82403e78   r14: ffffffff82403e80
(XEN) r15: ffffffff82403e84   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 000000040eb66000   cr2: 0000000000000028
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=3Dffffffff82403e10:
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffffffff8103f78=
b
(XEN)    000000010000e030 0000000000010092 ffffffff82403e58 000000000000e02=
b
(XEN)    0000000000000000 ffffffff826591e0 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 ffffffff826591e0 ffffffff82403f0=
4
(XEN)    ffffffff82403f00 ffffffff82403efc ffffffff82403ef8 ffffffff82403f4=
0
(XEN)    ffffffff81040343 ffffffff82403f14 ffffffff82403f10 ffffffff82403f0=
c
(XEN)    ffffffff82403f08 0000000000003027 0000000000000000 000000008000000=
8
(XEN)    0000000000000000 ffffffff81032100 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 ffffffff82403ff8 ffffffff826ac35=
d
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0f00000060c0c748 ccccccccccccc30=
5
(XEN)    cccccccccccccccc cccccccccccccccc cccccccccccccccc ccccccccccccccc=
c
(XEN)    cccccccccccccccc cccccccccccccccc cccccccccccccccc ccccccccccccccc=
c
(XEN)    cccccccccccccccc cccccccccccccccc cccccccccccccccc ccccccccccccccc=
c
(XEN)    cccccccccccccccc cccccccccccccccc cccccccccccccccc ccccccccccccccc=
c
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
(XEN) APIC error on CPU0: 40(00)
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

Xen 4.9 + dom0 4.15 is OK.
Xen 4.10 + dom0 4.14 is also OK.
Only Xen 4.10 + dom0 4.15 has such issue.

thanks

--_000_8082FF9BCB2B054996454E47167FF4EC1C703026SHSMSX104ccrcor_
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
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Today I found xen 4.10 (or stag=
ing branch) with dom0 4.15 kernel, dom0 couldn&#8217;t boot up and it print=
 the following error, is it a known issue ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) .........................=
.........done.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Std. Loglevel: All<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Guest Loglevel: All<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Xen is relinquishing VGA =
console.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) *** Serial input -&gt; DO=
M0 (type 'CTRL-a' three times to switch input to Xen)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Freed 460kB init memory<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) d0v0 Unhandled page fault=
 fault/trap [#14, ec=3D0000]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Pagetable walk from 00000=
00000000028:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp; L4[0x000] =3D 00000=
00000000000 ffffffffffffffff<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) domain_crash_sync called =
from entry.S: fault at ffff82d0803530e4 x86_64/entry.S#create_bounce_frame&=
#43;0x135/0x151<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Domain 0 (vcpu#0) crashed=
 on cpu#0:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) ----[ Xen-4.11-unstable&n=
bsp; x86_64&nbsp; debug=3Dn&nbsp;&nbsp; Not tainted ]----<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) CPU:&nbsp;&nbsp;&nbsp; 0<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) RIP:&nbsp;&nbsp;&nbsp; e0=
33:[&lt;ffffffff8103f78b&gt;]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) RFLAGS: 0000000000000292&=
nbsp;&nbsp; EM: 1&nbsp;&nbsp; CONTEXT: pv guest (d0v0)<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) rax: 0000000000000000&nbs=
p;&nbsp; rbx: ffffffff81e06020&nbsp;&nbsp; rcx: 0000000000000000<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) rdx: 0000000000000000&nbs=
p;&nbsp; rsi: ffffffff82403e90&nbsp;&nbsp; rdi: ffffffff82403e8c<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) rbp: ffffffff82403ec8&nbs=
p;&nbsp; rsp: ffffffff82403e10&nbsp;&nbsp; r8:&nbsp; ffffffff82403f00<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) r9:&nbsp; 00000000fffffff=
f&nbsp;&nbsp; r10: ffffffff82403f04&nbsp;&nbsp; r11: 0000000000000000<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) r12: ffffffff82403e88&nbs=
p;&nbsp; r13: ffffffff82403e78&nbsp;&nbsp; r14: ffffffff82403e80<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) r15: ffffffff82403e84&nbs=
p;&nbsp; cr0: 000000008005003b&nbsp;&nbsp; cr4: 00000000003526e0<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) cr3: 000000040eb66000&nbs=
p;&nbsp; cr2: 0000000000000028<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) fsb: 0000000000000000&nbs=
p;&nbsp; gsb: 0000000000000000&nbsp;&nbsp; gss: 0000000000000000<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) ds: 0000&nbsp;&nbsp; es: =
0000&nbsp;&nbsp; fs: 0000&nbsp;&nbsp; gs: 0000&nbsp;&nbsp; ss: e02b&nbsp;&n=
bsp; cs: e033<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Guest stack trace from rs=
p=3Dffffffff82403e10:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 ffffffff8103f78b<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
10000e030 0000000000010092 ffffffff82403e58 000000000000e02b<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 ffffffff826591e0 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 ffffffff826591e0 ffffffff82403f04<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) &nbsp;&nbsp;&nbsp;fffffff=
f82403f00 ffffffff82403efc ffffffff82403ef8 ffffffff82403f40<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; fffffff=
f81040343 ffffffff82403f14 ffffffff82403f10 ffffffff82403f0c<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; fffffff=
f82403f08 0000000000003027 0000000000000000 0000000080000008<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 ffffffff81032100 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 ffffffff82403ff8 ffffffff826ac35d<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; 0000000=
000000000 0000000000000000 0f00000060c0c748 ccccccccccccc305<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; ccccccc=
ccccccccc cccccccccccccccc cccccccccccccccc cccccccccccccccc<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; ccccccc=
ccccccccc cccccccccccccccc cccccccccccccccc cccccccccccccccc<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; ccccccc=
ccccccccc cccccccccccccccc cccccccccccccccc cccccccccccccccc<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN)&nbsp;&nbsp;&nbsp; ccccccc=
ccccccccc cccccccccccccccc cccccccccccccccc cccccccccccccccc<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Hardware Dom0 crashed: re=
booting machine in 5 seconds.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) APIC error on CPU0: 40(00=
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(XEN) Resetting with ACPI MEMOR=
Y or I/O RESET_REG.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Xen 4.9 &#43; dom0 4.15 is OK.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Xen 4.10 &#43; dom0 4.14 is als=
o OK.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Only Xen 4.10 &#43; dom0 4.15 h=
as such issue.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thanks<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_8082FF9BCB2B054996454E47167FF4EC1C703026SHSMSX104ccrcor_--


--===============2728838183652548689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2728838183652548689==--
