Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684F4C55172
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 22:20:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379654.1624074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpvaa-0006js-9O; Fri, 31 Jul 2026 22:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379654.1624074; Fri, 31 Jul 2026 22:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpvaa-0006jl-60; Fri, 31 Jul 2026 22:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1379654;
 Fri, 31 Jul 2026 22:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wpvaY-0006jf-Ev
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 22:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpvaX-004S9d-14
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 00:20:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a6d1f41-5cb7-0a2a0a5109dd-0a2a4505e86a-40
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 00:20:20 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a6d1fa2-4cb1-0a2a45050019-ca0c7c99bfad-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 00:20:19 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 70DB87A00E1;
 Fri, 31 Jul 2026 18:20:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 31 Jul 2026 18:20:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 18:20:17 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785536418;
	 x=1785622818; bh=WOUhBEvnzTHE/2dvAmQD8E6p0SvIKyf3AOHpU49OlM0=; b=
	mns8B32dt0Omh5PyKFWMK1Afvue+krdCOR//Ce8WZa0dHRrFzs8q3eb0s6SEcSQy
	POLNu0nXUAOEutj1DlTs3KJXVq/tBUWBDEt8YQKNQWH1QubZpyItscZzBYGqd6+c
	cMBKlUeF3BY62pzfBebmiN1jGKA12esysTjzHeviUwQ5Uw5js0jxgYai20PatLLk
	qGPigffvcBNnAEGQC4DSvxUx0mKhF0UFyHPhZnsHtPOOvOF5KE0KR9EFJZ/kq+1e
	n3snKizKUlQtSX7zLOcHCcSaDvuynWL9ACLddQQs0UFsCIHvmhy4PajwfwR7FVFL
	9gyJCNwVqLGoK7nHxLPjHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785536418; x=1785622818; bh=WOUhBEvnzTHE/2dvAmQD8E6p0SvIKyf3AOH
	pU49OlM0=; b=ggx7RFAmIPR0P/EeNUWkfYs7m41l70NQcgq+sqgo5B6/l1Ev/k0
	kpuueZwwDtwwhztIkpQnWL1BACBNNMbDImVL4iM9SIEoboKOqucdbGBKhLCsFAq3
	PwbOQhmvgxWZt+xaFLDURm6i7xm6udAKbjUVKdRDWvff/MPnb52OrbPUpcU7ICUe
	LBKCaICb/yvvJx0hEfe/3MmHX0LLdGB6NFcCmPSeZmGszWGWSkKlfgl4dh0t5h+B
	TegtiB7E8BPE2FWGAtD+Ho1rhJ/wU4tuYC6J99pFNRsi9WCD/sTN22YfzG9F1kCM
	OU362uiAehlbRkmzoCZZrg6RP7HZ+lK5coA==
X-ME-Sender: <xms:oh9tai2bYozEaroHVUXZYfPMgdxVDndmghb2arJuu8mULrmoSvr_dA>
    <xme:oh9tarEfdkmzBn0OaAqzPpDZ_emwDAmf8wSQdOUB0B1X_Em9hL6lzRwSZZu_ZoPYw
    qduUFRK1Wt_dbnWUHL-Chu_EPBLUp0nArACN8hOLj2sErgT>
X-ME-Received: <xmr:oh9taoh6OVFQEossh1ET8Fwvw98AnZaJZuPwlrJz2nh3Dv7ReBO39skPreXrMOQgytyydvlVVVJceU9X4AzXtJgLmKgEzlc5GyY>
X-ME-Proxy-Cause: dmFkZTGoWgPCWqXG5+vX1I1BxqkhXdHrAbrP+3r9CqeRpKGLsp/OwLn98Fxkn+XibjIuAD
    vs/mE44eNCUNWrBtAL6U5t8SZ5XGx8ba3koruom/JLdF7r6+IdJbWxvLOYfKxD+tAugxRL
    bkVgJ17izofHXChv51UzaAwVjW7+zfkUymbKhQh8g36yCmVXK3D1ZS1d4oiM59iyd2Y/jg
    DvBjSqsUuVB1p83ExDR26VIAErgjOgvEMSYzn1ASHg4Fiu3dIZk7HkU/bC+Z0SevmTUpqx
    uL+cZqcrM8FUgz/DzQ2SHekCC2deIUfFSeYTjbNXah46qmWKM36JdygaJBnqTFEq89JVVv
    mx1Ck6ATWIF1MxcaixFQA7Tz8XpoEkfvE+YBCM+p33AI3qBYHZFU//nDY2h6ol+XcrNMVw
    v2WhLEuWxQhT4M9FEESv5RxGHbC/4mmSZTCVcYFXRgK5dpw7oixhEKFHXZru95Rje9uXzR
    GQORsaDnPixzY9Z0n1w/lcgP6wEQjpahIly1pEOoi9VBywIMlMy9+ZrtrX7eO18sDg1/Ep
    nrRXZziB/e9fL8N0g0hu8MukhWAMPq9H4JiRw2zY5lxrtZTAEtpaG1T36/E+QUUFSAkoBc
    3j/3BSj5ClBPSl8oOzae1JSJJtFrk21zuYeVJucTfNbbYuVGjmp31tXt6ipQ
