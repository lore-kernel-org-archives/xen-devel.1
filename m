Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779CFC982F7
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 18:29:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427865.1650619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ilk-0008Or-0h; Mon, 21 Sep 2026 18:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427865.1650619; Mon, 21 Sep 2026 18:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ilj-0008Ok-SV; Mon, 21 Sep 2026 18:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1427865;
 Mon, 21 Sep 2026 18:29:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <support@trinity-net.com>) id 1x8ilj-0008Oe-5D
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:29:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ili-00EiAx-6g
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 20:29:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <support@trinity-net.com>)
 id 6ab1774f-2eae-0a2a0a5409dd-0a2a4507c880-42
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 20:29:34 +0200
Received: from [46.105.44.31] (helo=5.mo564.mail-out.ovh.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <support@trinity-net.com>)
 id 6ab1778d-b4ea-0a2a45070019-2e692c1fbd41-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 20:29:34 +0200
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo564.mail-out.ovh.net (Postfix) with ESMTPS id 4hpWwY16nJz87rB;
 Mon, 21 Sep 2026 18:29:33 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <marmarek@invisiblethingslab.com>; Mon, 21 Sep 2026 18:29:33 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.231.30])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4hpWwY0Jt5z1xp3; Mon, 21 Sep 2026 18:29:33 +0000 (UTC)
Received: from mailstore7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.1.8.7])
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id
 2C3E3B81C5B; Mon, 21 Sep 2026 18:29:32 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo-selector-1 header.d=trinity-net.com header.i="@trinity-net.com" header.h=From
Date: Mon, 21 Sep 2026 18:29:32 +0000 (UTC)
From: Support TRINITY <support@trinity-net.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	regressions <regressions@lists.linux.dev>, 
	linux-acpi <linux-acpi@vger.kernel.org>, 
	linux-pm <linux-pm@vger.kernel.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Stable <stable@vger.kernel.org>
Message-ID: <1909296988.289641012.1790015372050.JavaMail.zimbra@trinity-net.com>
In-Reply-To: <CAJZ5v0geSD8ig9_kcrPZp9FEzF+Oh34HV4F_aqyGF89TYVjDzw@mail.gmail.com>
References: <905771062.272724286.1789919301858.JavaMail.zimbra@trinity-net.com> <CAJZ5v0gg7kBtEhagR9SYKaPNstPC6aSyP7W4xBjP1r-kzbcH1A@mail.gmail.com> <arFe7-xa3HtCUOHs@mail-itl> <750088883.289173062.1790012799166.JavaMail.zimbra@trinity-net.com> <CAJZ5v0geSD8ig9_kcrPZp9FEzF+Oh34HV4F_aqyGF89TYVjDzw@mail.gmail.com>
Subject: Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks
 bare-metal Xen dom0 boot
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [213.169.178.160]
X-Authenticated-User: support@trinity-net.com
Thread-Topic: ACPI processor/cpuidle change in 6.18.52 breaks bare-metal Xen dom0 boot
Thread-Index: NJLEBWSSWTxHlP+F8t+OBJCvRxFPqg==
x-ovh-tracer-id: 8614541665962587675
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGlMSjzMXFz4ipw5mo6C1GD1JTY1bhHZVs/p5Nv78Znzkhq/k5NZSemwOJrLkzTGnUzuV0P/CTidewhj7HXiC0xfdN+5BaQEY8b3Kwct82UB6zjNGfqm7kJb4ttjwgACxdgPLh28GyRgxbQdrzMMGLFU4TEKIBs/Hh/ceN1Ms8ygaAkZa73h/yWpK10Zk+rPH2CFV4DqCBe6v/FcGsC5wPEGnDFVYlvd9IBdmSLOpOraDnlklBSiGLwer90wPuuQCpMujjVvhFtN0P1Oz74+OkrfJx/Jy5A4CUoHvG19uKnRaPEM3CpSTQsCAUgou9SCvuq9JVZsKk9ivIous6fBlSjZ7Z7/Jjn5OzVnC++aJqeBliXUKmxjzvGg2M6Fd0m0BF5aPPVc2cc37vdPCpjL5mXCfVqvzWz4U18syj1KDv4yjaiMSHUk46h3992+zDjBAWdKcBQ6W7VWeiG9YtWP5EimiGuAjzW05zdL4fyq5avG/IGV9b4I/zT3euOpFSSmXC60MqmO9zIXqVc3KJH753bxtVK4VKSCbhNwoX2cX3XzYsiLX8Yvh8tULu32jL5zJ423LULpLitttfsvYREBBOP4sKgzZmb719gBBRa/EV02sDW8ufbUjS6z10SAS7esMwLu1EOHzNBh3dEpP0E4RRroixZggB5S1JvVPhXSCiYtA
DKIM-Signature: a=rsa-sha256; bh=IevpoNZUdNHiZNaAd8TIxxp6Ai1AoI8OzFr7NwXjpT8=;
 c=relaxed/relaxed; d=trinity-net.com; h=From; s=ovhmo-selector-1;
 t=1790015373; v=1;
 b=SWCas21S6jgUkey7Pctwpi5A1HH+1Teaj1FMFU60FF+y6ADgSfJkAx0zCroA2Q+A+PuHs1+s
 1g0+8j4nyaGafOo/4es9hi5OFB+M5U7l00jYO38PRNAQNnGL+DcOBaBlcMynflLysfjtgbK9STj
 K7peWk5eJEJs2dHYQ+PzyDaJ+nfqJR8HQc7Nq2xTzZ7Z3Di2xncyVKULZt/8C/VfSmKy1tVV3be
 lVhVJS16oZDxnDLi4BwQgPWxE1DXQLXMexKnIjff0a+HNED62AYx0U8TabTrTaztf4RhgVRR7Gd
 x4HFNYwju0WotFHLv5drWc7SVfZOP++XWpGv89qzL33hw==
