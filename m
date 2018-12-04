From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Mapping discontiguous virtual memory ranges
Date: Mon, 3 Dec 2018 23:05:08 -0800
Message-ID: <CAAd-cWON2fo8RnrHsjw8HYg8ZqAe+3cwK0ZUywcJDmcN7CFcGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0819173545141113048=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jlmu=on=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1gU4lm-0006Ht-7F
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 07:05:22 +0000
Received: by mail-yw1-xc32.google.com with SMTP id x2so6526691ywc.9
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 23:05:20 -0800 (PST)
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

--===============0819173545141113048==
Content-Type: multipart/alternative; boundary="0000000000007273b6057c2ce394"

--0000000000007273b6057c2ce394
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm currently attempting to add guard pages to a Xen-based unikernel. These
are memory regions that cannot be read, written, or executed, could be
potentially ones up to 1MB in size, and would, for instance, separate the
stack and the heap to prevent buffer overflows and stack clashes.

Ideally, since the guard pages can't be accessed in any way, I'd like to
avoid taking up as much "physical" memory as would be necessary to
accommodate the guard pages. The best way I can think of to implement this,
then, is to make the sections to be guarded discontiguous =E2=80=94 much li=
ke how
the Linux kernel is placed at a very high address in memory, far from the
other memory regions it manages.

In order to do this, I need some way to map discontiguous virtual address
regions to contiguous physical memory: for instance, to map 0x0-0x20000 to
PFNs 0 through 20, and 0x40000-0x80000 to PFNs 20 through 60. I know this
is possible, as Linux is able to do this on Xen, but I have so far been
unable to figure it out. Apologies if I sound a bit confused here, as
documentation is rather scarce, but I'll try to detail as best I can what
I've tried so far, which primarily revolves around two functions, namely:

- HYPERVISOR_update_va_mapping, which sounds like the right function, but
which returns the errno for "invalid argument" when the virtual address I
pass as its first argument is outside the range of what the VAs would be if
they mapped one-to-one to PFNs. For instance, if PFNs 0x0-0x4000 are
actually available to my guest, I would expect to be able to map the VA
that _would_ correspond to PFN 0x4001 in a one-to-one mapping to, say, PFN
0x0. This is not the case, and I'm not sure why. I have not been able to
find substantial documentation on this function.

- HYPERVISOR_mmu_update, which as it understand it takes a struct with the
machine address of the page table entry to modify, and the new contents of
that PTE. However, it looks like Xen gives me a fixed page table size (in
start_info) baed on the actual amount of memory allocated to the guest, so
I'm not sure if there's room on the page table for an entry corresponding
to an arbitrarily high address. That aside, even if that weren't an issue I
don't know how to _get_ the machine address of the PTE to modify, since as
far as I know, translating a VA to a machine address requires that the p2m
table to contain an entry corresponding to that VA, and in this specific
case where I _don't_ want a one-to-one linear mapping, that's not the case.
I'm probably missing something about the address conversion, but have been
unable to find an explanation of how this function is typically used.

If someone here is familiar with these APIs and can point me in the right
direction, that would be greatly appreciated.

--0000000000007273b6057c2ce394
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m current=
ly attempting to add guard pages to a Xen-based unikernel. These are memory=
 regions that cannot be read, written, or executed, could be potentially on=
es up to 1MB in size, and would, for instance, separate the stack and the h=
eap to prevent=C2=A0buffer overflows and stack clashes.</div><div><br></div=
><div>Ideally, since the guard pages can&#39;t be accessed in any way, I&#3=
9;d like to avoid taking up as much &quot;physical&quot; memory as would be=
 necessary to accommodate the guard pages. The best way I can think of to i=
mplement this, then, is to make the sections to be guarded discontiguous =
=E2=80=94 much like how the Linux kernel is placed at a very high address i=
n memory, far from the other memory regions it manages.</div><div><br></div=
><div>In order to do this, I need some way to map discontiguous virtual add=
ress regions to contiguous physical memory: for instance, to map 0x0-0x2000=
0 to PFNs 0 through 20, and 0x40000-0x80000 to PFNs 20 through 60. I know t=
his is possible, as Linux is able to do this on Xen, but I have so far been=
 unable to figure it out. Apologies if I sound a bit confused here, as docu=
mentation is rather scarce, but I&#39;ll try to detail as best I can what I=
&#39;ve tried so far, which primarily revolves around two functions, namely=
:</div><div><br></div><div>-=C2=A0HYPERVISOR_update_va_mapping, which sound=
s like the right function, but which returns the errno for &quot;invalid ar=
gument&quot; when the virtual address I pass as its first argument is outsi=
de the range of what the VAs would be if they mapped one-to-one to PFNs. Fo=
r instance, if PFNs 0x0-0x4000 are actually available to my guest, I would =
expect to be able to map the VA that _would_ correspond to PFN 0x4001 in a =
one-to-one mapping to, say, PFN 0x0. This is not the case, and I&#39;m not =
sure why. I have not been able to find substantial documentation on this fu=
nction.</div><div><br></div><div>- HYPERVISOR_mmu_update, which as it under=
stand it takes a struct with the machine address of the page table entry to=
 modify, and the new contents of that PTE. However, it looks like Xen gives=
 me a fixed page table size (in start_info) baed on the actual amount of me=
mory allocated to the guest, so I&#39;m not sure if there&#39;s room on the=
 page table for an entry corresponding to an arbitrarily high address. That=
 aside, even if that weren&#39;t an issue I don&#39;t know how to _get_ the=
 machine address of the PTE to modify, since as far as I know, translating =
a VA to a machine address requires that the p2m table to contain an entry c=
orresponding to that VA, and in this specific case where I _don&#39;t_ want=
 a one-to-one linear mapping, that&#39;s not the case. I&#39;m probably mis=
sing something about the address conversion, but have been unable to find a=
n explanation of how this function is typically used.</div><div><br></div><=
div>If someone here is familiar with these APIs and can point me in the rig=
ht direction, that would be greatly appreciated.<br></div></div></div>

--0000000000007273b6057c2ce394--


--===============0819173545141113048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0819173545141113048==--
