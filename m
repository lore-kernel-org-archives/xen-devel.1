From: Olaf Hering <olaf@aepfle.de>
Subject: v4.19-rc3,
 bug in __gnttab_unmap_refs_async with HVM domU
Date: Mon, 10 Sep 2018 14:37:12 +0200
Message-ID: <20180910143712.0554c258.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3032802856039090609=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=b1bd=ly=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzLRU-0001Sx-B0
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 12:37:25 +0000
Received: from sender by smtp.strato.de (RZmta 44.0 AUTH)
 with ESMTPSA id L0862bu8ACbKMnw
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 10 Sep 2018 14:37:20 +0200 (CEST)
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

--===============3032802856039090609==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=T=wgtKWKE9ypn9P+m+xbY1"; protocol="application/pgp-signature"

--Sig_/=T=wgtKWKE9ypn9P+m+xbY1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

While preparing another variant of the fix for the bug in disable_hotplug_c=
pu, this crash happend for me while starting my HVM domU a second time. dom=
0 runs Xen 4.7.6.
I guess it crashed while it did shutdown the domU running a xenlinux based =
kernel.

Olaf

[ 8114.320383] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000008
[ 8114.320416] PGD 1fd6a1f067 P4D 1fd6a1f067 PUD 1fd4b4a067 PMD 0
[ 8114.320427] Oops: 0000 [#1] PREEMPT SMP NOPTI
[ 8114.320435] CPU: 0 PID: 828 Comm: xenstored Tainted: G            E     =
4.19.321-default-bug1106594 #5
[ 8114.320444] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[ 8114.320458] RIP: e030:__gnttab_unmap_refs_async+0x29/0x90
[ 8114.320464] Code: 00 66 66 66 66 90 53 8b 8f 80 00 00 00 31 c0 48 89 fb =
48 8b 57 78 85 c9 75 09 eb 49 83 c0 01 39 c8 74 42 4c 63 c0 4e 8b 04 c2 <4d=
> 8b 48 08 41 f6 c1 01 75 4d 45 8b 40 34
 41 83 f8 01 7e de 8b 83
[ 8114.320480] RSP: e02b:ffffc900471d3bd8 EFLAGS: 00010297
[ 8114.320487] RAX: 0000000000000001 RBX: ffffc900471d3c20 RCX: 00000000000=
0006c
[ 8114.320495] RDX: ffff881fd9f3eac0 RSI: ffffffff810ad2f0 RDI: ffffc900471=
d3c20
[ 8114.320503] RBP: 0000000002ccbdb0 R08: 0000000000000000 R09: dead0000000=
00100
[ 8114.320511] R10: 0000000000001093 R11: ffff881fd3340840 R12: ffff8801016=
09d80
[ 8114.320518] R13: 000000000000006c R14: ffff881fd68dbb01 R15: ffff8801016=
09d80
[ 8114.320533] FS:  00007fd3352a3880(0000) GS:ffff881fdf400000(0000) knlGS:=
0000000000000000
[ 8114.320541] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8114.320548] CR2: 0000000000000008 CR3: 0000001fd33ca000 CR4: 00000000000=
02660
[ 8114.320560] Call Trace:
[ 8114.320569]  gnttab_unmap_refs_sync+0x40/0x60
[ 8114.320580]  __unmap_grant_pages+0x80/0x140 [xen_gntdev]
[ 8114.320587]  ? gnttab_unmap_refs_sync+0x60/0x60
[ 8114.320596]  ? __queue_work+0x3f0/0x3f0
[ 8114.320602]  ? gnttab_free_pages+0x20/0x20
[ 8114.320610]  unmap_grant_pages+0x80/0xe0 [xen_gntdev]
[ 8114.320618]  unmap_if_in_range+0x53/0xa0 [xen_gntdev]
[ 8114.320626]  mn_invl_range_start+0x4a/0xe0 [xen_gntdev]
[ 8114.320635]  __mmu_notifier_invalidate_range_start+0x6b/0xe0
[ 8114.320646]  unmap_vmas+0x71/0x90
[ 8114.320652]  unmap_region+0x9c/0xf0
[ 8114.320660]  ? __vma_rb_erase+0x109/0x200
[ 8114.320666]  do_munmap+0x213/0x390
[ 8114.320673]  __x64_sys_brk+0x13c/0x1b0
[ 8114.320682]  do_syscall_64+0x5d/0x110
[ 8114.320690]  entry_SYSCALL_64_after_hwframe+0x49/0xbe


--Sig_/=T=wgtKWKE9ypn9P+m+xbY1
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5ZleAAKCRBdQqD6ppg2
fqtzAKCswuYKBKE7++Ayhzj+4ngizuCEbwCg1GwqZCktyOKfKXEv/Cp88GOPQPI=
=tSM8
-----END PGP SIGNATURE-----

--Sig_/=T=wgtKWKE9ypn9P+m+xbY1--


--===============3032802856039090609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3032802856039090609==--
