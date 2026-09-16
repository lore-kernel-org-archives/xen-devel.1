Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFFC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 09:34:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422523.1647892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6m1j-0001T5-FD; Wed, 16 Sep 2026 09:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422523.1647892; Wed, 16 Sep 2026 09:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6m1j-0001Sy-Cd; Wed, 16 Sep 2026 09:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1422523;
 Wed, 16 Sep 2026 09:34:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x6m1h-0001Ss-V5
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 09:34:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6m1h-00EySy-BW
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 11:34:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aaa6285-8faa-0a2a0a5109dd-0a2a450892e8-28
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 11:34:01 +0200
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aaa6287-f659-0a2a45080019-67a8ac9bdc77-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 11:34:00 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AF8E514001FD;
 Wed, 16 Sep 2026 05:33:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 16 Sep 2026 05:33:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:33:58 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1789551239; x=1789637639; bh=LW
	pTYQZgKfMCkuYeRduPa053Fwih7qDBbKTFi2jaGEY=; b=ZNi06WFEQai14WQwOY
	r3i0BkR+NllOXiPj9a36D0lscVvBVRH5alYJ+up8AfVSpLbRU6aCmb511pN/PTHn
	h7kDGwd7cjevfQK5E1dlTFt1qA4nq0m5qIcKgFXZwntx23F9jwtWn+OM1MtGiOhC
	/Ve1i48d38yHiKmYRtxJG0uXQYylyWT3vevwJOP6L9/j5C1jIvURu81p0SrE6Hin
	Ub1Izp+xdly3QukFfBqjwul2Ze3Tuo1I3SSgioepzWOXzxNMiHs8zlynCE6OCcZy
	A7y8QgCh2akGaVrlUbJQnhKQA2W8pDV0VtvwwLmLoVdAKhw1nk0XtwwTMHM/ypwe
	xm+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789551239; x=
	1789637639; bh=LWpTYQZgKfMCkuYeRduPa053Fwih7qDBbKTFi2jaGEY=; b=S
	v+oQx6ZXkLQCSm7xMf2OKjeIhGywPNagEdvTmR4bZsCl1PLha3sj5Cj2m73ne89b
	unYgeUH/FV/7o6QHagFqMigzj2N98I4bZoUK49AexvZAD7P+WL4TZF7LfaCW3VM6
	uYcbJx6f4BvQwezOddgwEaZMg6gbWM5PXfePcN0PPKesKRwehBmewxfGogkraIu6
	ZATZ02ENlL9LzoWXrS8fKBjZyq9MGiYy+BMWcDAg9CDCltvlKVYF2vR86lDdpZSn
	PJVN8skKnbpqxIMPm8hUR6u1lVk/Vp2V0k2lh2Zl7AN/onyUd5Aj/gEm2OFmZudA
	fF0b8qWqxV6Whg6H/3tHg==
X-ME-Sender: <xms:h2KqatThPi9yPx9bd71b1H6_k89hD_08uDVsvxqFdrzZIDA55SGGQw>
    <xme:h2Kqasw-rnxwpCU81Jup0IRnJjz3K1sgLZDvtBTcCj1VCkldKVtbCQ0L60mJAbWPF
    mYGZqvBKN-z3RniULwjTq89TDJtz_suOu3FTuT1SaI6Bv_ljmI>
X-ME-Received: <xmr:h2Kqagf79KLf3NZPDbb8wSu-JVYaeskKcxqqma9L1NV3VM88RrHaQr8iVBdY>
X-ME-Proxy-Cause: dmFkZTEc+7cC+aORsuuJJRdg6p2lxD1IHfyjNi4R3dq07RP4R5Y+HVBi7D9bzsE/UDdLBC
    7CD7vDZe6ClS2P/K1nCP9tvAF/sAgAzBxyBVTwQvJ0DM38x2bf0aIINwTz7EtXTq6/2ZJp
    5otaxbs57LvjtbdYd2KBFMHFNMNXDjESkTeNF6d0Hywg9HzIaRJUZXh+rXSuowX2RiMkCg
    riy76luua9iPrUfwt8eshCOguIh/Ga1RdiuPpzRSbaZAtdG0V6I7ufJNowAsctniyWZdqy
    5q75xZWUoSjb1yASeKFS02hUcshGnw6TmlZ1tG5+JQ2Dip80u5EgI3kbC+Ut7vf6S0+jBk
    UhEk0L9qB6XyO4KPXjG5H1F9+shtorkRkkt6o5SlM8sL/5H4rMDS9VZW7aAL2vdr2JSrQu
    pGCD/rf8hHLynQUxcYT4DRSH/heFA23DxYcZb7eyBN2nVxDzsmGjZ3iHp5EzKFDO7zgVWZ
    KrQqFew2WmFf/M+YYjmjyACorkv1e/T78ovPVAg7Wrr/C9whDbzxxxnpkMSljr0CrFiAuZ
    6B/uX0IBZ9Q3tMIDyM60+BX+7GDNxgszk51jqggkuorqduvu7J/lmAgXCPBoO3t9GdYYgd
    09VJyPZg/5QroMzMqJjcwJExxEne+hUP9iftqnrVTOjSBsl6I3+QcpA0Sryg
