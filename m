From: Man Chon Kuok <manchonkuok@gmail.com>
Subject: Dynamic Disassembling domU Instructions
Date: Thu, 4 Jan 2018 17:17:28 -1000
Message-ID: <CAJnNCGMXY6+pGrp+Vb7nxucKGZxyrZPS8SDRsZNCv0Njw+YYiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7790599314317835292=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fnaf=ea=gmail.com=manchonkuok@srs-us1.protection.inumbo.net>)
 id 1eXIVf-0006Eg-GC
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 03:17:31 +0000
Received: by mail-io0-x22a.google.com with SMTP id v30so4373547iov.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 19:17:30 -0800 (PST)
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

--===============7790599314317835292==
Content-Type: multipart/alternative; boundary="f403043cc2747526950561fee3b8"

--f403043cc2747526950561fee3b8
Content-Type: text/plain; charset="UTF-8"

Greeting,

I am trying to modify Xen 4.8 to have it print out the opcode as well as
some registers of an HVM domU as it runs. I tried to modify
xen/arch/x86/hvm/emulate.c 's hvmemul_insn_fetch to output the content in
hvmemul_ctxt->insn_buf with printk. In hvmemul_insn_fetch, it seems that a
lot of the requested bytes are cached, does the domU's OS repeatedly calls
the same instruction region over and over again?

If xen/arch/x86/hvm/emulate.c is not the right file / function to look at,
I was wondering if someone can point me to the correct file / functions to
look into modifying.

Lastly, I am using printk to log the opcodes. Ideally I would want the
opcode to be written to a separate file, but I read that it is not good to
do any file access in kernel programming. Are there other alternatives or
util functions that I should consider using?

P.S. This is a test environment, so it can be assumed that only one VM will
be created at any given time.

Best,
Man Chon

--f403043cc2747526950561fee3b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Greeting,<br><br></div>I am trying to =
modify Xen 4.8 to have it print out the opcode as well as some registers of=
 an HVM domU as it runs. I tried to modify xen/arch/x86/hvm/emulate.c &#39;=
s hvmemul_insn_fetch to output the content in hvmemul_ctxt-&gt;insn_buf wit=
h printk. In hvmemul_insn_fetch, it seems that a lot of the requested bytes=
 are cached, does the domU&#39;s OS repeatedly calls the same instruction r=
egion over and over again? <br></div><div><br></div><div>If xen/arch/x86/hv=
m/emulate.c is not the right file / function to look at, I was wondering if=
 someone can point me to the correct file / functions to look into modifyin=
g. <br></div><div><br></div><div>Lastly, I am using printk to log the opcod=
es. Ideally I would want the opcode to be written to a separate file, but I=
 read that it is not good to do any file access in kernel programming. Are =
there other alternatives or util functions that I should consider using?<br=
></div><div><br></div>P.S. This is a test environment, so it can be assumed=
 that only one VM will be created at any given time. <br><br></div>Best,<br=
></div>Man Chon<br></div>

--f403043cc2747526950561fee3b8--


--===============7790599314317835292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7790599314317835292==--
