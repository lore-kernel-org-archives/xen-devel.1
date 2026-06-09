Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AFCCD8CAA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 15:15:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333486.1596499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyAJ-0006tO-38; Tue, 09 Jun 2026 15:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333486.1596499; Tue, 09 Jun 2026 15:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyAJ-0006tH-0Z; Tue, 09 Jun 2026 15:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1333486;
 Tue, 09 Jun 2026 15:14:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wWyAH-0006tA-Bj
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:14:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWyAG-006STS-Ns
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:14:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a282de9-bab6-0a2a0a5309dd-0a2a45029722-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:14:52 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a282deb-af86-0a2a45020019-ac6904fe9216-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:14:52 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E486A600C3;
 Tue,  9 Jun 2026 15:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4D31F00893;
 Tue,  9 Jun 2026 15:14:49 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:In-Reply-To:References:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018090;
	bh=uRyFSZRVHMnouzvaAVPL92GCgMdl12W9vVxoHpFOSfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=J1JRSmTT3Pr65ktIYwSRLzrcos1tMVN/f6KWS2nDExwJLaI0lUIE0Ry1IjS1Gk5Di
	 2nikAbM29lucoVup3x3n/GGzfbCdrqm/lsqTm3JkGDInTGp71kVYZ571kZFjNBKOOQ
	 eqcg+vLzOrpGODq/ph923QybBSTcJfLLb5c1Z0ZhCCBLMIJ/9YaKj6dg663cVXstXf
	 JhZ7PpYgeu0N5sZBxJd2NrtjoTGj0LXAch1pJJA+7IU4gkpkcLVvdSJI4QPw/8fpKn
	 grkqwjy5irSN5ojI23STjIQ5F0vBvODAA95m+Ar/2am8JyECFD5YopXIha4cPL5sjG
	 O/uBgPnbWTjXg==
From: Thomas Gleixner <tglx@kernel.org>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olivier Lambert
 <olivier.lambert@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests
 during PV spinlock initialization
In-Reply-To: <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
 <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
Date: Tue, 09 Jun 2026 17:14:45 +0200
Message-ID: <87y0gn3fve.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1781018092-A877A161-9197A29D/0/0
X-purgate-type: clean
X-purgate-size: 1449

On Tue, Jun 09 2026 at 11:27, Teddy Astie wrote:
> Le 08/06/2026 =C3=A0 17:15, Thomas Gleixner a =C3=A9crit=C2=A0:
>>   struct clocksource * __init __weak clocksource_default_clock(void)
>>   {
>> +	clocksource_register(&clocksource_jiffies);
>>   	return &clocksource_jiffies;
>>   }
>>=20=20=20
>>=20
>>=20
>
> Hmm, there's a case where clocksource_mutex gets taken twice (both in=20
> __clocksource_register_scale() (through clocksource_register()) and=20
> clocksource_done_booting()).

Bah.

> What about making clocksource_jiffies gain ->enable() to setup what ever=
=20
> needs to be (like calling __clocksource_update_freq_scale()) ?

Doesn't work either.

Updated version below. It's not pretty, but it should cure your
problem. If that's confirmed I think about a less ugly solution.

Thanks,

        tglx
---
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -60,15 +60,14 @@ EXPORT_SYMBOL(get_jiffies_64);
=20
 EXPORT_SYMBOL(jiffies);
=20
-static int __init init_jiffies_clocksource(void)
-{
-	return __clocksource_register(&clocksource_jiffies);
-}
-
-core_initcall(init_jiffies_clocksource);
+static bool cs_jiffies_registered __initdata;
=20
 struct clocksource * __init __weak clocksource_default_clock(void)
 {
+	if (!cs_jiffies_registered) {
+		__clocksource_register(&clocksource_jiffies);
+		cs_jiffies_registered =3D true;
+	}
 	return &clocksource_jiffies;
 }
=20

