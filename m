Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC52C55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 14:04:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377869.1623626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRMp-0005JT-Iz; Thu, 30 Jul 2026 14:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377869.1623626; Thu, 30 Jul 2026 14:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRMp-0005JM-ER; Thu, 30 Jul 2026 14:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1377869;
 Thu, 30 Jul 2026 14:04:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wpRMn-0005JB-Je
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 14:04:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpRMn-003SOl-0A
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:04:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a6b59cd-2eae-0a2a0a5409dd-0a2a450a976c-36
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:04:08 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a6b59d2-f2d2-0a2a450a0019-67a8ac9cb343-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:04:03 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6D24B1400103;
 Thu, 30 Jul 2026 10:04:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 30 Jul 2026 10:04:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 10:04:01 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1785420242; x=1785506642; bh=Rd
	Yz2hBVvVFaltV6EUhHjvZHikt3CS0DyeBHpSiaFFk=; b=t+gVi07Md7ahQC4muV
	ENvcFtvJZhSq1lWbgvduH6T/qy94fH9g6uhPGBCbaQNSDs226bKOla3v3qvxOKjq
	FokB8WWSrpE6m725L6Ri8L9AQoUYa9ZacN9Xp++c2KYFzgU1VcpRdtFY4wfSENSf
	SuMiIr4uhakgKrmGqTJFN2t+mGF40poBB0L4EKoCPKGB6qek4dj0MTLp3ZlWb7/y
	EhisXRt7pqdU2rf1RhWfOo/NUbrsRJL3h+rrzzfdo1A64dFdUqz60CXDlwBMfnFs
	Vt1HwecDUWDBx2ytmCzp0539of+XG1vXX2yWhaU8Aj6GBP9+SaQdrus85RlNk2vd
	kYHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785420242; x=
	1785506642; bh=RdYz2hBVvVFaltV6EUhHjvZHikt3CS0DyeBHpSiaFFk=; b=P
	q0zzy1tln7f5Pe01V4/OjmS3SOcKza/diKDh91arUiHnzyoiVNJR0KeEh4E5MOWV
	g6LqW0HbbT3CNUYMPE2399qzFNCj5GAvMzJqtW/FWysmhVyrNe3GXuS+lv8/kwZn
	/lyAM/XiRKinSh3c5uacsDNOFNINcL5qOUJojRbjC218T+Dmv2l3VgeWpRbuqp7u
	f6E6EizaNeZnYI3hjH5knVOd4jGaX5WymZJRXoBGTXPMDJglC6KvXesezHpEZib9
	C72QrdJQcgvRMciogoWMBeY6amXw9OfLB/o3uFuMNy6Y48M1r9QGi9/spMWEm008
	+wnCPgIhg3b3/bRw3joaw==
X-ME-Sender: <xms:0llranL89HURZD59hoH-TDIE-0HCwK5yUbUF_kjwCAbYhWnhw564dA>
    <xme:0llrahKIycHWtCz1DL_8qkBQ-kvfzwSorwOuBFWqGUG_GCpzsylejhqhhM2pO-nqm
    ioPNu7j2MIebuIlrXGMUPNNm5E_o3YImpaGVdlLVAfksPyqIA>
X-ME-Received: <xmr:0llratUR8NOOEkuxd11dg3hzk6bHCnglD07mn8IZLzvRFiejFnr56eI7Ggcnsa5p0dqjJ1N9_Wv7fMRFLPTUU4-CZVm-eat1PqM>
X-ME-Proxy-Cause: dmFkZTEYmXBlkJklR/E2MeNaGzWm7xyUAyBTtjYAuplPXYtswkp1yqVGJ7H460sHddtLAs
    4L4vLNpdVYHssO4Oyhc/AJek6pPIiLpcshbdaIWgFb6AxDXjB9vPQ1m9GVv6lAOLZAyM+Y
    5Pc9la8b6I3vou5CtsJP2rlZKKdNvK+j5156DIo9urQmRBUfXSBjr++T9mBkxQt3qmXRvq
    mya0EFPihvHwT8jSUnjK4NiNXqMXrsM4YEVXyPGdBQx6xIxIx9ROS2jtH3wj3v2EHKc9GQ
    k2fURek7mK3YHjucX37zBE1i9w9bJALDcvrLS2+yH/mfHyoYokCDlRX+LscXAwdUFGDWdp
    ipCDiZIraBIAF9qOIbtAAjuW5ZWKvK9xqieT05v12vzdnhRvkVJi2mdBf+L1gGDpW44OKL
    ttXaKSBCl0+n8BZaOXo0Z4J+3cYrLSuTS3wrhOUi9bbUrFK7A4gy338BNvKgYrP92EOwxt
    LSERUcvVyYWl/kuJtGtlBwam/VRhcqgnHhTC16cZ0ZRJ39r+d6+8Q9Zeylk7fdVjmL87mO
    GLqBridPw0Y1V3vzLmZvv4dqtzmwYFfRHWiNLHquROsHWu9VqVtNr2yPl/fkkix51JW5BN
    GVjDkeHiwg7s2j0I1I0o89c33Vhgxquc5uUHsFYiywT9/i9bd1e8lJl5QYpA