X-ME-Proxy: <xmx:oh9tau-kyUZTY3mcsfNKK01bvdchLq88hIHEyr9Cz8OnoMPd-5A4IA>
    <xmx:oh9tanpxJIaXZ1-Dxx2A2dyWpCHW5Xhqw6nVB5nEH6q8fvJi5wf9oQ>
    <xmx:oh9tal_Yh-HXNIAr-j4zAZ3CJh_QhRMqvvS1D4Cg9MQtmdu4R2oxkw>
    <xmx:oh9tajUtZcguVMnf4lOLcHP3GQhB_NvXb8oL5-T5Ll9QfgvjrBie9w>
    <xmx:oh9tatLiHQhMblrWj1O38RxD8lHQpfWdg0FCk5MYI6csG02qpVKtPRUF>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 1 Aug 2026 00:20:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: xenwatch thread deadlock after dynamic network attach
Message-ID: <am0fn5o20Hqu4j1F@mail-itl>
References: <amtZz0VOkHnviZMj@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hviPNOAOinnC5KVc"
Content-Disposition: inline
In-Reply-To: <amtZz0VOkHnviZMj@mail-itl>
X-purgate-ID: tlsNG-c201ff/1785536420-F64B42A1-B3F0F019/0/0
X-purgate-type: clean
X-purgate-size: 9698

--hviPNOAOinnC5KVc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 1 Aug 2026 00:20:15 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?PT91dGYtOD9CP1NzTzhjbWRsYmlCSGNtL0Rudz09Pz0=?= <jgross@suse.com>
Subject: Re: xenwatch thread deadlock after dynamic network attach

