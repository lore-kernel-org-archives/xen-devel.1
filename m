Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A1607E90C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2fSJV7n
Received: from list by lists.xenproject.org with outflank-mailman.1472456.1680326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOgo0-000819-EE; Wed, 04 Nov 2026 19:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472456.1680326; Wed, 04 Nov 2026 19:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOgo0-000811-9F; Wed, 04 Nov 2026 19:37:56 +0000
Received: by outflank-mailman (input) for mailman id 1472456;
 Wed, 04 Nov 2026 19:37:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3j4nragYKCa4gSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 1xOgny-00080v-GA
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 19:37:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOgnx-008CFj-M9
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:37:53 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3j4nragYKCa4gSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 6aeb8965-2eae-0a2a0a5409dd-0a2a450be336-20
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:53 +0100
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3j4nragYKCa4gSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@flex--seanjc.bounces.google.com>)
 id 6aeb8990-b7e8-0a2a450b0019-d155d6c5bc1d-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:53 +0100
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2eb2437d752so15698195ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:37:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793821071; x=1794425871; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5MszlfJHB7Xr7Xp5GjEvhWx25u5UBjAyc2/c9bnue0=;
        b=J2fSJV7nhESuY30FinsxwoYfs+beLGy9Ukk0R88oAst9/DNbgFjQuXwz8GbNqDJALO
         aGuSyi7Dv2EenHmlm93r9rWIPJmsyMTzUd2qR2AqDe3qi3GPfXzFwBYHgWXqNR1N2Lkc
         G0SR1gHj14acw57uzBFTOjz3MHHMdvxpgDYxYMhoJkXgiB0qHA5phVCnQR2rYIaZxGkR
         IFRjYP7P04blH6xs2/rOyeScRO2btc8qSerzx79Cop5KFYlyzk5ZfU0oYYzC+4UzlzRi
         5miS0Xoi3CJwLN7W8oAr38Frb4BbR7wWuJzum2m9h51jF9UIETLp2m8M4GB9MCOwcH1A
         OxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821071; x=1794425871;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5MszlfJHB7Xr7Xp5GjEvhWx25u5UBjAyc2/c9bnue0=;
        b=rz2fDJO7kcDMZA8WPKJU4jSWjlbtgYuOWVaPHWmpZ18QQzuB3Cm7kSzzBxLTI+mkX6
         Fxu2GhwXe2e3IjpOAJXAhKkvxhXX35PjbO9coUFgoeobO+lf2H9di0EFdf0Yor/5c4Nb
         KyqdS1d7tdj5SAZJAiqmXPgrRpv4krl7WOrzs8p3BiTCD9cBNcC13VuJ+3eqWwAE6xSx
         paIutkID6h5LZvlgkzqDVJ9oFpKDh0e/IQ/aGtSm9Wj3THrNs9+N9CW/d5BC9GwGOlQr
         I9WYKxCvFJLpdDXJHJzC2fFZ53+G/vgCG9oXErzR4rxirv9OrCpArs3ZLYGavP7vFv1B
         W2WA==
X-Forwarded-Encrypted: i=1; AKwUvBysEsq5pvGfIGvzUKD5CCoa/sbE+7as1LYvG6h3HoM2cr8Q+95nZZsusJ0Dm6/v8qh9S9ORuxmp6DM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8wyiO9wHoKROrEYz4Ci0VAglZONJpNDDZMpCMKs/FuQ0aNV/SV
	zx0oKRQVGLvh+BqFoR+ZchxrwKCbi1HKazUnbAW/ggLahFaac79cBboEoCiCsPDSNEUxFuuDPud
	NKh2wRA==
X-Received: from plww1.prod.google.com ([2002:a17:902:d101:b0:2e9:4a78:9294])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1986:b0:2e9:4d9f:a65b
 with SMTP id d9443c01a7336-2eb3651d564mr160599195ad.53.1793821071087; Wed, 04
 Nov 2026 11:37:51 -0800 (PST)
Date: Wed, 4 Nov 2026 11:37:50 -0800
In-Reply-To: <c9a6455eb88c24d4271b7a7c86f7a4e90799e40a.camel@infradead.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com> <aqLv9GwBNymyHs8q@google.com>
 <c9a6455eb88c24d4271b7a7c86f7a4e90799e40a.camel@infradead.org>
Message-ID: <auuJjiowddGlysWI@google.com>
Subject: Re: [PATCH v6 00/51] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1793821073-2C39B9EA-02C00EFF/0/0
X-purgate-type: clean
X-purgate-size: 1892
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 10, 2026, David Woodhouse wrote:
> On Thu, 2026-09-10 at 10:59 -0700, Sean Christopherson wrote:
> > On Thu, Aug 06, 2026, Sean Christopherson wrote:
> > > The primary goal of this series to fix flaws with SNP and TDX guests =
where a
> > > PV clock provided by the untrusted hypervisor is used instead of the =
secure
> > > TSC that is controlled by trusted firmware.
> > >=20
> > > The secondary goal is modernize running under KVM.=C2=A0 Currently, K=
VM guests will
> > > use TSC for clocksource, but not sched_clock.=C2=A0 And Linux-as-a-KV=
M-guest doesn't
> > > support paravirt enumeration of the TSC/APIC frequencies, even though=
 QEMU
> > > provides that information by default.
> > >=20
> > > The tertiary goal is to clean up the PV clock code to deduplicate log=
ic across
> > > hypervisors, and to hopefully make it all easier to maintain going fo=
rward.
> > >=20
> > > The quaternary goal is to clean up the TSC calibration code, which wa=
s made
> > > stupidly hard to follow by hypervisor code mixing in with the native
> > > calibration routines, instead of being implemented as a pure alternat=
ive.
> > >=20
> > > Note, the VMware and Xen changes still probably should get acks from =
those
> > > maintainers, as my understanding of what they're trying to do may be =
flawed.
> >=20
> > This (thankfully) still applies cleanly.=C2=A0 What can I do to help mo=
ve this forward?
>=20
> Nudge Thomas to spot that this is guest-side and we want him to pick it u=
p, I guess?

Amazingly, still applies cleanly on 7.4-rc1 and tip/master.  I know we're s=
hortly
after the merge window, but this has been sitting idle for months and addre=
sses
issues that are impacting a variety of end users.

Note, this also provides meaningful hardening for SNP and TDX.  /me stares =
intently
in the direction of Dave and Boris.