X-ME-Proxy: <xmx:0llrarg-czsk9Lx4o8WwRr34k2iM1-9GO-OMnvmTuq0CEnmj_zCd5Q>
    <xmx:0llrag-C0SXvqJGleK4molj7r0-gz0E3KXiLh_u4ZXNCPMSV8o9AeQ>
    <xmx:0llratDFedqxZm8B_mYWvlKOJ5y7v_XfcTscZBF2mCENgu2cWY3ZeA>
    <xmx:0llralLM5gTCAMJBGdByyL6pD4aw3HcGhmbABT5OJ8peHEUyG7ZkvQ>
    <xmx:0llravdKRiOi3BrlSdO-9jY3QRz9WqJsqjgosi6nYRcfxMS7iKTskpHC>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 30 Jul 2026 16:03:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: xenwatch thread deadlock after dynamic network attach
Message-ID: <amtZz0VOkHnviZMj@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/1HLk8rI+WaJVlOf"
Content-Disposition: inline
X-purgate-ID: tlsNG-4011c0/1785420243-58FC6CFC-42EF9B42/0/0
X-purgate-type: clean
X-purgate-size: 8929

--/1HLk8rI+WaJVlOf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:59 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?PT91dGYtOD9CP1NzTzhjbWRsYmlCSGNtL0Rudz09Pz0=?= <jgross@suse.com>
Subject: xenwatch thread deadlock after dynamic network attach

Hi,

I've hit yet another issue with network attach. This time, it looks like
the code to handle forceful re-attach triggers when it shouldn't. The
test is basically:
1. Start the backend domain
2. Start the frontend domain without any vif attached.
3. Attach vif (equivalent of xl network-attach).

First I get:

    [   17.476245] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.502933] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.551204] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.612171] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.654823] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.676268] xen vif-0: xenbus: state reset occurred, reconnecting
    [   17.691250] xen_netfront: Initialising Xen virtual ethernet driver
    [   17.692288] vif vif-0: xenbus: state reset occurred, reconnecting

I'm not sure why it's repeated this many times (xenstore watch triggers
this many times?), but then, all xenstore watch operations in that
domain hangs. Inspecting tasks ("t" sysrq) shows:

    [ 1494.201304] task:xenbus          state:S stack:0     pid:62    tgid:=
62    ppid:2      task_flags:0x208040 flags:0x00080000
    [ 1494.201607] Call Trace:
    [ 1494.201659]  <TASK>
    [ 1494.201711]  __schedule+0x2f3/0x780
    [ 1494.201789]  ? __pfx_xenbus_thread+0x10/0x10
    [ 1494.201890]  schedule+0x27/0xa0
    [ 1494.201966]  xenbus_thread+0x1a8/0x200
    [ 1494.202044]  ? __pfx_autoremove_wake_function+0x10/0x10
    [ 1494.202144]  kthread+0xfc/0x240
    [ 1494.202347]  ? __pfx_kthread+0x10/0x10
    [ 1494.202418]  ret_from_fork+0x158/0x170
    [ 1494.202568]  ? __pfx_kthread+0x10/0x10
    [ 1494.202636]  ret_from_fork_asm+0x1a/0x30
    [ 1494.202704]  </TASK>
    [ 1494.202773] task:xenwatch        state:D stack:0     pid:63    tgid:=