X-purgate-ID: tlsNG-ef75cf/1790015374-A7CD7AE4-50AB1B90/0/0
X-purgate-type: clean
X-purgate-size: 2043

Hello,

Thank you, that makes sense and matches the behavior I observed.

The Alpine 6.18.52 kernel fails as Xen dom0, while restoring the previous
ACPI idle registration lifecycle makes it boot again. That is consistent
with 13ebeef6a1b9 being present in 6.18.y without the later dependency
that avoids calling acpi_processor_power_init() in the !cpuidle_get_driver(=
)
case.

I will try testing 6.18.52 with commit 0089ce1c056a ("ACPI: processor:
Update cpuidle driver check in __acpi_processor_start()") applied,
instead of using my lifecycle revert.

If that boots successfully on the affected Alpine Xen dom0 hosts, I will
report the result here.

Thanks,
Tony


-----Message original-----
De: Rafael J. Wysocki (Intel) <rafael@kernel.org>
=C3=A0: Support TRINITY <support@trinity-net.com>
Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>; Rafa=
el J. Wysocki (Intel) <rafael@kernel.org>; regressions <regressions@lists.l=
inux.dev>; linux-acpi <linux-acpi@vger.kernel.org>; linux-pm <linux-pm@vger=
.kernel.org>; xen-devel <xen-devel@lists.xenproject.org>; linux-kernel <lin=
ux-kernel@vger.kernel.org>; Stable <stable@vger.kernel.org>
Envoy=C3=A9: lundi 21 septembre 2026 20:07 CEST
Sujet : Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks ba=
re-metal Xen dom0 boot


On Mon, Sep 21, 2026 at 7:46=E2=80=AFPM Support TRINITY <support@trinity-ne=
t.com> wrote:
>
> Hello,
>
> Thank you, this matches what I see on the affected Alpine Xen dom0
> systems.
>
> I also tested Linux 6.18.52 with processor=3Dnocst on the Linux kernel
>
> Result: it still fails with the same black screen before dom0 userspace
> and networking come up.
>
> Marek's trace looks consistent with the failure mode I isolated: the
> crash happens from acpi_processor_power_init() while registering the
> cpuidle device.

I think I know what the problem is, see

https://lore.kernel.org/linux-acpi/CAJZ5v0h4giv53a2mPvJYT=3DfvBTj7vVXs=3Db7=
+qC2Q2L35qSTOSA@mail.gmail.com/

