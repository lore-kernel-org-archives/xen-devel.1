From: HW42 <hw42@ipsumj.de>
Subject: Re: [PATCH 1/3] xen: remove tests for pvh mode in pure
 pv paths
Date: Sat, 06 Jan 2018 05:55:00 +0000
Message-ID: <a1365690-ebd9-742b-c334-1d01b5462d2c@ipsumj.de>
References: <20170804113613.12028-1-jgross@suse.com>
 <20170804113613.12028-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0702096422406725610=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=omkk=eb=ipsumj.de=hw42@srs-us1.protection.inumbo.net>)
 id 1eXhS7-00083L-49
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 05:55:31 +0000
In-Reply-To: <20170804113613.12028-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0702096422406725610==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Qva3DKxFxDdGo6bg8yrWhlObhoZb0j7DY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Qva3DKxFxDdGo6bg8yrWhlObhoZb0j7DY
Content-Type: multipart/mixed; boundary="lHpWPVLXMwquzfmyDrzxTmJJKMVw4wXyd";
 protected-headers="v1"
From: HW42 <hw42@ipsumj.de>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com
Message-ID: <a1365690-ebd9-742b-c334-1d01b5462d2c@ipsumj.de>
Subject: Re: [Xen-devel] [PATCH 1/3] xen: remove tests for pvh mode in pure pv
 paths
References: <20170804113613.12028-1-jgross@suse.com>
 <20170804113613.12028-2-jgross@suse.com>
In-Reply-To: <20170804113613.12028-2-jgross@suse.com>

