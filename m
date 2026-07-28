Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D367BC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 23:04:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375070.1622345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woqqR-0002Ts-4L; Tue, 28 Jul 2026 23:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375070.1622345; Tue, 28 Jul 2026 23:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woqqR-0002Tk-1J; Tue, 28 Jul 2026 23:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1375070;
 Tue, 28 Jul 2026 23:04:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3bTVpagYKCdYK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 1woqqP-0002Te-E2
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 23:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woqqO-00CUdH-CM
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 01:04:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3bTVpagYKCdYK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a693560-5cb7-0a2a0a5109dd-0a2a450cd6ec-10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:04:16 +0200
Received: from [209.85.214.198] (helo=mail-pl1-f198.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3bTVpagYKCdYK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a69356e-f479-0a2a450c0019-d155d6c6f088-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:04:16 +0200
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ccd1958e8fso5377365ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:04:15 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785279854; x=1785884654; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1l81sd+1Dt+3WFLZZe7rfpxDHFJTbu6GbcdYA+gInbc=;
        b=f2lH5BEVFiMLq5SIQq06ZtSSCxVZPO1cR1RRWBYPzVMsKncyKWxe9uLoT2BOG39VMA
         FOTZA7K7fRhkDpDUiSpoD51z/x9lX334ayWoSb253/XAh/VoFD2zZGygy8Ij8pW5heWQ
         bOtef4hB8fePcCSM630GWxrybEMI4GUsKIRQrk4u2/+ujL4yuf4FX7dAwRA8YKlXUTbw
         RR3BRoTCQba2iR98CrFNjw85yX3dtYwidtM7PSgMdP5eWMOiKqlSN1VfAVw4axPZqdz0
         V3Zu35u8S/XgoIbdkCNwk9gLcqqEvwA7avhWwYdgs2hzfCIqaTL/GoYqa4fubCWAReAp
         9MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279854; x=1785884654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1l81sd+1Dt+3WFLZZe7rfpxDHFJTbu6GbcdYA+gInbc=;
        b=HuZU99OHjb4IpJPWX9wWX/6GfkNSbPyA+/+D13ZaVcdRNsthZqmOT/ehx7PddsPzyN
         gnV96Nwu3CcOd7YLPfrzger/kfX1b1gRpewJa2pRbVbncu+sdgPTV5QgmpwxLX1sMIz1
         X4EjjJU2/XMf6UVuNPndhjCjaGaYn85Pw3TTgCs7PevNsDMWkFLKUlHDKonXzahQcHR2
         UYiMbx5c6T+vJveBHemKepAS3LM+0L2yAbm+F5CWQcIEER3ztA3GWNHTky9s9pY+utVJ
         TqLjxrzD/BduBMSVsjwhA4Si6wV39aX2IS6yOTTzi+RAcLLLAUJ82zk99YvL6euFYcwu
         YyRg==
X-Forwarded-Encrypted: i=1; AHgh+RoOQGNhf5i+9HF1kKEvl3tWKBtp4yNN4n1vNXD1eH5esOZJ0LJiTQkxAOvbA1/A9+4RD/Wapfv/bco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOakIBibvqCWSwGYS1ztF2ctSkD1ZQN3zSJ+4Qr4R14XaeYQC+
	i7xcWkHOyQ8WM/4YT/mimLDW3gAsxqS06cUphPvQq9DzkwqLTAGqK1Gi6ziIjvo9fDdscmlu8IY
	Arc6UzQ==
X-Received: from plkz12.prod.google.com ([2002:a17:902:708c:b0:2ce:d2e2:393])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef07:b0:2cb:2b84:f431
 with SMTP id d9443c01a7336-2d015d607d0mr51470645ad.47.1785279853901; Tue, 28
 Jul 2026 16:04:13 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:04:13 -0700
In-Reply-To: <20260728144954.355376-8-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-8-dwmw2@infradead.org>
Message-ID: <amk1bREQeZNNW10n@google.com>
Subject: Re: [PATCH v7 07/36] KVM: x86: Restructure get_kvmclock()
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
X-purgate-ID: tlsNG-d25034/1785279856-03AD4A5B-D60359CE/0/0
X-purgate-type: clean
X-purgate-size: 2524

On Tue, Jul 28, 2026, David Woodhouse wrote:
> When the clock read fails (e.g. clocksource transitioning away from TSC),
> fall back to that path rather than proceeding with uninitialised data or
> spinning in the seqcount loop.

This is not restructuring, it is a logical change.  It's a good logical change,
but it needs to be isolated.  This is what I have locally (spoiler alert; I'm
working backwards a bit):

From: David Woodhouse <dwmw@amazon.co.uk>
Date: Tue, 28 Jul 2026 15:26:35 -0700
Subject: [PATCH] KVM: x86: Fall back to non-master-clock if clockread fails in
 get_kvmclock()

When computing kvmclock and the it's currently in master-clock mode, fall
back to the non-master-clock path if the clock read fils, e.g. if the
kernel's clocksource transitioning away from TSC but ka->use_master_clock
hasn't been udated yet.  The rdtsc() fall back was added (well, kept) in
commit c68dc1b577ea ("KVM: x86: Report host tsc and realtime values in
KVM_GET_CLOCK") purely to avoid uninitialized variables and compilation
problems on 32-bit kernels (already addressed).  In hindsight, keeping the
rdtsc() was a hack and a mistake.

Link: https://lore.kernel.org/all/CAOQ_QsgVqS_PuJo8F10Gg5Xw+tKt+5gDx+kJf1j3CiPO4MAOqg@mail.gmail.com
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: isolate from refactoring changes, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a0ed0969fcb3..895d3cf7bfcf 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1657,14 +1657,13 @@ static bool __get_kvmclock_master_clock(struct kvm *kvm,
 	if (!tsc_hz)
 		return false;
 
-	if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
-		data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
-		data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-	} else {
-		data->host_tsc = rdtsc();
-	}
+	if (!kvm_get_walltime_and_clockread(&ts, &data->host_tsc))
+		return false;
+
+	data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
+	data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC |
+		       KVM_CLOCK_TSC_STABLE;
 
-	data->flags |= KVM_CLOCK_TSC_STABLE;
 	hv_clock.tsc_timestamp = ka->master_cycle_now;
 	hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
 	kvm_get_time_scale(NSEC_PER_SEC,  tsc_hz,

base-commit: f8c5e70f5ed58dc9d39db90ecaba0ce76ac52189
--