On Thu, Jul 30, 2026 at 04:03:59PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> I've hit yet another issue with network attach. This time, it looks like
> the code to handle forceful re-attach triggers when it shouldn't. The
> test is basically:
> 1. Start the backend domain
> 2. Start the frontend domain without any vif attached.
> 3. Attach vif (equivalent of xl network-attach).
>=20
> First I get:
>=20
>     [   17.476245] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.502933] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.551204] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.612171] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.654823] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.676268] xen vif-0: xenbus: state reset occurred, reconnecting
>     [   17.691250] xen_netfront: Initialising Xen virtual ethernet driver
>     [   17.692288] vif vif-0: xenbus: state reset occurred, reconnecting
>=20
> I'm not sure why it's repeated this many times (xenstore watch triggers
> this many times?), but then, all xenstore watch operations in that
> domain hangs. Inspecting tasks ("t" sysrq) shows:
>=20
>     [ 1494.201304] task:xenbus          state:S stack:0     pid:62    tgi=
d:62    ppid:2      task_flags:0x208040 flags:0x00080000
>     [ 1494.201607] Call Trace:
>     [ 1494.201659]  <TASK>
>     [ 1494.201711]  __schedule+0x2f3/0x780
>     [ 1494.201789]  ? __pfx_xenbus_thread+0x10/0x10
>     [ 1494.201890]  schedule+0x27/0xa0
>     [ 1494.201966]  xenbus_thread+0x1a8/0x200
>     [ 1494.202044]  ? __pfx_autoremove_wake_function+0x10/0x10
>     [ 1494.202144]  kthread+0xfc/0x240
>     [ 1494.202347]  ? __pfx_kthread+0x10/0x10
>     [ 1494.202418]  ret_from_fork+0x158/0x170
>     [ 1494.202568]  ? __pfx_kthread+0x10/0x10
>     [ 1494.202636]  ret_from_fork_asm+0x1a/0x30
>     [ 1494.202704]  </TASK>
>     [ 1494.202773] task:xenwatch        state:D stack:0     pid:63    tgi=
d:63    ppid:2      task_flags:0x208040 flags:0x00080000
>     [ 1494.202936] Call Trace:
>     [ 1494.202980]  <TASK>
>     [ 1494.203023]  __schedule+0x2f3/0x780
>     [ 1494.203091]  schedule+0x27/0xa0
>     [ 1494.203177]  schedule_preempt_disabled+0x15/0x30
>     [ 1494.203381]  __mutex_lock.constprop.0+0x544/0xa60
>     [ 1494.203560]  ? xenbus_scanf+0xbd/0x100
>     [ 1494.203636]  device_del+0x3a/0x3e0
>     [ 1494.203717]  device_unregister+0x17/0x60
>     [ 1494.203791]  xenbus_dev_changed+0x247/0x2a0
>     [ 1494.203865]  ? __pfx_xenwatch_thread+0x10/0x10
>     [ 1494.354139]  xenwatch_thread+0x92/0x1c0
>     [ 1494.354274]  ? __pfx_autoremove_wake_function+0x10/0x10
>     [ 1494.354545]  kthread+0xfc/0x240
>     [ 1494.355389]  ? __pfx_kthread+0x10/0x10
>     [ 1494.355615]  ret_from_fork+0x158/0x170
>     [ 1494.355706]  ? __pfx_kthread+0x10/0x10
>     [ 1494.355805]  ret_from_fork_asm+0x1a/0x30
>     [ 1494.355890]  </TASK>
>     ...
>     [ 1496.396208] task:(udev-worker)   state:D stack:0     pid:824   tgi=
d:824   ppid:270    task_flags:0x400140 flags:0x00080003
>     [ 1496.398700] Call Trace:
>     [ 1496.398753]  <TASK>
>     [ 1496.398805]  __schedule+0x2f3/0x780
>     [ 1496.398884]  schedule+0x27/0xa0
>     [ 1496.398961]  schedule_timeout+0x83/0x100
>     [ 1496.399036]  ? __pfx_process_timeout+0x10/0x10
>     [ 1496.399141]  xennet_create_dev+0x27e/0x340 [xen_netfront]
>     [ 1496.399246]  ? split+0xac/0x130
>     [ 1496.399326]  ? __pfx_autoremove_wake_function+0x10/0x10
>     [ 1496.399727]  netfront_probe+0x16/0x70 [xen_netfront]
>     [ 1496.399833]  xenbus_dev_probe+0xe6/0x1d0
>     [ 1496.399920]  really_probe+0xde/0x340
>     [ 1496.400005]  ? pm_runtime_barrier+0x54/0x90
>     [ 1496.400084]  ? __pfx___driver_attach+0x10/0x10
>     [ 1496.400213]  __driver_probe_device+0x84/0x140
>     [ 1496.400339]  driver_probe_device+0x1f/0xa0
>     [ 1496.400416]  __driver_attach+0xba/0x1c0
>     [ 1496.400632]  bus_for_each_dev+0x8e/0xe0
>     [ 1496.400714]  bus_add_driver+0x142/0x220
>     [ 1496.400790]  driver_register+0x72/0xd0
>     [ 1496.400876]  __xenbus_register_frontend+0x2b/0x50
>     [ 1496.400977]  ? __pfx_netif_init+0x10/0x10 [xen_netfront]
>     [ 1496.401079]  do_one_initcall+0x5a/0x310
>     [ 1496.401159]  do_init_module+0x90/0x250
>     [ 1496.401239]  init_module_from_file+0x88/0xd0
>     [ 1496.401345]  ? __pfx_ovl_file_accessed+0x10/0x10 [overlay]
>     [ 1496.401557]  idempotent_init_module+0x114/0x310
>     [ 1496.401656]  __x64_sys_finit_module+0x6d/0xd0
>     [ 1496.401773]  do_syscall_64+0x87/0x7e0
>     [ 1496.401848]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     [ 1496.401946] RIP: 0033:0x7abadbeba7b9
>     [ 1496.402029] RSP: 002b:00007ffc0ffba5d8 EFLAGS: 00000246 ORIG_RAX: =
0000000000000139
>     [ 1496.402163] RAX: ffffffffffffffda RBX: 00005aa7d2036580 RCX: 00007=
abadbeba7b9
>     [ 1496.556946] RDX: 0000000000000000 RSI: 00007abadb36d44d RDI: 00000=
0000000001b
>     [ 1496.557171] RBP: 0000000000000000 R08: 0000000000000000 R09: 00005=
aa7d20518c0
>     [ 1496.560779] R10: 0000000000000000 R11: 0000000000000246 R12: 00007=
abadb36d44d
>     [ 1496.561000] R13: 0000000000020000 R14: 00005aa7d1f24b00 R15: 00000=
00000000000
>     [ 1496.561301]  </TASK>
>=20
> Xenstore content at this time is:
>=20
> device/vif =3D ""   (n0,r61)
> device/vif/0 =3D ""   (n61,r59)
> device/vif/0/backend =3D "/local/domain/59/backend/vif/61/0"   (n61,r59)
> device/vif/0/backend-id =3D "59"   (n61,r59)
> device/vif/0/state =3D "1"   (n61,r59)
> device/vif/0/handle =3D "0"   (n61,r59)
> device/vif/0/mac =3D "00:16:3e:5e:6c:00"   (n61,r59)
> device/vif/0/trusted =3D "0"   (n61,r59)
> device/vif/0/mtu =3D "1500"   (n59,r61)
>=20
> /local/domain/59/backend/vif/61/0/frontend =3D "/local/domain/61/device/v=
if/0"   (n59,r61)
> /local/domain/59/backend/vif/61/0/frontend-id =3D "61"   (n59,r61)
> /local/domain/59/backend/vif/61/0/online =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/state =3D "2"   (n59,r61)
> /local/domain/59/backend/vif/61/0/script =3D "/etc/xen/scripts/vif-route-=
qubes"   (n59,r61)
> /local/domain/59/backend/vif/61/0/mac =3D "00:16:3e:5e:6c:00"   (n59,r61)
> /local/domain/59/backend/vif/61/0/ip =3D "10.137.0.19 fd09:24ef:4179::a89=
:13"   (n59,r61)
> /local/domain/59/backend/vif/61/0/bridge =3D "xenbr0"   (n59,r61)
> /local/domain/59/backend/vif/61/0/handle =3D "0"   (n59,r61)
> /local/domain/59/backend/vif/61/0/type =3D "vif"   (n59,r61)
> /local/domain/59/backend/vif/61/0/hotplug-status =3D "connected"   (n59,r=
61)
> /local/domain/59/backend/vif/61/0/feature-sg =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-gso-tcpv4 =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-gso-tcpv6 =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-ipv6-csum-offload =3D "1"   (n5=
9,r61)
> /local/domain/59/backend/vif/61/0/feature-rx-copy =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-xdp-headroom =3D "1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-rx-flip =3D "0"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-multicast-control =3D "1"   (n5=
9,r61)
> /local/domain/59/backend/vif/61/0/feature-dynamic-multicast-control =3D "=
1"   (n59,r61)
> /local/domain/59/backend/vif/61/0/feature-split-event-channels =3D "1"   =
(n59,r61)
> /local/domain/59/backend/vif/61/0/multi-queue-max-queues =3D "2"   (n59,r=
61)
> /local/domain/59/backend/vif/61/0/feature-ctrl-ring =3D "1"   (n59,r61)
>=20
> So, from what I see, the attach happens quite early in practice -
> during, or even before loading xen-netfront module. But then, the device
> is misinterpreted as a stale one.
>=20
> This does not happen every time, only sometimes. I guess it's related to
> the timing of the network-attach call.
>=20
> I'll try to add some more logging (especially what state it got from
> xenstore vs what it expected), but maybe you have some ideas already?