X-ME-Proxy: <xmx:h2KqagJ1JSDZUAtxd7d7puhEvk0JFqMyeu1R2ciJv93mptmd56B52g>
    <xmx:h2KqapEbsdqqJTwDNlZDsaV0nD7lzAO5lC614M9RXrK64ZCW0rqTXA>
    <xmx:h2KqairucAEUqTfc1H8028P7XcwWvFvWJ0T-mDqeo4_vIz-koFtgWQ>
    <xmx:h2KqaqTWW-maUbJTI5lhxukHBWF057BYmgtk1RbkUQTjXBAUim8QMQ>
    <xmx:h2KqaqVcOfJ3PPBXo5-YYllX6yGxVEwCgC9JydbKeXqU-svYRcbGx7gP>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 16 Sep 2026 11:33:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>
Subject: Test report: IGD (RPL) SR-IOV on Xen - Linux 7.2.5, xe
Message-ID: <aqpihasUJ4lTZcnU@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NmWEiZWwkdeD2rFi"
Content-Disposition: inline
X-purgate-ID: tlsNG-c1860d/1789551241-D594A87B-29B048F9/0/0
X-purgate-type: clean
X-purgate-size: 16345

--NmWEiZWwkdeD2rFi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:33:57 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>
Subject: Test report: IGD (RPL) SR-IOV on Xen - Linux 7.2.5, xe

Hi,

I was talking with Teddy about SR-IOV of Intel GPU and decided to repeat
the test.

My setup is:
Hardware:
Intel Raptor Lake system with:
00:02.0 Display controller [0380]: Intel Corporation Raptor Lake-S GT1 [UHD=
 Graphics 770] [8086:a780] (rev 04)

Software:
Qubes 4.3 with Xen 4.19.5
(PV) Dom0 Linux 6.18.51, with "xe.force_probe=3Da780 i915.force_probe=3D!a7=
80" on
cmdline
DomU Linux 7.2.5, also with "xe.force_probe=3Da780 i915.force_probe=3D!a780"
on cmdline

Hardware-wise, this platform should support SR-IOV:
https://www.intel.com/content/www/us/en/support/articles/000093216/graphics=
/processor-graphics.html

But software-wise, the "xe" driver doesn't officially support this
platform - this one is officially still on i915 - which in upstream
version doesn't support SR-IOV at all. There is a i915 branch from
Intel with SR-IOV support added, but it isn't maintained anymore, and I
had worse results with it (although some people report it worked for
them).

I tried also LNL, but the one I have does not advertise SR-IOV at all
(not sure if hardware lacking, or disabled at firmware level).
I have also PTL that should theoretically be better, but userspace side
on the current Qubes OS version is too old for that, so it's more
complicated for me to test.

Anyway, back to RPL:

Dom0 steps:
echo 7 > /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs

This makes the VFs to appear, now they can be assigned to a domU (I used
00:02.1).

