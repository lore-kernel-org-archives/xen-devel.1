From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: avoid crash in disable_hotplug_cpu
Date: Wed, 5 Sep 2018 16:47:19 +0200
Message-ID: <20180905164719.52e02256.olaf__41674.6906274513$1536158778$gmane$org@aepfle.de>
References: <20180905104039.13512-1-olaf@aepfle.de>
 <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6999347720382859783=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=domh=lt=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fxZ5l-0003fz-R0
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 14:47:38 +0000
In-Reply-To: <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============6999347720382859783==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/LzNz=jnL/Kgv5MAft0yD6Bu"; protocol="application/pgp-signature"

--Sig_/LzNz=jnL/Kgv5MAft0yD6Bu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 5 Sep 2018 12:55:58 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Instead of trying to fight the symptoms, I think avoiding to offline
> the last cpu would make more sense.

Well, apparently the fix is to leave cpu#0 online because of a backtrace li=
ke that:

WARNING: CPU: 0 PID: 83 at kernel/sched/cpudeadline.c:159 cpudl_clear+0xa5/=
0xb0
Workqueue: events cpuset_hotplug_workfn
RIP: e030:cpudl_clear+0xa5/0xb0
Code: 8b 43 48 c7 44 28 0c ff ff ff ff e8 d5 fd ff ff 48 8d 43 08 f0 4c 0f =
ab 20 4c 89 ee 48 89 df 5b 5d 41 5c 41 5d e9 0b 3b 79 00 <0f> 0b e9 76 ff f=
f ff 0f 1f 40 00 66 66 66 66 90 41 56 49 89 d6 41
RSP: e02b:ffffc900411cbc40 EFLAGS: 00010086
RAX: ffffffff810d09a0 RBX: ffff880106f1a100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff880106f1a100
RBP: 0000000000000000 R08: 0000000000000000 R09: ffff8801068989b0
R10: ffff8801068989d0 R11: 0000000000000008 R12: 0000000000000000
R13: ffff8801f3800200 R14: 0000000000000001 R15: ffff8801f3823240
FS:  00007fd40d7f08c0(0000) GS:ffff8801f3800000(0000) knlGS:0000000000000000
CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055eff60fe098 CR3: 00000001edf24000 CR4: 0000000000002660
Call Trace:
 rq_offline_dl+0x36/0x80
 set_rq_offline+0x31/0x60
 rq_attach_root+0x98/0xc0
 cpu_attach_domain+0x107/0x320
 partition_sched_domains+0x117/0x347
 ? cpus_read_lock+0x2d/0x50
 rebuild_sched_domains_locked+0xe4/0x4e0
 ? __switch_to_asm+0x40/0x70
 ? xen_mc_flush+0x102/0x210
 rebuild_sched_domains+0x16/0x30
 cpuset_hotplug_workfn+0x45e/0xef0
 ? _raw_spin_unlock_irq+0x22/0x40
 ? finish_task_switch+0x75/0x250
 process_one_work+0x1fd/0x3e0
 worker_thread+0x2d/0x3d0
 ? rescuer_thread+0x340/0x340
 kthread+0x112/0x130
 ? kthread_create_worker_on_cpu+0x40/0x40
 ret_from_fork+0x3a/0x50

Initially I did not spot it because the kernel was booted with 'quiet'.

Olaf

--Sig_/LzNz=jnL/Kgv5MAft0yD6Bu
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4/seAAKCRBdQqD6ppg2
firCAKCurqB2wJM0WzkYjLbfuoLzrMzuCwCgxQbHlvePNXf47mnN3+/vAXBwqwc=
=cZSD
-----END PGP SIGNATURE-----

--Sig_/LzNz=jnL/Kgv5MAft0yD6Bu--


--===============6999347720382859783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6999347720382859783==--
