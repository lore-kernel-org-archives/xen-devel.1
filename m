Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842BFC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 00:54:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381834.1625307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr3Pk-0004J7-5y; Tue, 04 Aug 2026 00:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381834.1625307; Tue, 04 Aug 2026 00:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr3Pj-0004Iz-Vu; Tue, 04 Aug 2026 00:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1381834;
 Tue, 04 Aug 2026 00:53:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3GzhxagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 1wr3Pj-0004It-Lk
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 00:53:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr3Pi-001mWE-5c
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 02:53:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3GzhxagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a713812-2eae-0a2a0a5409dd-0a2a45098ad0-14
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 02:53:50 +0200
Received: from [209.85.215.199] (helo=mail-pg1-f199.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3GzhxagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a71381c-be1a-0a2a45090019-d155d7c7d942-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 02:53:49 +0200
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb4bd11ddf8so4700936a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:53:49 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785804828; x=1786409628; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFqZcLCrY5f3+v3uGjD/c1GxsX1WczytwYYei8eRc4I=;
        b=DTnJdb9gae+0dN3jsn5oTQ3E3AxFA628rxnLCUMIiK8+IaZHNvxiQXiFQeNiVHhYE2
         OhRuw1tvmfhlI1LCFqPPBWvhe2VLiJSi8Xhgtsp9PRuJ0sOS53kuIEpPUR2m0RrNYOOF
         5RsVSlelNxwEfgEQlIMqRMvfd//SZAkJF67Dm/N/L6Nr9XTBY0mfKgv6G0dLlq6h5Fnv
         S+kV7bD/EQTDaIPLT/oNi99wbOSKGvJ3J3DomB6omQu9WxBAJlUdn3IT9Oh7iM1V5INp
         G0CbyaMd7brI4VrDNBxDXgu7vRNQsjo2hgYM607edcFCrcK3sbPKhy0LpPKRvKpoR88j
         cMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785804828; x=1786409628;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFqZcLCrY5f3+v3uGjD/c1GxsX1WczytwYYei8eRc4I=;
        b=eurGQBdyhYZ9u3J2Rl7d3Ln6Z+FwLbE0yvwZzw1SYwfnFoc7JopJxdmUEfzvO2929Z
         6M+r4Aq7/O3ZakPtVcv8EBwK/9APnz1XLwyBwrSL5ouORwpwhUPjbFwNy5t5XPW6ERN1
         iHTLhlhKmRNbE01XXp5V9Hiu4v0Htj9Eg2RXLKv7yzONRO6dlrn7GY5sycgjLAg3C9bK
         +4tjeAyIzBaIGPNTL6W1IJoZbo22stLRZeXjxZUCcCgXbgDAn9aln9twuKdE7lduKWQh
         ttxVMsEl9aOGW6pfHGmiOeFuDhpB6KjVoezdT0seHbHOWKK/wZjtHsHvnJyDp28h/Rt5
         t3oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkvQwrVHLLLWD2Yb8FGplbz22fU8B6SXi/+wywrYuppUCq+G30WUqk6UXYanABMytsqiFNMefe5Mw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4cLgI6bz88oBQp0/ektlHLPW96LcN3cn14C4LfgjJWPLjFHa8
	BE3zlOBDV7c26HS3Popw8fByd7zP+Y7enxuUbsMG7D/ZLGSE5d6cpsiPN3ExZu+BqPK5vk0zvUb
	aMaq5WA==
X-Received: from pgke23.prod.google.com ([2002:a63:f557:0:b0:c85:98b1:c613])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3397:b0:3c3:a140:9392
 with SMTP id adf61e73a8af0-3c92a28f176mr12976405637.0.1785804827335; Mon, 03
 Aug 2026 17:53:47 -0700 (PDT)
Date: Mon, 3 Aug 2026 17:53:46 -0700
In-Reply-To: <8b90851f38ef5b10cdcdc70e7543bd6b0b5e2773.camel@infradead.org>
Mime-Version: 1.0
References: <178552799129.2700794.10181439022561913222.b4-ty@google.com> <8b90851f38ef5b10cdcdc70e7543bd6b0b5e2773.camel@infradead.org>
Message-ID: <anE4GtMa33nz7qdK@google.com>
Subject: Re: [PATCH v6 00/36] Cleaning up the KVM clock mess
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
X-purgate-ID: tlsNG-bad1c0/1785804830-BCECE034-7A1A16D9/0/0
X-purgate-type: clean
X-purgate-size: 1522

On Sat, Aug 01, 2026, David Woodhouse wrote:
> On Fri, 2026-07-31 at 13:09 -0700, Sean Christopherson wrote:
> > Applied patch 1 to kvm-x86 clocks.
> >
> > [01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
> >         https://github.com/kvm-x86/linux/commit/3d4b20b5a7df
> 
> Thanks. Could the clocks branch be based on something that includes the
> timekeeping work from the timers-ptp-2026-06-13 merge (in v7.2-rc1)?

Yeah, I can rebase onto a 7.2-rcN.  Y'all are likely the only people that care
about the above commit, so a late rebase isn't a big deal.

There's basically zero chance I'll get the entire series applied for 7.3, but
"Use ktime_get_snapshot_id() for master clock" is at least in striking distance,
so there's no reason not to allow for the possibility.

> The later parts of the series depend on ktime_get_snapshot_id() and the
> reworked struct system_time_snapshot from there. Your kvm-x86/next
> branch does have it; I'll keep my WIP kvmclock8 branch based on that
> for now as I address the other comments.
> 
> 
> *   2d6d57f889f3 Merge tag 'timers-ptp-2026-06-13' of tip
> |\
> | * bc484a509673 ptp: vmclock: Use hw_cycles from snapshot for precise TSC pairing
> | ...
> | * ca1ec8bfac8c timekeeping: Add clocksource read_snapshot() method and hw_cycles to snapshot
> | ...
> | * ef22786707e3 timekeeping: Use system_time_snapshot::systime/monoraw instead of ::real/raw
> | * eba302268a01 timekeeping: Provide ktime_get_snapshot_id()