Dom0 messages on boot:
[    6.063363] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
[    6.063373] xe 0000:00:02.0: [drm] Found alderlake_s/raptorlake_s (devic=
e ID a780) integrated display version 12.00 stepping D0
[    6.119874] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/ad=
ls_dmc_ver2_01.bin (v2.1)
[    6.129583] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from i=
915/tgl_guc_70.bin version 70.49.4
[    6.134506] xe 0000:00:02.0: [drm] Tile0: GT0: Using HuC firmware from i=
915/tgl_huc.bin version 7.9.3
[    6.224163] xe 0000:00:02.0: [drm] Tile0: GT0: vcs1 fused off
[    6.224237] xe 0000:00:02.0: [drm] Tile0: GT0: vcs3 fused off
[    6.224240] xe 0000:00:02.0: [drm] Tile0: GT0: vcs4 fused off
[    6.224244] xe 0000:00:02.0: [drm] Tile0: GT0: vcs5 fused off
[    6.224248] xe 0000:00:02.0: [drm] Tile0: GT0: vcs6 fused off
[    6.224251] xe 0000:00:02.0: [drm] Tile0: GT0: vcs7 fused off
[    6.224255] xe 0000:00:02.0: [drm] Tile0: GT0: vecs1 fused off
[    6.224259] xe 0000:00:02.0: [drm] Tile0: GT0: vecs2 fused off
[    6.224262] xe 0000:00:02.0: [drm] Tile0: GT0: vecs3 fused off
[    6.242973] xe 0000:00:02.0: [drm] Registered 4 planes with drm panic
[    6.242979] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
[    6.323673] xe 0000:00:02.0: [drm] Allocated fbdev into stolen failed: -=
12
[    6.326272] Console: switching to colour frame buffer device 128x48
[    6.343560] xe 0000:00:02.0: [drm] fb1: xedrmfb frame buffer device