--lHpWPVLXMwquzfmyDrzxTmJJKMVw4wXyd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Juergen Gross:
> Remove the last tests for XENFEAT_auto_translated_physmap in pure
> PV-domain specific paths. PVH V1 is gone and the feature will always
> be "false" in PV guests.
[...]
> diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
> index 276da636dd39..6083ba462f35 100644
> --- a/arch/x86/xen/p2m.c
> +++ b/arch/x86/xen/p2m.c
[...]
> @@ -711,9 +694,6 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant=
_ref *map_ops,
>  	int i, ret =3D 0;
>  	pte_t *pte;
> =20
> -	if (xen_feature(XENFEAT_auto_translated_physmap))
> -		return 0;
> -
>  	if (kmap_ops) {
>  		ret =3D HYPERVISOR_grant_table_op(GNTTABOP_map_grant_ref,
>  						kmap_ops, count);
> @@ -756,9 +736,6 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_g=
rant_ref *unmap_ops,
>  {
>  	int i, ret =3D 0;
> =20
> -	if (xen_feature(XENFEAT_auto_translated_physmap))
> -		return 0;
> -
>  	for (i =3D 0; i < count; i++) {
>  		unsigned long mfn =3D __pfn_to_mfn(page_to_pfn(pages[i]));
>  		unsigned long pfn =3D page_to_pfn(pages[i]);

This removes the check for autotranslation in {set,clear}_foreign_p2m_map=
ping.
But those are called by the grant-table code also on PVH/HVM guest. So
since 4.14 I see crashes similar to this one (ignore the kernel version,
it's in the middle of a bisect):=20

[   33.778854] page must be ballooned
[   33.778860] ------------[ cut here ]------------
[   33.778887] WARNING: CPU: 1 PID: 1581 at arch/x86/xen/p2m.c:720 set_fo=
reign_p2m_mapping+0x13b/0x370
[   33.778903] Modules linked in: xen_gntdev xen_gntalloc xen_blkback xen=
fs xen_privcmd xen_evtchn dm_snapshot dm_bufio xen_blkfront
[   33.778931] CPU: 1 PID: 1581 Comm: qubesdb-daemon Not tainted 4.13.0-l=
t-37 #1
[   33.778946] task: ffff8800f4251b80 task.stack: ffffc90000818000
[   33.778960] RIP: 0010:set_foreign_p2m_mapping+0x13b/0x370
[   33.778970] RSP: 0018:ffffc9000081bc90 EFLAGS: 00010286
[   33.778981] RAX: 0000000000000016 RBX: 0000000000000001 RCX: ffffffff8=
1e4a898
[   33.778994] RDX: 0000000000000001 RSI: 0000000000000092 RDI: 000000000=
0000247
[   33.779016] RBP: ffffc9000081bce0 R08: 0000000000000143 R09: ffffffff8=
20d1660
[   33.779026] R10: 000000000000002a R11: 0000000000000000 R12: ffff8800f=
0c2c320
[   33.779037] R13: ffff8800f4b6a3c8 R14: 8000000000000000 R15: 000000000=
0000000
[   33.779047] FS:  00007fbfd5739f80(0000) GS:ffff8800f9d00000(0000) knlG=
S:0000000000000000
[   33.779056] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.779064] CR2: 00007ff25daca0c0 CR3: 00000000f2faa005 CR4: 000000000=
01606e0
[   33.779074] Call Trace:
[   33.779082]  ? x86_configure_nx+0x50/0x50
[   33.779091]  gnttab_map_refs+0xc2/0x160
[   33.779097]  ? decrease_reservation+0x256/0x2e0
[   33.779105]  gntdev_mmap+0x358/0x5c0 [xen_gntdev]
[   33.779113]  mmap_region+0x392/0x5e0
[   33.779119]  do_mmap+0x2ae/0x480
[   33.779125]  vm_mmap_pgoff+0xa1/0xe0
[   33.779132]  SyS_mmap_pgoff+0x1ba/0x260
[   33.787439] systemd-journald[1548]: Received request to flush runtime =
journal from PID 1
[   33.931963]  SyS_mmap+0x16/0x20
[   33.931966]  do_syscall_64+0x53/0xf0
[   33.931980]  entry_SYSCALL64_slow_path+0x25/0x25
[   33.931981] RIP: 0033:0x7fbfd50ebdda
[   33.931982] RSP: 002b:00007fff2bae9238 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000009
[   33.931984] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fbfd=
50ebdda
[   33.931984] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 000000000=
0000000
[   33.931985] RBP: 0000000000000007 R08: 0000000000000007 R09: 000000000=
0000000
[   33.931986] R10: 0000000000000001 R11: 0000000000000246 R12: 000000000=
0000000
[   33.931986] R13: 0000000000001000 R14: 0000000000000001 R15: 000000000=
0000000
[   33.931987] Code: 83 b4 00 00 00 48 8b 05 9c 5c f2 00 48 83 3c d0 ff 0=
f 84 50 01 00 00 48 c7 c7 d7 20 bd 81 48 89 55 c8 48 89 75 d0 e8 f1 70 09=
 00 <0f> ff 48 8b 75 d0 48 8b 55 c8 4c 09 f6 48 89 d7 e8 70 fe ff ff=20
[   33.932007] ---[ end trace 858dec3c813fa284 ]---
[   33.932011] ------------[ cut here ]------------
[   33.932011] kernel BUG at arch/x86/xen/p2m.c:651!
[   33.932014] invalid opcode: 0000 [#1] SMP
[   33.932014] Modules linked in: xen_gntdev xen_gntalloc xen_blkback xen=
fs xen_privcmd xen_evtchn dm_snapshot dm_bufio xen_blkfront
[   33.932022] CPU: 1 PID: 1581 Comm: qubesdb-daemon Tainted: G        W =
      4.13.0-lt-37 #1
[   33.932601] task: ffff8800f4251b80 task.stack: ffffc90000818000
[   33.932605] RIP: 0010:__set_phys_to_machine+0x36/0x130
[   33.932606] RSP: 0018:ffffc9000081bc68 EFLAGS: 00010287
[   33.932609] RAX: 0000000000000016 RBX: 00000000000f3cf3 RCX: ffffffff8=
1e4a898
[   33.932609] RDX: 00000000000f3cf3 RSI: 800000000012daef RDI: 000000000=
00f3cf3
[   33.932610] RBP: ffffc9000081bc80 R08: 0000000000000143 R09: ffffffff8=
20d1660
[   33.932611] R10: 000000000000002a R11: 0000000000000000 R12: 800000000=
012daef
[   33.932611] R13: ffff8800f4b6a3c8 R14: 8000000000000000 R15: 000000000=
0000000
[   33.932613] FS:  00007fbfd5739f80(0000) GS:ffff8800f9d00000(0000) knlG=
S:0000000000000000
[   33.932613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.932614] CR2: 00007ff25daca0c0 CR3: 00000000f2faa005 CR4: 000000000=
01606e0
[   33.932617] Call Trace:
[   33.932619]  ? set_phys_to_machine+0x12/0x40
[   33.932621]  set_foreign_p2m_mapping+0x150/0x370
[   33.932624]  ? x86_configure_nx+0x50/0x50
[   33.932627]  gnttab_map_refs+0xc2/0x160
[   33.932628]  ? decrease_reservation+0x256/0x2e0
[   33.932631]  gntdev_mmap+0x358/0x5c0 [xen_gntdev]
[   33.932634]  mmap_region+0x392/0x5e0
[   33.932635]  do_mmap+0x2ae/0x480
[   33.932637]  vm_mmap_pgoff+0xa1/0xe0
[   33.932640]  SyS_mmap_pgoff+0x1ba/0x260
[   33.932641]  SyS_mmap+0x16/0x20
[   33.932643]  do_syscall_64+0x53/0xf0
[   33.932645]  entry_SYSCALL64_slow_path+0x25/0x25
[   33.932647] RIP: 0033:0x7fbfd50ebdda
[   33.932647] RSP: 002b:00007fff2bae9238 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000009
[   33.932648] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fbfd=
50ebdda
[   33.932649] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 000000000=
0000000
[   33.932650] RBP: 0000000000000007 R08: 0000000000000007 R09: 000000000=
0000000
[   33.932650] R10: 0000000000000001 R11: 0000000000000246 R12: 000000000=
0000000
[   33.932651] R13: 0000000000001000 R14: 0000000000000001 R15: 000000000=
0000000
[   33.932652] Code: 0d 18 5f f2 00 48 8d 14 fd 00 00 00 00 48 01 d1 0f 1=
f 00 31 c0 48 89 31 0f 1f 00 85 c0 75 0e b8 01 00 00 00 c3 48 83 fe ff 74=
 f4 <0f> 0b 55 48 89 e5 41 54 53 49 89 f4 48 8d 75 ec 48 89 fb 48 83=20
[   33.932673] RIP: __set_phys_to_machine+0x36/0x130 RSP: ffffc9000081bc6=
8
[   33.932688] ---[ end trace 858dec3c813fa285 ]---

Not sure if you prefer to change the grant-table code or to revert this
part of the commit. The patch bellow works for me:

From: Simon Gaiser <simon@invisiblethingslab.com>
Date: Sat, 6 Jan 2018 06:40:32 +0100
Subject: [PATCH] xen: Fix {set,clear}_foreign_p2m_mapping on autotranslat=
ing
 guests

Commit 82616f9599a7 ("xen: remove tests for pvh mode in pure pv paths")
removed the check for autotranslation from {set,clear}_foreign_p2m_mappin=
g
but those are called by grant-table.c also on PVH/HVM guests.

Cc: <stable@vger.kernel.org> # 4.14
Fixes: 82616f9599a7 ("xen: remove tests for pvh mode in pure pv paths")
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---
 arch/x86/xen/p2m.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 6083ba462f35..15812e553b95 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -694,6 +694,9 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant_r=
ef *map_ops,
 	int i, ret =3D 0;
 	pte_t *pte;
=20
+	if (xen_feature(XENFEAT_auto_translated_physmap))
+		return 0;
+
 	if (kmap_ops) {
 		ret =3D HYPERVISOR_grant_table_op(GNTTABOP_map_grant_ref,
 						kmap_ops, count);
@@ -736,6 +739,9 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_gra=
nt_ref *unmap_ops,
 {
 	int i, ret =3D 0;
=20
+	if (xen_feature(XENFEAT_auto_translated_physmap))
+		return 0;
+
 	for (i =3D 0; i < count; i++) {
 		unsigned long mfn =3D __pfn_to_mfn(page_to_pfn(pages[i]));
 		unsigned long pfn =3D page_to_pfn(pages[i]);
--=20
2.15.1



--lHpWPVLXMwquzfmyDrzxTmJJKMVw4wXyd--

--Qva3DKxFxDdGo6bg8yrWhlObhoZb0j7DY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEqieyzvOmi9FGaQcT5KzJJ4pkaBYFAlpQZNoPHGh3NDJAaXBz
dW1qLmRlAAoJEOSsySeKZGgWx14QAKfDr9Ig/fgfc/W4HVP3f9HfVb7ttD9RzByZ
a6CJokK5hpUHO5DqlrZTUdtyh5u4YNS1CkoZheo8G2a18jz85yUrnsnmq/Q3vLp7
OruqCinTyF538MDb7C9Ucim01gzLbjdTvFHc//tLS+r1i9/pbQbt8TpUydiNnbsl
zzSDGtSLd5FGGFn8dvyH1D3e+bnEnenhCexffy+kG/nfRxIki5jmN9owU/gxtEAQ
ZdN7tL0kBq67zfRcZaFiCQTRxY0RVU6p8N84n7h82l0WZLuVpF7UosVwjhduS2De
w4NcjhKdBp+tpWhGgc9i4VNTTR/Nb8kE4zxcOpFcBnT9TzNm6GLQHDNB/gvfbFTH
UdaYUGyt1dHL/4kXzC2BRZO3S0UYPdJW1I7NfGFQ5dIZ5hNFejkSYRDOEZwN7tSy
DN9IdHQi08VJlHecDc9lJhZzYE0Zo8vturmGEGmEp8iQ19PT7EgBH4/pMjgLn4ZO
O9rafjby7NqPvweSTetKLziSVALWgUWGua7+zUERytrQqvODqL7XhhWk4eFGMAxd
Ety3yoViGlEyTe/UlTsueJLk/dG8uPQoGZJSIkqot3+UazkwmI5HUt39JX2F/M1E
iyMEfuydhmjMPLTF3kFbXuPz6f0cO6hvGdQz4KsWBD/89k23PSGXsMwqoj7rpJS3
8YjpMcUh
=4xSU
-----END PGP SIGNATURE-----

--Qva3DKxFxDdGo6bg8yrWhlObhoZb0j7DY--


--===============0702096422406725610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0702096422406725610==--
