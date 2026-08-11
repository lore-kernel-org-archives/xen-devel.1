Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA89C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 17:29:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388398.1629560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtqHY-0006px-Qd; Tue, 11 Aug 2026 17:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388398.1629560; Tue, 11 Aug 2026 17:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtqHY-0006pq-Mt; Tue, 11 Aug 2026 17:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1388398;
 Tue, 11 Aug 2026 17:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <301t7agYKCdIG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1wtqHW-0006pk-V1
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 17:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtqHW-000nlV-Ba
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 19:28:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <301t7agYKCdIG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a7b5bd4-2eae-0a2a0a5409dd-0a2a450ccb8e-2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:28:54 +0200
Received: from [209.85.214.199] (helo=mail-pl1-f199.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <301t7agYKCdIG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a7b5bd4-f479-0a2a450c0019-d155d6c7c082-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:28:54 +0200
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ce8a76df2dso2289095ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:28:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786469332; x=1787074132; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMDt/Sj6YjXvFiWQr62Lu+RNKL1NV+pa3PqCNwc1t5I=;
        b=GQoy05yVlVVZhRt7DEV/1JSGbRSOEVtEaYWBRv7w7tfB0+k0eOa5ia+wQLmnJY8qdY
         POmBroRg1thoPUgK4LUNldRzDx50Nn0l4IZ3tb6ESFm79ZrLYAbSzZvxdRiJU+iBzNOw
         0Kiaz1eKXyd4vaGvIG7+ZfOU/8shLMmx014TzKJ8+hNoteXGBZ15GOpFU9dTnYEYvYh1
         kRv5yByNPIIHSngv14ciFNsEdtlR1kfJMtd5tCs8FSnDmA5QKTCJP22FnhuJI0wKdB3q
         yrcglzUTaWXS2GcDT2NbmVWEKu29suC0wmVVTDMFaz+n3lIrgec8m+oNIp+Luzm3JOje
         si2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786469332; x=1787074132;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMDt/Sj6YjXvFiWQr62Lu+RNKL1NV+pa3PqCNwc1t5I=;
        b=HgE0/zyB1fat9dEAstwbHyjpwmBOhoPRTCgm9OTVOOcCxASXl0/GFl1CEEuQh5sJxC
         8rTxqDMsSZmWuGmVBRAEjRVmq4fkSfLDMoP1oCtgnF82b28o/RmWfeIjqpFYzzqINw4h
         hKWHfbYinL/nT7Yc2joY1zUQyHga1pyVJADcOaEeWZSRl7EJVb3/8fZRP+Ca7+feRcLb
         Se3o6h7FOGyuMHWVdQN0dfR2XqE90wCXHB2gRGuWDovQcX/eYBOx30iD1xMT29nSWBU3
         uuB02E8QZRDjstF/Fso8gTQQE5aVEejwaIa7ilNP1iG2ZJ2OiNOcyrXBjx2C/kjmR0qG
         7P3w==
X-Forwarded-Encrypted: i=1; AHgh+RrRBs2djBKYV2UgKC2i/udChumepn1pvs6Nf9cXIQZySTqJxt1wtgnrG7nexEfxI+nYNR5fd1B9HcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKgkGCw4HMZRQmsMzQ+OEOisLOOMSikch4wPuNMA9h/GmI9+nA
	0Ia9p7g/Ar7ADS7tnIURyT6KuD07iwRJ8hNRJVC4HUdMEOB7yrQImjkS6t4iSCfI2cdQ29qOdrr
	HnRgKAQ==
X-Received: from pleu12.prod.google.com ([2002:a17:903:41cc:b0:2cb:97d4:2e28])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:350c:b0:2c9:bf82:dd11
 with SMTP id d9443c01a7336-2d3177f6e83mr61151075ad.7.1786469331912; Tue, 11
 Aug 2026 10:28:51 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:28:51 -0700
In-Reply-To: <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-18-dwmw2@infradead.org> <anoOz2rZ02KFk1l-@google.com>
 <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com>
 <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
 <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
Message-ID: <antb01WqOrs-tztm@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-d25034/1786469334-018C5A5B-48B8C25F/0/0
X-purgate-type: clean
X-purgate-size: 2978

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 09:40 -0700, Sean Christopherson wrote:
> > 
> > > 
> > > FWIW in my local tree I've just extended the pvclock_migration_test to
> > > test precisely the thing you were concerned about: three vCPUs with
> > > divergent TSC offsets, migrated by setting each vCPU's TSC and then
> > > invoking KVM_SET_CLOCK_GUEST once, through vCPU0. 
> > 
> > I wasn't actually concerned about migration, I was concerned about time going
> > backwards from the guest's perspective.
> 
> But KVM_[SG]ET_CLOCK_GUEST is *purely* for migration. 

Huh?  I raised my concern in the context of "Allow KVM master clock mode when
TSCs are offset from each other", and AFAICT, nothing ensures that won't cause
problems.

Aaah, it clears PVCLOCK_TSC_STABLE_BIT and relies on the guest to clean up the
mess.  So the guest won't see time go backwards, but it could see time stop for
an extended duration, or jump forward.

E.g. if tsc_timestamp is set to a per-VM value, and vCPU0's offset matches the
effectively offset, but vCPU1's offset does not, then vCPU1 could see time that
is either far in the past or far in the future when doing __pvclock_clocksource_read().
If vCPU1 computes time that's in the future, the guest would see a potentially
massive jump forward in time.

And after that, or if vCPU1 computes time that's in the past, if the "future"
vCPU stopped running, the "past" vCPU would see time stop as last_value would be
ahead of the "past" vCPU's current time for a very long while.

	if ((valid_flags & PVCLOCK_TSC_STABLE_BIT) &&
		(flags & PVCLOCK_TSC_STABLE_BIT))
		return ret;

	/*
	 * Assumption here is that last_value, a global accumulator, always goes
	 * forward. If we are less than that, we should not be much smaller.
	 * We assume there is an error margin we're inside, and then the correction
	 * does not sacrifice accuracy.
	 *
	 * For reads: global may have changed between test and return,
	 * but this means someone else updated poked the clock at a later time.
	 * We just need to make sure we are not seeing a backwards event.
	 *
	 * For updates: last_value = ret is not enough, since two vcpus could be
	 * updating at the same time, and one of them could be slightly behind,
	 * making the assumption that last_value always go forward fail to hold.
	 */
	last = raw_atomic64_read(&last_value);
	do {
		if (ret <= last)
			return last;
	} while (!raw_atomic64_try_cmpxchg(&last_value, &last, ret));


> And your variant just added a dependency on wallclock time back into it

Can you elaborate?  I'm guessing I don't entirely understand what you mean by
wallclock time.

> again, where wallclock should *only* be used for setting the TSC, and even
> then *only* for a live *migration* to a different host, not a live *update*
> via kexec/KHO on the same host, where the TSC should be restored as an offset
> from the host TSC.