And then on adding VFs:
[  274.829735] xe 0000:00:02.0: [drm] Tile0: GT0: PF: VF1..VF7 provisioned =
with 598138880 (570 MiB) GGTT
[  274.830257] xe 0000:00:02.0: [drm] Tile0: GT0: PF: VF1..VF7 provisioned =
with 9324 GuC context IDs
[  274.831069] xe 0000:00:02.0: [drm] Tile0: GT0: PF: VF1..VF7 provisioned =
with 36 GuC doorbell IDs
[  274.935797] pci 0000:00:02.1: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  274.935947] pci 0000:00:02.1: DMAR: Skip IOMMU disabling for graphics
[  274.936569] i915 0000:00:02.1: I915 probe blocked for Device ID a780.
[  274.936607] xe 0000:00:02.1: enabling device (0000 -> 0002)
[  274.940247] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
[  274.940272] xe 0000:00:02.1: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  274.958658] xe 0000:00:02.1: [drm] Tile0: GT0: vcs1 fused off
[  274.958664] xe 0000:00:02.1: [drm] Tile0: GT0: vcs3 fused off
[  274.958668] xe 0000:00:02.1: [drm] Tile0: GT0: vcs4 fused off
[  274.958671] xe 0000:00:02.1: [drm] Tile0: GT0: vcs5 fused off
[  274.958674] xe 0000:00:02.1: [drm] Tile0: GT0: vcs6 fused off
[  274.958677] xe 0000:00:02.1: [drm] Tile0: GT0: vcs7 fused off
[  274.958680] xe 0000:00:02.1: [drm] Tile0: GT0: vecs1 fused off
[  274.958683] xe 0000:00:02.1: [drm] Tile0: GT0: vecs2 fused off
[  274.958686] xe 0000:00:02.1: [drm] Tile0: GT0: vecs3 fused off
[  274.964105] [drm] Initialized xe 1.1.0 for 0000:00:02.1 on minor 1
[  274.964276] pci 0000:00:02.2: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  274.964297] pci 0000:00:02.2: DMAR: Skip IOMMU disabling for graphics
[  274.964426] i915 0000:00:02.2: I915 probe blocked for Device ID a780.
[  274.964440] xe 0000:00:02.2: enabling device (0000 -> 0002)
[  274.965163] xe 0000:00:02.2: [drm] Running in SR-IOV VF mode
[  274.965167] xe 0000:00:02.2: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  274.981117] xe 0000:00:02.2: [drm] Tile0: GT0: vcs1 fused off
[  274.981124] xe 0000:00:02.2: [drm] Tile0: GT0: vcs3 fused off
[  274.981127] xe 0000:00:02.2: [drm] Tile0: GT0: vcs4 fused off
[  274.981130] xe 0000:00:02.2: [drm] Tile0: GT0: vcs5 fused off
[  274.981134] xe 0000:00:02.2: [drm] Tile0: GT0: vcs6 fused off
[  274.981137] xe 0000:00:02.2: [drm] Tile0: GT0: vcs7 fused off
[  274.981140] xe 0000:00:02.2: [drm] Tile0: GT0: vecs1 fused off
[  274.981143] xe 0000:00:02.2: [drm] Tile0: GT0: vecs2 fused off
[  274.981146] xe 0000:00:02.2: [drm] Tile0: GT0: vecs3 fused off
[  274.986586] [drm] Initialized xe 1.1.0 for 0000:00:02.2 on minor 2
[  274.986666] pci 0000:00:02.3: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  274.986690] pci 0000:00:02.3: DMAR: Skip IOMMU disabling for graphics
[  274.986873] i915 0000:00:02.3: I915 probe blocked for Device ID a780.
[  274.986886] xe 0000:00:02.3: enabling device (0000 -> 0002)
[  274.987857] xe 0000:00:02.3: [drm] Running in SR-IOV VF mode
[  274.987949] xe 0000:00:02.3: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  275.000724] xe 0000:00:02.3: [drm] Tile0: GT0: vcs1 fused off
[  275.000730] xe 0000:00:02.3: [drm] Tile0: GT0: vcs3 fused off
[  275.000733] xe 0000:00:02.3: [drm] Tile0: GT0: vcs4 fused off
[  275.000736] xe 0000:00:02.3: [drm] Tile0: GT0: vcs5 fused off
[  275.000739] xe 0000:00:02.3: [drm] Tile0: GT0: vcs6 fused off
[  275.000742] xe 0000:00:02.3: [drm] Tile0: GT0: vcs7 fused off
[  275.000745] xe 0000:00:02.3: [drm] Tile0: GT0: vecs1 fused off
[  275.000748] xe 0000:00:02.3: [drm] Tile0: GT0: vecs2 fused off
[  275.000751] xe 0000:00:02.3: [drm] Tile0: GT0: vecs3 fused off
[  275.005750] [drm] Initialized xe 1.1.0 for 0000:00:02.3 on minor 3
[  275.005819] pci 0000:00:02.4: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  275.005844] pci 0000:00:02.4: DMAR: Skip IOMMU disabling for graphics
[  275.006222] i915 0000:00:02.4: I915 probe blocked for Device ID a780.
[  275.006236] xe 0000:00:02.4: enabling device (0000 -> 0002)
[  275.007191] xe 0000:00:02.4: [drm] Running in SR-IOV VF mode
[  275.007197] xe 0000:00:02.4: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  275.023297] xe 0000:00:02.4: [drm] Tile0: GT0: vcs1 fused off
[  275.023303] xe 0000:00:02.4: [drm] Tile0: GT0: vcs3 fused off
[  275.023306] xe 0000:00:02.4: [drm] Tile0: GT0: vcs4 fused off
[  275.023309] xe 0000:00:02.4: [drm] Tile0: GT0: vcs5 fused off
[  275.023312] xe 0000:00:02.4: [drm] Tile0: GT0: vcs6 fused off
[  275.023315] xe 0000:00:02.4: [drm] Tile0: GT0: vcs7 fused off
[  275.023318] xe 0000:00:02.4: [drm] Tile0: GT0: vecs1 fused off
[  275.023321] xe 0000:00:02.4: [drm] Tile0: GT0: vecs2 fused off
[  275.023324] xe 0000:00:02.4: [drm] Tile0: GT0: vecs3 fused off
[  275.028862] [drm] Initialized xe 1.1.0 for 0000:00:02.4 on minor 4
[  275.028936] pci 0000:00:02.5: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  275.028958] pci 0000:00:02.5: DMAR: Skip IOMMU disabling for graphics
[  275.029139] i915 0000:00:02.5: I915 probe blocked for Device ID a780.
[  275.029151] xe 0000:00:02.5: enabling device (0000 -> 0002)
[  275.030260] xe 0000:00:02.5: [drm] Running in SR-IOV VF mode
[  275.030266] xe 0000:00:02.5: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  275.042968] xe 0000:00:02.5: [drm] Tile0: GT0: vcs1 fused off
[  275.042974] xe 0000:00:02.5: [drm] Tile0: GT0: vcs3 fused off
[  275.042977] xe 0000:00:02.5: [drm] Tile0: GT0: vcs4 fused off
[  275.042980] xe 0000:00:02.5: [drm] Tile0: GT0: vcs5 fused off
[  275.042983] xe 0000:00:02.5: [drm] Tile0: GT0: vcs6 fused off
[  275.042986] xe 0000:00:02.5: [drm] Tile0: GT0: vcs7 fused off
[  275.042989] xe 0000:00:02.5: [drm] Tile0: GT0: vecs1 fused off
[  275.042992] xe 0000:00:02.5: [drm] Tile0: GT0: vecs2 fused off
[  275.042995] xe 0000:00:02.5: [drm] Tile0: GT0: vecs3 fused off
[  275.047932] [drm] Initialized xe 1.1.0 for 0000:00:02.5 on minor 5
[  275.048093] pci 0000:00:02.6: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  275.048125] pci 0000:00:02.6: DMAR: Skip IOMMU disabling for graphics
[  275.048443] i915 0000:00:02.6: I915 probe blocked for Device ID a780.
[  275.048456] xe 0000:00:02.6: enabling device (0000 -> 0002)
[  275.049613] xe 0000:00:02.6: [drm] Running in SR-IOV VF mode
[  275.049622] xe 0000:00:02.6: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  275.068094] xe 0000:00:02.6: [drm] Tile0: GT0: vcs1 fused off
[  275.068100] xe 0000:00:02.6: [drm] Tile0: GT0: vcs3 fused off
[  275.068103] xe 0000:00:02.6: [drm] Tile0: GT0: vcs4 fused off
[  275.068107] xe 0000:00:02.6: [drm] Tile0: GT0: vcs5 fused off
[  275.068110] xe 0000:00:02.6: [drm] Tile0: GT0: vcs6 fused off
[  275.068113] xe 0000:00:02.6: [drm] Tile0: GT0: vcs7 fused off
[  275.068116] xe 0000:00:02.6: [drm] Tile0: GT0: vecs1 fused off
[  275.068119] xe 0000:00:02.6: [drm] Tile0: GT0: vecs2 fused off
[  275.068122] xe 0000:00:02.6: [drm] Tile0: GT0: vecs3 fused off
[  275.073227] [drm] Initialized xe 1.1.0 for 0000:00:02.6 on minor 6
[  275.073299] pci 0000:00:02.7: [8086:a780] type 00 class 0x038000 PCIe Ro=
ot Complex Integrated Endpoint
[  275.073323] pci 0000:00:02.7: DMAR: Skip IOMMU disabling for graphics
[  275.073512] i915 0000:00:02.7: I915 probe blocked for Device ID a780.
[  275.073525] xe 0000:00:02.7: enabling device (0000 -> 0002)
[  275.074485] xe 0000:00:02.7: [drm] Running in SR-IOV VF mode
[  275.074581] xe 0000:00:02.7: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  275.088133] xe 0000:00:02.7: [drm] Tile0: GT0: vcs1 fused off
[  275.088139] xe 0000:00:02.7: [drm] Tile0: GT0: vcs3 fused off
[  275.088142] xe 0000:00:02.7: [drm] Tile0: GT0: vcs4 fused off
[  275.088146] xe 0000:00:02.7: [drm] Tile0: GT0: vcs5 fused off
[  275.088149] xe 0000:00:02.7: [drm] Tile0: GT0: vcs6 fused off
[  275.088152] xe 0000:00:02.7: [drm] Tile0: GT0: vcs7 fused off
[  275.088155] xe 0000:00:02.7: [drm] Tile0: GT0: vecs1 fused off
[  275.088159] xe 0000:00:02.7: [drm] Tile0: GT0: vecs2 fused off
[  275.088162] xe 0000:00:02.7: [drm] Tile0: GT0: vecs3 fused off
[  275.093163] [drm] Initialized xe 1.1.0 for 0000:00:02.7 on minor 7
[  275.093338] xe 0000:00:02.0: [drm] PF: Enabled 7 of 7 VFs