It considers initial attach a reset because backend-id from xenstore
doesn't match dev->otherend_id (which is 0 at this point). My guess is
that another xenstore watch triggers xenbus_dev_changed() before
xenbus_read_otherend_details() gets called to fill dev->otherend_id.
Maybe the dev->otherend_id check should be conditional on
dev->otherend !=3D NULL?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hviPNOAOinnC5KVc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmptH58ACgkQ24/THMrX
1yxcPgf5ATn5k5v+EMYFOsnYS+5A8QqHwN5nDpR+sw/pISB9fJOb16ZcTeYSajc6
Ts9/YtzeLdGNNyeIlGfFZRXmQZBRNhSNH/Y2qOGymCUH69bY3MmOXn07SkvsmXSY
gB2H98PoMvKMKIX2KMRB4WE3aksyMPuIEnq+94mQZQjxKjc2kjWv3BjOgHNMGDnh
Glu9mBnhsgRcU0CCttWh6/iV61dYeUPYTqd89PhoDV63zfEy39tSndM60qZgwfbs
VLo+rrJIRmoCRvRtMRhqmRaiu+CLJzhFrFo/wIp5pFa5fBimT8uauRW556V5HQt2
l/pA7WxLoM9PIa8cIu7HIdUbpZBDVQ==
=xvAo
-----END PGP SIGNATURE-----

--hviPNOAOinnC5KVc--

