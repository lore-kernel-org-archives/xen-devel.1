Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444F6070F21
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=U2D3wB8g
Received: from list by lists.xenproject.org with outflank-mailman.1472893.1680721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOiIA-0001iH-2t; Wed, 04 Nov 2026 21:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472893.1680721; Wed, 04 Nov 2026 21:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOiI9-0001iA-WE; Wed, 04 Nov 2026 21:13:10 +0000
Received: by outflank-mailman (input) for mailman id 1472893;
 Wed, 04 Nov 2026 21:13:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1xOiI8-0001i4-9F
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:13:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOiI7-00Fboi-JY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 22:13:07 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aeb9fd7-bab6-0a2a0a5309dd-0a2a45028148-24
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 22:13:07 +0100
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aeb9fe3-6ca4-0a2a45020019-416d716c94e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 22:13:07 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6CD5940E015B; 
 Wed,  4 Nov 2026 21:13:06 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3U2b1QxYClr0; Wed,  4 Nov 2026 21:13:03 +0000 (UTC)
Received: from ehlo.thunderbird.net (mobile-166-137-178-199.mycingular.net
 [166.137.178.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
 (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A83DE40E0184;
 Wed,  4 Nov 2026 21:12:25 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:CC:Subject:In-Reply-To:References"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793826783; bh=0j7BAmeDQwwtoMBbI3yPl2jkhlbza1J7ZyqEZwxFy/Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U2D3wB8gdl4a43Fm64mNA6ZM2USpJCLIwCtamRC4PcjkbT+N3A+hed3l9E18bhVyX
	 oyhZdr4pmbZ9eFP5+UCjaiCqxDqDEyCl5ThDEaSCrWe2xKlb2DMAun1RtooMcmRDqa
	 eDsyzK2506LRm7jgiN+z6u0Z1GSJ6mRPPgSKdtbyccDShhNEccOFW/K62qudpbnOHO
	 SuXkb4mORY7livXLiDQ5+Ip3dhFyNLyBkSYk8+E/lcB8GyQjyDz6I/LGeYT5wFvdBj
	 FKYmI/T9PuFn7AWswVv0APe7rfg2hIcSKMRF4R3nCwdF87X5HfcAZi2pnEz6WA2+8k
	 bEgan0ne6CSX6MMOvrHt4UoxaCLJIB74x5NpPo5jrHn7UD+kmGPkTKobaONv8p8eym
	 lsXxoQ+Iw1u25zQiuWo2B+I6nBcwQfZxDqWFuXkh0s8suZoS+fsGW5BIXPFwGHmCjW
	 h9d+gKicHVqg9hI1B/pB8JJ71qDvalixTPqVIl6tG+dSHRTJSU8ENCPsEW7V+RMGV9
	 f+p4oTHAT38MTk38E04WDhaktVkQ3/v2M/KgowJqc897S71W4JCMPk05g3RqtWVczr
	 14fNyyPqp67ozGOUyRQEtaJDemz2FCPZ+WTgKsrUg+W0CM0uspv1CtxXXyYzxM65w5
	 7jyZ1iDKDaNuk1lF+8s1+8zs=
Date: Wed, 04 Nov 2026 21:12:19 +0000
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>,
 David Woodhouse <dwmw2@infradead.org>
CC: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Michael Kelley <mhklinux@outlook.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 00/51] x86: Try to wrangle PV clocks vs. TSC
User-Agent: K-9 Mail for Android
In-Reply-To: <auuJjiowddGlysWI@google.com>
References: <20260806233609.212337-1-seanjc@google.com> <aqLv9GwBNymyHs8q@google.com> <c9a6455eb88c24d4271b7a7c86f7a4e90799e40a.camel@infradead.org> <auuJjiowddGlysWI@google.com>
Message-ID: <375997C1-577B-440C-B347-B8D256FA84B3@alien8.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1793826787-F22A92AC-2A2137A6/0/0
X-purgate-type: clean
X-purgate-size: 2397
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On November 4, 2026 7:37:50 PM UTC, Sean Christopherson <seanjc@google=2Eco=
m> wrote:
>On Thu, Sep 10, 2026, David Woodhouse wrote:
>> On Thu, 2026-09-10 at 10:59 -0700, Sean Christopherson wrote:
>> > On Thu, Aug 06, 2026, Sean Christopherson wrote:
>> > > The primary goal of this series to fix flaws with SNP and TDX guest=
s where a
>> > > PV clock provided by the untrusted hypervisor is used instead of th=
e secure
>> > > TSC that is controlled by trusted firmware=2E
>> > >=20
>> > > The secondary goal is modernize running under KVM=2E=C2=A0 Currentl=
y, KVM guests will
>> > > use TSC for clocksource, but not sched_clock=2E=C2=A0 And Linux-as-=
a-KVM-guest doesn't
>> > > support paravirt enumeration of the TSC/APIC frequencies, even thou=
gh QEMU
>> > > provides that information by default=2E
>> > >=20
>> > > The tertiary goal is to clean up the PV clock code to deduplicate l=
ogic across
>> > > hypervisors, and to hopefully make it all easier to maintain going =
forward=2E
>> > >=20
>> > > The quaternary goal is to clean up the TSC calibration code, which =
was made
>> > > stupidly hard to follow by hypervisor code mixing in with the nativ=
e
>> > > calibration routines, instead of being implemented as a pure altern=
ative=2E
>> > >=20
>> > > Note, the VMware and Xen changes still probably should get acks fro=
m those
>> > > maintainers, as my understanding of what they're trying to do may b=
e flawed=2E
>> >=20
>> > This (thankfully) still applies cleanly=2E=C2=A0 What can I do to hel=
p move this forward?
>>=20
>> Nudge Thomas to spot that this is guest-side and we want him to pick it=
 up, I guess?
>
>Amazingly, still applies cleanly on 7=2E4-rc1 and tip/master=2E  I know w=
e're shortly
>after the merge window, but this has been sitting idle for months and add=
resses
>issues that are impacting a variety of end users=2E
>
>Note, this also provides meaningful hardening for SNP and TDX=2E  /me sta=
res intently
>in the direction of Dave and Boris=2E

Would you believe me if I told you you're in the "review" mbox?

The damn thing just keeps growing constantly :-/

I would love it if we had a review scoring thing like the net folks - whoe=
ver reviews others' patches, gets looked at first=2E=2E=2E and no, I don't =
mean you with that=2E

:)
--=20
Small device=2E Typos and formatting crap