And then domU kernel messages:
[  101.601460] xe 0000:00:07.0: [drm] Running in SR-IOV VF mode
[  101.601479] xe 0000:00:07.0: [drm] VF: migration disabled: experimental =
feature not available on production builds
[  101.616800] xe 0000:00:07.0: [drm] Tile0: GT0: vcs1 fused off
[  101.616818] xe 0000:00:07.0: [drm] Tile0: GT0: vcs3 fused off
[  101.616831] xe 0000:00:07.0: [drm] Tile0: GT0: vcs4 fused off
[  101.616844] xe 0000:00:07.0: [drm] Tile0: GT0: vcs5 fused off
[  101.616856] xe 0000:00:07.0: [drm] Tile0: GT0: vcs6 fused off
[  101.616872] xe 0000:00:07.0: [drm] Tile0: GT0: vcs7 fused off
[  101.616885] xe 0000:00:07.0: [drm] Tile0: GT0: vecs1 fused off
[  101.616899] xe 0000:00:07.0: [drm] Tile0: GT0: vecs2 fused off
[  101.616912] xe 0000:00:07.0: [drm] Tile0: GT0: vecs3 fused off
[  101.623546] [drm] Initialized xe 1.1.0 for 0000:00:07.0 on minor 0

but when actually trying to use the device, it fails:
[  177.031375] xe 0000:00:07.0: [drm] Tile0: GT0: Schedule disable failed t=
o respond, guc_id=3D2
[  177.031520] xe 0000:00:07.0: [drm] Xe device coredump has been created
[  177.031558] xe 0000:00:07.0: [drm] Check your /sys/class/drm/card0/devic=
e/devcoredump/data
[  177.031598] xe 0000:00:07.0: [drm] Tile0: GT0: trying reset from guc_exe=
c_queue_timedout_job [xe]
[  177.031934] xe 0000:00:07.0: [drm] Tile0: GT0: reset queued
[  177.031985] xe 0000:00:07.0: [drm] Tile0: GT0: reset started
[  177.092882] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0xffff
[  177.143396] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.211682] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.270458] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.333223] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.392473] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.447398] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.515673] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.574551] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.637391] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: GuC mmio request =
0x5507: no reply 0x5507
[  177.637455] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: VF: Failed to res=
et GuC state (-ETIMEDOUT)
[  177.637537] xe 0000:00:07.0: [drm] *ERROR* Tile0: GT0: reset failed (-ET=
IMEDOUT)
[  177.637610] xe 0000:00:07.0: [drm] *ERROR* CRITICAL: Xe has declared dev=
ice 0000:00:07.0 as wedged.
[  177.637610] IOCTLs and executions are blocked. Only a rebind may clear t=
he failure
[  177.637610] Please file a _new_ bug report at https://gitlab.freedesktop=
=2Eorg/drm/xe/kernel/issues/new
[  177.637744] xe 0000:00:07.0: [drm] device wedged, needs recovery
[  177.637842] xe 0000:00:07.0: [drm] Tile0: GT0: Timedout job: seqno=3D429=
4967175, lrc_seqno=3D4294967175, guc_id=3D2, flags=3D0x0 in Xorg [1388]

