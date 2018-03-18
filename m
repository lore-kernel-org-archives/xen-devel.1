From: Steven Haigh <netwiz@crc.id.au>
Subject: Kernel trace when using xl block-attach - 4.14.25
Date: Sun, 18 Mar 2018 16:55:45 +1100
Message-ID: <14772597.Ke2pz90unK@wopr.lan.crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7526250394442383736=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=b1py=gi=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1exRIP-0004oH-PC
 for xen-devel@lists.xenproject.org; Sun, 18 Mar 2018 05:55:54 +0000
Received: from wopr.lan.crc.id.au
 (2407-e400-b000-201-11ab-990d-80c9-ac1c-cpe.spintel.net.au
 [IPv6:2407:e400:b000:201:11ab:990d:80c9:ac1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 4B11920AFF
 for <xen-devel@lists.xenproject.org>; Sun, 18 Mar 2018 16:55:46 +1100 (AEDT)
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

--===============7526250394442383736==
Content-Type: multipart/signed; boundary="nextPart6112033.DX1tL48dHO"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6112033.DX1tL48dHO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've noticed recently that once every now and again I get a kernel tracebac=
k=20
when attaching a drive to a DomU.

The drive in question is attached to the system via eSATA, opened via=20
cryptsetup, then added to the DomU. When this crash occurs, any process try=
ing=20
to access either the /dev/mapper entry, or the DomU accessing the associate=
d=20
block device will hang and never come back.

The only real resolution is to forcefully destroy the DomU (which fails) an=
d=20
then eventually hit the reset button on the Dom0.

The trace from dmesg is as follows:
[504869.792058] xen-blkback: backend/vbd/4/51745: using 2 queues, protocol =
1=20
(x86_64-abi) persistent grants
[504877.624108] ------------[ cut here ]------------
[504877.624117] WARNING: CPU: 0 PID: 0 at kernel/rcu/tree.c:2725=20
rcu_process_callbacks+0x495/0x4b0
[504877.624118] Modules linked in: dm_crypt algif_skcipher af_alg xt_physde=
v=20
br_netfilter iptable_filter bridge 8021q garp stp llc btrfs zstd_decompress=
=20
zstd_compress xxhash it87 hwmon_vid dm_mod dax raid456 async_raid6_recov=20
async_memcp
y async_pq async_xor async_tx xor crct10dif_pclmul ghash_clmulni_intel pcbc=
=20
raid6_pq aesni_intel iTCO_wdt aes_x86_64 iTCO_vendor_support crypto_simd=20
glue_helper cryptd pl2303 pcspkr usbserial sg lpc_ich mei_me mei shpchp=20
i2c_i801 mfd_cor
e xenfs xen_privcmd ip_tables xfs libcrc32c raid1 sd_mod i915 iosf_mbi=20
i2c_algo_bit drm_kms_helper drm crc32c_intel r8169 serio_raw ahci libahci m=
ii=20
i2c_core sata_mv video xen_acpi_processor xen_pciback xen_netback xen_gntal=
loc=20
xen_gntde
v xen_evtchn ipv6 crc_ccitt autofs4
[504877.624167] CPU: 0 PID: 0 Comm: swapper/0 Not tainted=20
4.14.25-5.el7xen.x86_64 #2
[504877.624168] Hardware name: Gigabyte Technology Co., Ltd. To be filled b=
y=20
O.E.M./Z68M-D2H, BIOS U1G 03/06/2013
[504877.624169] task: ffffffff820124c0 task.stack: ffffffff82000000
[504877.624172] RIP: e030:rcu_process_callbacks+0x495/0x4b0
[504877.624173] RSP: e02b:ffff880080203f20 EFLAGS: 00010002
[504877.624175] RAX: 0000000000000000 RBX: ffff880080222cc0 RCX:=20
00000000172f7355
[504877.624177] RDX: ffffffffffffd801 RSI: ffff880080203f30 RDI:=20
ffff880080222cf8
[504877.624178] RBP: ffffffff82059880 R08: 0000000000025200 R09:=20
ffffffff815dc988
[504877.624179] R10: ffff880080225200 R11: ffffea0000f325c0 R12:=20
ffffffff820124c0
[504877.624180] R13: 0000000000000001 R14: ffff880080222cf8 R15:=20
7fffffffffffffff
[504877.624194] FS:  00007fa23850c740(0000) GS:ffff880080200000(0000) knlGS:
0000000000000000
[504877.624196] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[504877.624197] CR2: 00007f82fda14000 CR3: 0000000061b88000 CR4:=20
0000000000042660
[504877.624199] Call Trace:
[504877.624203]  <IRQ>
[504877.624208]  __do_softirq+0xc8/0x26b
[504877.624211]  irq_exit+0x93/0xb0
[504877.624215]  xen_evtchn_do_upcall+0x2c/0x40
[504877.624219]  xen_do_hypervisor_callback+0x29/0x40
[504877.624221]  </IRQ>
[504877.624224] RIP: e030:xen_hypercall_sched_op+0xa/0x20
[504877.624225] RSP: e02b:ffffffff82003e90 EFLAGS: 00000246
[504877.624227] RAX: 0000000000000000 RBX: ffffffff820124c0 RCX:=20
ffffffff810013aa
[504877.624228] RDX: 00000000ab50466e RSI: 0000000000000000 RDI:=20
0000000000000001
[504877.624229] RBP: 0000000000000000 R08: 0000000000000002 R09:=20
0000000000000000
[504877.624230] R10: 0000000000007ff0 R11: 0000000000000246 R12:=20
ffffffff820124c0
[504877.624231] R13: 0000000000000000 R14: 0000000000000000 R15:=20
0000000000000000
[504877.624234]  ? xen_hypercall_sched_op+0xa/0x20
[504877.624238]  ? xen_safe_halt+0xc/0x20
[504877.624240]  ? default_idle+0x18/0xf0
[504877.624242]  ? do_idle+0x164/0x1a0
[504877.624244]  ? cpu_startup_entry+0x5f/0x70
[504877.624247]  ? start_kernel+0x4e1/0x4ec
[504877.624248]  ? set_init_arg+0x55/0x55
[504877.624251]  ? xen_start_kernel+0x52e/0x538
[504877.624253] Code: 12 ff 5e 00 e9 45 fc ff ff 0f 0b e9 23 fc ff ff 0f 0b=
 0f=20
1f 40 00 e9 f3 fc ff ff 0f 0b 66 0f 1f 84 00 00 00 00 00 e9 d5 fb ff ff <0f=
>=20
0b 66 0f 1f 84 00 00 00 00 00 e9 d0 fd ff ff 90 66 2e 0f 1f
[504877.624290] ---[ end trace 62909e6ca83c56bf ]---

Has anyone seen this before or is aware of its cause?

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart6112033.DX1tL48dHO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlqt/2EACgkQQa811Xp9
MdzzgRAArWB81ISx/G1xpFNQPPDWQcGi8NQ4ABKmJJJSWlXjdgIFPHA4h6GJ0gAR
TJFkMx3t/Pue0SFR4qlkO2ofhffmjVrHTyAJGMJMdrW/Nn2WrvhmXl+76m4b74d5
HhbHVunpYPrQd0E+vesZzXd6yPGtFMFAGQFCgXKJZFE44Ru+ldKHievF3J3FfWb+
bFl1KG/xonUSYP/zvQvykDLKa8FBAH19SDpihX5emeUfFo/y0jfHhpKq2/WkfY4k
OssS9LbGmVUHrPBbJdutrXw17aveGjF10+bgW+EEXXUw9e5WgzOLRUq2A3c0qlKc
r3ONIHyL2H2tfnEsFhOlV17cu9JwnCduqGGNV65YKq19ySdKgnPhhkt+j+SXq24J
kUjQEtsL2dYNCAx+6+UNuCnv7OUK7h+572YJhpbRnu0b44kF+knd88Unt1cPSnDK
ROf0boqyMq07GMFBR+MbB0YqCm/i5JzptQCCdJvX2jm0nWt2wzuE7lePAHMFq9Az
modpDHfZcnxHJ9Nc+jin1rsVqIP+/i2rb3pJ56PUqOd0Nn1gK7uuPqhuhAddErbY
hzptNXSIbGaKPG/n83yL1PV4WmnibUtKJSVV78BPN9J+hDxMQxXkueDzO4u90gMo
xm98h4RywY4mIsYct4uguiKkXrEAOxgDUg1qLyjsLEHQk/cvMYI=
=bOfN
-----END PGP SIGNATURE-----

--nextPart6112033.DX1tL48dHO--





--===============7526250394442383736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7526250394442383736==--
