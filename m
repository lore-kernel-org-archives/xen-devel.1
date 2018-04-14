From: Daniel Reichelt <hacking@nachtgeist.net>
Subject: Re: [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
Date: Sat, 14 Apr 2018 07:55:19 +0200
Message-ID: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6945599424509547429=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aqgh=hd=nachtgeist.net=hacking@srs-us1.protection.inumbo.net>)
 id 1f7E9j-0000y7-Gt
 for xen-devel@lists.xenproject.org; Sat, 14 Apr 2018 05:55:23 +0000
Received: by srv06.itamservices.de with esmtpsa
 (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256) (Exim 4.90_1)
 (envelope-from <hacking@nachtgeist.net>) id 1f7E9f-00056T-Qv
 for <xen-devel@lists.xenproject.org>; Sat, 14 Apr 2018 07:55:19 +0200
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6945599424509547429==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JJNu2uriTXunmaKanTXPNjAmThqGmGvex"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JJNu2uriTXunmaKanTXPNjAmThqGmGvex
Content-Type: multipart/mixed; boundary="FCrubFhpq931fqt3IgpOwsCCaJvpaBkTs";
 protected-headers="v1"
From: Daniel Reichelt <hacking@nachtgeist.net>
To: xen-devel@lists.xenproject.org
Message-ID: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
Subject: Re: [Xen-devel] [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector

--FCrubFhpq931fqt3IgpOwsCCaJvpaBkTs
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi,

the patch v2 solved the issue for me only on amd64, i386 guests keep cras=
hing
with linux 4.15, 4.14 works fine.


XEN host:
- xen 4.8.3
- Debian stretch (tried with linux packages 4.14.0-0.bpo.3-amd64 and
linux-image-4.15.0-0.bpo.2-amd64
- grub-pc package from buster (2.02+dfsg1-4)


XEN guest:
- Debian testing 32bit
- booted via Debian's /usr/lib/grub-xen/grub-i386-xen.bin (buster, see XE=
N host)
- linux-image-4.14.0-0.bpo.3-686-pae and earlier work fine
--> linux-image-4.15.0-2-686-pae: boot aborts right after pvgrub
launches the kernel, no output to the xen-guest console logfile. Whereas
on the XEN host's serial console I see output similar to [1]:


Try #1:
--------8<-----------------------------------
(XEN) d9v0: unhandled page fault (ec=3D0000)
(XEN) Pagetable walk from 0000000000000014:
(XEN)  L4[0x000] =3D 000000028903b027 0000000000001e3b
(XEN)  L3[0x000] =3D 000000028904d027 0000000000001e4d
(XEN)  L2[0x000] =3D 000000028904e023 0000000000001e4e
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN) domain_crash_sync called from entry.S: fault at ffff82d080239a68 en=
try.o#compat_create_bounce_frame+0xd9/0xf1
(XEN) Domain 9 (vcpu#0) crashed on cpu#8:
(XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    8
(XEN) RIP:    e019:[<00000000c1031d39>]
(XEN) RFLAGS: 0000000000000292   EM: 1   CONTEXT: pv guest (d9v0)
(XEN) rax: 00000000c18a84c0   rbx: 00000000c162fce0   rcx: 00000000000000=
00
(XEN) rdx: 0000000000000000   rsi: 00000000c1815eec   rdi: 00000000c1815f=
34
(XEN) rbp: 00000000c1815f10   rsp: 00000000c1815ecc   r8:  ffff83207b00fe=
58
(XEN) r9:  ffff82d080197ea3   r10: 0000000080000008   r11: 00000000000002=
97
(XEN) r12: ffff83103ff30140   r13: ffff83103ff30148   r14: ffff83207b00ff=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526=
e0
(XEN) cr3: 000000207b10c000   cr2: 0000000000000014
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: e021   es: e021   fs: e021   gs: e021   ss: e021   cs: e019
(XEN) Guest stack trace from esp=3Dc1815ecc:
(XEN)   00000000 c1031d39 0001e019 00010092 c18a84c0 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 ffffffff c1815f24 c18a84c0 c18a84c0 c1=
815f30
(XEN)   c1815f34 c1815f50 c10328c7 c1815f3c c1815f38 c1815f40 0000302e 00=
000000
(XEN)   00000000 00000000 80000008 00000000 00000000 00000000 00000000 c1=
e38000
(XEN)   c1a08000 c1815ffc c18c44c3 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 c1e38000 c1a08000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
-------->8-----------------------------------



Try #2:
--------8<-----------------------------------
(XEN) d15v0: unhandled page fault (ec=3D0000)
(XEN) Pagetable walk from 0000000000000014:
(XEN)  L4[0x000] =3D 000000028903b027 0000000000001e3b
(XEN)  L3[0x000] =3D 000000028904d027 0000000000001e4d
(XEN)  L2[0x000] =3D 000000028904e023 0000000000001e4e=20
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN) domain_crash_sync called from entry.S: fault at ffff82d080239a68 en=
try.o#compat_create_bounce_frame+0xd9/0xf1
(XEN) Domain 15 (vcpu#0) crashed on cpu#7:
(XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    7
(XEN) RIP:    e019:[<00000000c1031d39>]
(XEN) RFLAGS: 0000000000000292   EM: 1   CONTEXT: pv guest (d15v0)
(XEN) rax: 00000000c18a84c0   rbx: 00000000c162fce0   rcx: 00000000000000=
00
(XEN) rdx: 0000000000000000   rsi: 00000000c1815eec   rdi: 00000000c1815f=
34
(XEN) rbp: 00000000c1815f10   rsp: 00000000c1815ecc   r8:  ffff83103ff3fe=
58
(XEN) r9:  ffff82d080197ea3   r10: 0000000080000008   r11: 00000000000002=
97
(XEN) r12: ffff83103ff42140   r13: ffff83103ff42148   r14: ffff83103ff3ff=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526=
e0
(XEN) cr3: 000000207b103000   cr2: 0000000000000014
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: e021   es: e021   fs: e021   gs: e021   ss: e021   cs: e019
(XEN) Guest stack trace from esp=3Dc1815ecc:
(XEN)   00000000 c1031d39 0001e019 00010092 c18a84c0 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 ffffffff c1815f24 c18a84c0 c18a84c0 c1=
815f30
(XEN)   c1815f34 c1815f50 c10328c7 c1815f3c c1815f38 c1815f40 0000302e 00=
000000
(XEN)   00000000 00000000 80000008 00000000 00000000 00000000 00000000 c1=
e38000
(XEN)   c1a08000 c1815ffc c18c44c3 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 c1e38000 c1a08000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
(XEN)   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00=
000000
-------->8-----------------------------------


Let me know if you need more info.


Thanks!
Daniel
(please CC me since I'm not subscribed to the list)



[1] https://www.mail-archive.com/grub-devel@gnu.org/msg26612.html


--FCrubFhpq931fqt3IgpOwsCCaJvpaBkTs--

--JJNu2uriTXunmaKanTXPNjAmThqGmGvex
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEg2wMpOXGvc4nunsZnjl+Rc/8gF8FAlrRl8cXHGhhY2tpbmdA
bmFjaHRnZWlzdC5uZXQACgkQnjl+Rc/8gF8Jiw//TusnRK4wR+A1R4AmTRe4pZRV
qMzEszwJ+MBBYxbCYaoc+qTLp/zKms8+c+/J1CcmV7xousZ43R/3BjoTEcPikWxq
6zj9b/KfgDsVugHNSMYow7cU4nOa1XEtH+FQv1pUTMRMY9kl4PpEi7Tap+HGVsq2
EoFXpitIFHaRcefkKeVY1YC6Gfcc1n5KOPp4Ldi9FAcwgy8ogeax4xPTPzfsBy7b
F26wQ7CMkHHyCvJl3G1rz9p+FMND2n6NXH8qnAJ7l8lOO0LNnuK5pwt7O3qCV4Ew
aCTyDS+taOoKxwtDRGHMXjXVI8x51pFOJJW7vnZ4o+O3ZR2kvFnJ7+FlQ1Ez/HX2
3lTIlqzlqa+WptdDSL0ntJ8gV+FNzBNDBRrNsNJtODg9+pKxnFO63LW4aAcPUof9
Fc9fAxVk7D7DpmTdtT35cNMXyJVx6plRDxQ9c0KZPdleEGnHmMwJU5FQXAuGnr00
J8jj3NSi9DFS1Z7LPySieKAB+1UhjMcSrwkyOEPGdtBpN7csHRW0dKBvwPkjtEiO
Drn1TEvJmqpIjwv/sR84A54Wx4PSafzUtOkoq8v/Zwlp65BqQQ1KDC7L6L6pL9pq
6ZWWxaT3DoX5WvbWISq1zv/e6oH8xOmd4oP7AModrvjU8cVzCD4eg7oBr3oUFd8k
j9/1rdSdmOEiw5qV6Cs=
=9uE3
-----END PGP SIGNATURE-----

--JJNu2uriTXunmaKanTXPNjAmThqGmGvex--


--===============6945599424509547429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6945599424509547429==--
