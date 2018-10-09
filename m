From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Mapping HVM guest memory from Dom0
Date: Tue, 9 Oct 2018 15:34:18 -0400
Message-ID: <CAAd-cWOSqZN9LYCRxEYjgCyHq24PFsZqOFE1T_PPnq3HjDGpaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2895818799506498083=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vd+a=mv=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1g9xm2-0007h3-Tx
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 19:34:30 +0000
Received: by mail-io1-xd32.google.com with SMTP id z16-v6so2103034iol.6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Oct 2018 12:34:29 -0700 (PDT)
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

--===============2895818799506498083==
Content-Type: multipart/alternative; boundary="00000000000084e1dd0577d0d300"

--00000000000084e1dd0577d0d300
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm developing an application that runs in Dom0 and needs to read memory
from a guest given a guest address (for instance, reading RIP from the
guest CPU context and then reading the current instruction). I'm using
xenforeignmemory_map() to map the guest memory, but this function takes the
MFN of the guest address to read, not the address itself. Xen does not seem
to have an API for doing the virtual address --> MFN conversion.

I've figured out how to do this for PV guests: map the domain's meminfo
struct and use the PFN for the guest address (i.e. address >>
XC_PAGE_SHIFT) as an index into the P2M table.

However, I am having trouble doing the same for HVM guests. Right now I am
trying to follow the implementation of bg_hvm_va2mfn in
xen/arch/x86/debug.c, but this function uses so many internal Xen functions
it seems I would have to copy tons of code out from Xen, and I'm wondering
if there's a better way. Is there some API I'm missing that lets me to do
the vaddr --> MFN conversion for HVM guests? If not, what is the simplest
way to do this conversion?

Thanks,
Spencer

--00000000000084e1dd0577d0d300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m developing an applicatio=
n that runs in Dom0 and needs to read memory from a guest given a guest add=
ress (for instance, reading RIP from the guest CPU context and then reading=
 the current instruction). I&#39;m using xenforeignmemory_map() to map the =
guest memory, but this function takes the MFN of the guest address to read,=
 not the address itself. Xen does not seem to have an API for doing the vir=
tual address --&gt; MFN conversion.</div><div><br></div><div>I&#39;ve figur=
ed out how to do this for PV guests: map the domain&#39;s meminfo struct an=
d use the PFN for the guest address (i.e. address &gt;&gt; XC_PAGE_SHIFT) a=
s an index into the P2M table.</div><div><br></div><div>However, I am havin=
g trouble doing the same for HVM guests. Right now I am trying to follow th=
e implementation of bg_hvm_va2mfn in xen/arch/x86/debug.c, but this functio=
n uses so many internal Xen functions it seems I would have to copy tons of=
 code out from Xen, and I&#39;m wondering if there&#39;s a better way. Is t=
here some API I&#39;m missing that lets me to do the vaddr --&gt; MFN conve=
rsion for HVM guests? If not, what is the simplest way to do this conversio=
n?</div><div><br></div><div>Thanks,</div><div>Spencer</div></div>

--00000000000084e1dd0577d0d300--


--===============2895818799506498083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2895818799506498083==--
