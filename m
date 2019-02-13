From: Rich Persaud <persaur@gmail.com>
Subject: Macro supply chains
Date: Wed, 13 Feb 2019 05:08:54 -0500
Message-ID: <A5B99D39-F6B3-462D-885C-1303CE0B0193@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============4313073192344534944=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1qi=QU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1gtrTO-0004Sn-8t
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 10:08:58 +0000
Received: by mail-it1-x12c.google.com with SMTP id i2so4396816ite.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Feb 2019 02:08:57 -0800 (PST)
Received: from [100.64.72.7] ([173.245.215.249])
 by smtp.gmail.com with ESMTPSA id c13sm7232847iod.69.2019.02.13.02.08.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 02:08:55 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4313073192344534944==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-D3545CBE-7E30-4349-A028-B89D91391658


--Apple-Mail-D3545CBE-7E30-4349-A028-B89D91391658
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Synopsys, which owns both Coverity and Black Duck, wrote about software supp=
ly-chain integrity for a library with almost two million downloads per week:=


"EventStream, a highly popular JavaScript library, was compromised with the a=
ddition of a third-party dependency, flatmap-stream, containing encrypted ma=
licious code. The attack targeted other Node.js libraries used in cryptocurr=
ency wallets."
"Keep a bill of materials (BoM), a list of components and dependencies in yo=
ur codebase. Just knowing what your code depends on will help make you aware=
 of the third-party risks that you might be exposed to."

Are there existing best practices for tracking and maintaining macros which o=
riginated in other open-source communities, e.g. QEMU or Linux?  Some Xen ma=
cros have diverged [2][3][4] from the versions used by other communities.  W=
ould such macros benefit from a documented relationship with upstream, e.g.

- "Ignore upstream changes"
- "Mirror upstream changes"
- "Review upstream changes"

For the latter case, build/test tooling could trigger manual macro review wh=
en a change is detected in an upstream dependency.  Which other cases should=
 be considered?

Rich

[1] Compromised npm packages lead to supply chain attack

https://www.synopsys.com/blogs/software-security/malicious-dependency-supply=
-chain/

https://github.com/dominictarr/event-stream/issues/116

[2] bitops.h

http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/b=
itops.h;h=3Da103e490894829a445cc743b98f8956b7d44e022;hb=3DHEAD

https://github.com/torvalds/linux/commits/master/arch/x86/include/asm/bitops=
.h

[3] list.h

http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/l=
ist.h;h=3D1387abb21192668f4103620520cf4256902a45aa;hb=3DHEAD

https://github.com/torvalds/linux/commits/master/include/linux/list.h

[4] delay.h

http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/d=
elay.h;h=3D9d70ef035fc20bb6708a5ff33eb83a55c6ad460c;hb=3DHEAD

https://github.com/torvalds/linux/commits/master/include/linux/delay.h



--Apple-Mail-D3545CBE-7E30-4349-A028-B89D91391658
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><div dir=3D"l=
tr"><span></span></div><div dir=3D"ltr"><span>Synopsys, which owns both Cove=
rity and Black Duck, wrote about software supply-chain integrity for a libra=
ry with almost two million downloads per week:</span><br><span></span><br><s=
pan>"EventStream, a highly popular JavaScript library, was compromised with t=
he addition of a third-party dependency, flatmap-stream, containing encrypte=
d malicious code. The attack targeted other Node.js libraries used in crypto=
currency wallets."</span><br><span>"Keep a bill of materials (BoM), a list o=
f components and dependencies in your codebase. Just knowing what your code d=
epends on will help make you aware of the third-party risks that you might b=
e exposed to."</span><br><span></span><br><span>Are there existing best prac=
tices for tracking and maintaining macros which originated in other open-sou=
rce communities, e.g. QEMU or Linux? &nbsp;Some Xen macros have diverged [2]=
[3][4] from the versions used by other communities. &nbsp;Would such macros b=
enefit from a documented relationship with upstream, e.g.</span><br><span></=
span><br><span> - "Ignore upstream changes"</span><br><span> - "Mirror upstr=
eam changes"</span><br><span> - "Review upstream changes"</span><br><span></=
span><br><span>For the latter case, build/test tooling could trigger manual m=
acro review when a change is detected in an upstream dependency. &nbsp;Which=
 other cases should be considered?</span><br><span></span><br><span>Rich</sp=
an><br><span></span><br><span>[1] Compromised npm packages lead to supply ch=
ain attack</span></div><div dir=3D"ltr"><span><br></span></div><div dir=3D"l=
tr"><span><a href=3D"https://www.synopsys.com/blogs/software-security/malici=
ous-dependency-supply-chain/">https://www.synopsys.com/blogs/software-securi=
ty/malicious-dependency-supply-chain/</a></span></div><div dir=3D"ltr"><br><=
a href=3D"https://github.com/dominictarr/event-stream/issues/116">https://gi=
thub.com/dominictarr/event-stream/issues/116</a></div><div dir=3D"ltr"><br><=
span>[2] bitops.h</span><br><span></span><br><span><a href=3D"http://xenbits=
.xen.org/gitweb/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/bitops.h;h=3Da1=
03e490894829a445cc743b98f8956b7d44e022;hb=3DHEAD">http://xenbits.xen.org/git=
web/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/bitops.h;h=3Da103e490894829=
a445cc743b98f8956b7d44e022;hb=3DHEAD</a></span><br><span></span><br><span><a=
 href=3D"https://github.com/torvalds/linux/commits/master/arch/x86/include/a=
sm/bitops.h">https://github.com/torvalds/linux/commits/master/arch/x86/inclu=
de/asm/bitops.h</a></span><br><span></span><br><span>[3] list.h</span><br><s=
pan></span><br><span><a href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dhistory;f=3Dxen/include/xen/list.h;h=3D1387abb21192668f4103620520cf425690=
2a45aa;hb=3DHEAD">http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dhistory;f=3D=
xen/include/xen/list.h;h=3D1387abb21192668f4103620520cf4256902a45aa;hb=3DHEA=
D</a></span><br><span></span><br><span><a href=3D"https://github.com/torvald=
s/linux/commits/master/include/linux/list.h">https://github.com/torvalds/lin=
ux/commits/master/include/linux/list.h</a></span><br><span></span><br><span>=
[4] delay.h</span><br><span></span><br><span><a href=3D"http://xenbits.xen.o=
rg/gitweb/?p=3Dxen.git;a=3Dhistory;f=3Dxen/include/xen/delay.h;h=3D9d70ef035=
fc20bb6708a5ff33eb83a55c6ad460c;hb=3DHEAD">http://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dhistory;f=3Dxen/include/xen/delay.h;h=3D9d70ef035fc20bb6708a5ff3=
3eb83a55c6ad460c;hb=3DHEAD</a></span><br><span></span><br><span><a href=3D"h=
ttps://github.com/torvalds/linux/commits/master/include/linux/delay.h">https=
://github.com/torvalds/linux/commits/master/include/linux/delay.h</a></span>=
<br></div><div dir=3D"ltr"><span><br></span></div><div dir=3D"ltr"><span><br=
></span></div></div></div></body></html>=

--Apple-Mail-D3545CBE-7E30-4349-A028-B89D91391658--


--===============4313073192344534944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4313073192344534944==--
