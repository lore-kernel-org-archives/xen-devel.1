From: Olaf Hering <olaf@aepfle.de>
Subject: bug in _shadow_prealloc during migration of PV domU
Date: Wed, 11 Apr 2018 22:32:44 +0200
Message-ID: <20180411203244.GN7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1413113443111550447=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============1413113443111550447==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr6hGnsCY8KeifOY"
Content-Disposition: inline


--Sr6hGnsCY8KeifOY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I was testing 'virsh migrate domU host' and did some libvirtd debugging
on 'host'. This means the migration was attempted a few times, but did
not actually start because libvirtd was in gdb. Not sure if libvirt on
the sender does anything with the domU before a connection to the remote
host is fully established.

Finally I installed the fixed libvirtd on 'host' and started the
migration again. This time the sender died like this:

-- 22:anonymi -- time-stamp -- 2018-04-11 22:18:11 --
(XEN) sh error: _shadow_prealloc(): Can't pre-allocate 1 shadow pages!
(XEN)   shadow pages total =3D 5, free =3D 0, p2m=3D0
(XEN) Xen BUG at common.c:1315
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-4.xen_unstable  x86_64  deb=
ug=3Dn   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d08032bdd8>] common.c#_shadow_prealloc+0x478/0x4=
f0
(XEN) RFLAGS: 0000000000010292   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff83043dd8e02c   rbx: ffff8303393e9000   rcx: 0000000000000000
(XEN) rdx: ffff83043dd87fff   rsi: 000000000000000a   rdi: ffff82d08043c6b8
(XEN) rbp: 0000000000000001   rsp: ffff83043dd87b78   r8:  ffff83043dd90000
(XEN) r9:  0000000000008000   r10: 0000000000000000   r11: 0000000000000001
(XEN) r12: 0000000000000020   r13: 0000000000000000   r14: ffff82d08057ffd8
(XEN) r15: ffff83043dd87fff   cr0: 0000000080050033   cr4: 00000000000026e0
(XEN) cr3: 000000039253f000   cr2: ffff8800a2b6c1b0
(XEN) fsb: 00007f80c8424700   gsb: ffff880140400000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08032bdd8> (common.c#_shadow_prealloc+0x478/0=
x4f0):
(XEN)  ea 31 c0 e8 d8 08 f2 ff <0f> 0b 31 c9 e9 c3 fe ff ff 31 c9 e9 ad fe =
ff ff
(XEN) Xen stack trace from rsp=3Dffff83043dd87b78:
(XEN)    0000000000000000 ffff83043dd87b90 0000000000000000 0000000000000000
(XEN)    000000003dd87fff ffff8300bf1f4000 ffff8303393e9000 0000000000000008
(XEN)    ffff82d0803abf40 ffff83043dd87fff ffffffffffffffff ffff82d08032ea78
(XEN)    0000000000101000 ffff8300bf1f4000 0000000000101000 ffff8303393e9650
(XEN)    ffff82d08057ffc0 ffff82d08032ef18 ffff83043dd16000 ffff8303393e9000
(XEN)    ffff82d08057ffc0 ffff82d08032f059 ffff8303393e9000 0000000000000001
(XEN)    0000000000000024 ffff83043dd16000 00007f80c8439004 ffff82d0803125b5
(XEN)    ffff83043dd16000 ffff8303393e9000 ffff83043dd87d98 ffff82d08026db1e
(XEN)    0000000000000000 0000000000000000 000000000000000c 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffff8300bf1fb000
(XEN)    ffff83043dd28188 ffff82d08056a500 0000000000000246 ffff82d08057f180
(XEN)    0000000000000206 ffff82d0802344ea 0000000000000000 ffff83043dd16000
(XEN)    000000000038b83c 00007f80c8439004 ffff83043dd87d98 0000000000000024
(XEN)    0000000000000000 ffff8303393e9000 ffffffffffffffff ffff82d080205f5e
(XEN)    ffff8300bf583000 ffff83043ddb00d0 0000000000000000 ffff82d08020c535
(XEN)    ffff83043ddb00d0 ffff83043ddb00c0 ffff83043ddb0010 07ff82d000000003
(XEN)    ffff82d08035781b ffff82d08020bc8a 0000000000000000 ffff82d080553c80
(XEN)    000000100000000a 0000000000000002 0000000000000002 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08032bdd8>] common.c#_shadow_prealloc+0x478/0x4f0
(XEN)    [<ffff82d08032ea78>] common.c#sh_update_paging_modes+0x1f8/0x390
(XEN)    [<ffff82d08032ef18>] common.c#shadow_one_bit_enable+0x88/0x110
(XEN)    [<ffff82d08032f059>] common.c#sh_enable_log_dirty+0xb9/0x120
(XEN)    [<ffff82d0803125b5>] paging_log_dirty_enable+0x45/0x60
(XEN)    [<ffff82d08026db1e>] arch_do_domctl+0xcee/0x2450
(XEN)    [<ffff82d0802344ea>] vcpu_wake+0x12a/0x390
(XEN)    [<ffff82d080205f5e>] do_domctl+0xcce/0x17e0
(XEN)    [<ffff82d08020c535>] event_fifo.c#evtchn_fifo_set_pending+0x235/0x=
350
(XEN)    [<ffff82d08035781b>] common_interrupt+0x9b/0x110
(XEN)    [<ffff82d08020bc8a>] evtchn_check_pollers+0x1a/0xa0
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080205290>] do_domctl+0/0x17e0
(XEN)    [<ffff82d080351318>] pv_hypercall+0x138/0x200
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080357422>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080357422>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080357422>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080357422>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d080357422>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08035742e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d08035748f>] lstar_enter+0x10f/0x120
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Xen BUG at common.c:1315
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

I will see if I can reproduce it.

Olaf

--Sr6hGnsCY8KeifOY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs5w6QAKCRBdQqD6ppg2
fknhAKDaH06btdArvr5q3cBj4IDUe8yejwCgjlj6BwHxJ2blbbdQP4JZU3ayOvk=
=HKz7
-----END PGP SIGNATURE-----

--Sr6hGnsCY8KeifOY--


--===============1413113443111550447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1413113443111550447==--