63    ppid:2      task_flags:0x208040 flags:0x00080000
    [ 1494.202936] Call Trace:
    [ 1494.202980]  <TASK>
    [ 1494.203023]  __schedule+0x2f3/0x780
    [ 1494.203091]  schedule+0x27/0xa0
    [ 1494.203177]  schedule_preempt_disabled+0x15/0x30
    [ 1494.203381]  __mutex_lock.constprop.0+0x544/0xa60
    [ 1494.203560]  ? xenbus_scanf+0xbd/0x100
    [ 1494.203636]  device_del+0x3a/0x3e0
    [ 1494.203717]  device_unregister+0x17/0x60
    [ 1494.203791]  xenbus_dev_changed+0x247/0x2a0
    [ 1494.203865]  ? __pfx_xenwatch_thread+0x10/0x10
    [ 1494.354139]  xenwatch_thread+0x92/0x1c0
    [ 1494.354274]  ? __pfx_autoremove_wake_function+0x10/0x10
    [ 1494.354545]  kthread+0xfc/0x240
    [ 1494.355389]  ? __pfx_kthread+0x10/0x10
    [ 1494.355615]  ret_from_fork+0x158/0x170
    [ 1494.355706]  ? __pfx_kthread+0x10/0x10
    [ 1494.355805]  ret_from_fork_asm+0x1a/0x30
    [ 1494.355890]  </TASK>
    ...
    [ 1496.396208] task:(udev-worker)   state:D stack:0     pid:824   tgid:=
824   ppid:270    task_flags:0x400140 flags:0x00080003
    [ 1496.398700] Call Trace:
    [ 1496.398753]  <TASK>
    [ 1496.398805]  __schedule+0x2f3/0x780
    [ 1496.398884]  schedule+0x27/0xa0
    [ 1496.398961]  schedule_timeout+0x83/0x100
    [ 1496.399036]  ? __pfx_process_timeout+0x10/0x10
    [ 1496.399141]  xennet_create_dev+0x27e/0x340 [xen_netfront]
    [ 1496.399246]  ? split+0xac/0x130
    [ 1496.399326]  ? __pfx_autoremove_wake_function+0x10/0x10
    [ 1496.399727]  netfront_probe+0x16/0x70 [xen_netfront]
    [ 1496.399833]  xenbus_dev_probe+0xe6/0x1d0
    [ 1496.399920]  really_probe+0xde/0x340
    [ 1496.400005]  ? pm_runtime_barrier+0x54/0x90
    [ 1496.400084]  ? __pfx___driver_attach+0x10/0x10
    [ 1496.400213]  __driver_probe_device+0x84/0x140
    [ 1496.400339]  driver_probe_device+0x1f/0xa0
    [ 1496.400416]  __driver_attach+0xba/0x1c0
    [ 1496.400632]  bus_for_each_dev+0x8e/0xe0
    [ 1496.400714]  bus_add_driver+0x142/0x220
    [ 1496.400790]  driver_register+0x72/0xd0
    [ 1496.400876]  __xenbus_register_frontend+0x2b/0x50
    [ 1496.400977]  ? __pfx_netif_init+0x10/0x10 [xen_netfront]
    [ 1496.401079]  do_one_initcall+0x5a/0x310
    [ 1496.401159]  do_init_module+0x90/0x250
    [ 1496.401239]  init_module_from_file+0x88/0xd0
    [ 1496.401345]  ? __pfx_ovl_file_accessed+0x10/0x10 [overlay]
    [ 1496.401557]  idempotent_init_module+0x114/0x310
    [ 1496.401656]  __x64_sys_finit_module+0x6d/0xd0
    [ 1496.401773]  do_syscall_64+0x87/0x7e0
    [ 1496.401848]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [ 1496.401946] RIP: 0033:0x7abadbeba7b9
    [ 1496.402029] RSP: 002b:00007ffc0ffba5d8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000139
    [ 1496.402163] RAX: ffffffffffffffda RBX: 00005aa7d2036580 RCX: 00007ab=
adbeba7b9
    [ 1496.556946] RDX: 0000000000000000 RSI: 00007abadb36d44d RDI: 0000000=