Full logs, note multiple files there (unfortunately start of Xen log is cut=
):
https://gist.github.com/marmarek/fe5cdd3a82efc75a02f5b3050e6b5c89

I kinda suspect getting similar result on PTL, but I'll hold off with
the proper bug report until I can actually confirm it.
I'll repeat the test on Xen 4.22 later.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NmWEiZWwkdeD2rFi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqqYoUACgkQ24/THMrX
1yznMgf9FGkgF3LjGrMzbMYdVZJLexSo/N5oqdFOTNduAirhZt8wkZLW4TmRQIx+
/6tsxRlZsbNfE9Hc27fKgFjU+Ry5toMJH4Q1WvAXjkzjHRREvUf/jQTX+OyCs/8C
wf6sdprXKUxKIT2AIcYFOoBNUUAT77Bp4AJaZTkwmFesAbW4JUqHezPomK1cFdbR
85YfTJtboX5JzGrR8W5AQPuZ4vnlTTcgRTcHK6nhn7VpM42rQsrteE2SM5HJmxmd
1t+E9uwzYr/t26zMNAR9c+6SrAL84/7R4m3NPDYydJOFAsYbCFNyTpOD77CQ7srM
hFBHQQohr1fpVbCGw0+hECdAWEsJ7w==
=yRu6
-----END PGP SIGNATURE-----

--NmWEiZWwkdeD2rFi--