00000001b
    [ 1496.557171] RBP: 0000000000000000 R08: 0000000000000000 R09: 00005aa=
7d20518c0
    [ 1496.560779] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ab=
adb36d44d
    [ 1496.561000] R13: 0000000000020000 R14: 00005aa7d1f24b00 R15: 0000000=
000000000
    [ 1496.561301]  </TASK>

Xenstore content at this time is:

device/vif =3D ""   (n0,r61)
device/vif/0 =3D ""   (n61,r59)
device/vif/0/backend =3D "/local/domain/59/backend/vif/61/0"   (n61,r59)
device/vif/0/backend-id =3D "59"   (n61,r59)
device/vif/0/state =3D "1"   (n61,r59)
device/vif/0/handle =3D "0"   (n61,r59)
device/vif/0/mac =3D "00:16:3e:5e:6c:00"   (n61,r59)
device/vif/0/trusted =3D "0"   (n61,r59)
device/vif/0/mtu =3D "1500"   (n59,r61)

/local/domain/59/backend/vif/61/0/frontend =3D "/local/domain/61/device/vif=
/0"   (n59,r61)
/local/domain/59/backend/vif/61/0/frontend-id =3D "61"   (n59,r61)
/local/domain/59/backend/vif/61/0/online =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/state =3D "2"   (n59,r61)
/local/domain/59/backend/vif/61/0/script =3D "/etc/xen/scripts/vif-route-qu=
bes"   (n59,r61)
/local/domain/59/backend/vif/61/0/mac =3D "00:16:3e:5e:6c:00"   (n59,r61)
/local/domain/59/backend/vif/61/0/ip =3D "10.137.0.19 fd09:24ef:4179::a89:1=
3"   (n59,r61)
/local/domain/59/backend/vif/61/0/bridge =3D "xenbr0"   (n59,r61)
/local/domain/59/backend/vif/61/0/handle =3D "0"   (n59,r61)
/local/domain/59/backend/vif/61/0/type =3D "vif"   (n59,r61)
/local/domain/59/backend/vif/61/0/hotplug-status =3D "connected"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-sg =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-gso-tcpv4 =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-gso-tcpv6 =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-ipv6-csum-offload =3D "1"   (n59,=
r61)
/local/domain/59/backend/vif/61/0/feature-rx-copy =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-xdp-headroom =3D "1"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-rx-flip =3D "0"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-multicast-control =3D "1"   (n59,=
r61)
/local/domain/59/backend/vif/61/0/feature-dynamic-multicast-control =3D "1"=
   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-split-event-channels =3D "1"   (n=
59,r61)
/local/domain/59/backend/vif/61/0/multi-queue-max-queues =3D "2"   (n59,r61)
/local/domain/59/backend/vif/61/0/feature-ctrl-ring =3D "1"   (n59,r61)

So, from what I see, the attach happens quite early in practice -
during, or even before loading xen-netfront module. But then, the device
is misinterpreted as a stale one.

This does not happen every time, only sometimes. I guess it's related to
the timing of the network-attach call.

I'll try to add some more logging (especially what state it got from
xenstore vs what it expected), but maybe you have some ideas already?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/1HLk8rI+WaJVlOf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmprWc8ACgkQ24/THMrX
1yzTKgf+OV6eXsme//jMLsZ7MuosckZiZTxxnQ6WwXYcTZFb3qF+OFhfFdRvqy/z
WoX/Zld3xyvnoXcQYva+jXYRvEqwkrHbqzN/Idaf4SXkbLQUd5MSXbx6jOGzcFPu
y5JUzzpBu4Qy0c4vKq2+4AlcHnQlFZq25KK7neiwgFrs+p0uhxaBiRBTAk066nmg
WkAFRza5J7lMTVLwuCgEaQ0s/TyqqvkgxXxeNoOH0M0kEEK3REJ2xcZQkP6MNhMH
GIfyoofJ+mDGgsmH3vciybKS1sanpWj1WVhKw5WrVbrbg4Luq7vTMURRoy29q4BZ
1yZ+A+gP+fBlhQ+Gkkjf2wf7CQP1lg==
=RzRj
-----END PGP SIGNATURE-----

--/1HLk8rI+WaJVlOf--

