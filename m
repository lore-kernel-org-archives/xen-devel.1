Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D648DC79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 17:59:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415096.1644615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4j3S-0002kn-D1; Thu, 10 Sep 2026 17:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415096.1644615; Thu, 10 Sep 2026 17:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4j3S-0002kf-9h; Thu, 10 Sep 2026 17:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1415096;
 Thu, 10 Sep 2026 17:59:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <39O-iagYKCbstfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 1x4j3Q-0002kZ-Dk
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4j3P-006DKw-N1
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 19:59:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <39O-iagYKCbstfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6aa2eff4-bab6-0a2a0a5309dd-0a2a4507a67a-6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 19:59:19 +0200
Received: from [209.85.214.199] (helo=mail-pl1-f199.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <39O-iagYKCbstfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6aa2eff5-b4ea-0a2a45070019-d155d6c7c98f-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 19:59:19 +0200
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2d63bad3d09so115518995ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 10:59:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789063157; x=1789667957; darn=lists.xenproject.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdUk7xT6Q2S0XYOIdYUuypvFM5moeaGi7+AJeTxN8N4=;
        b=WFP+AFZrYHH0SQy0PqX4Us9uYX9nfMhqip2FWF6A5Q48FIDJ4iAh43vo/vuKRnCmfm
         XUPjiCa+nLD74io6+U9j5ipK7rkbDU2LUnwcywkxMKcgMzQmHhxW7HwlCld95hEZEXzf
         /IHonfft51t3aC9+BMKrgddwkwxer1nruxgGy6qViOJQK3wgx6+GjgHxD7IQYz3wnfQ+
         zDyyAjt8jJIP13n/E+JVZDHX0jBvSBC07N8WG+QvsR6jTO3bQokzbO9hMeHDWPsTT5oC
         4SZG4IaqdYeG/PWbg0KA5T/KIMzXj6MCqn6Ij23QWcQhUwYZIwNBi2UAPaVLKlz6F5Zr
         xffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063157; x=1789667957;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdUk7xT6Q2S0XYOIdYUuypvFM5moeaGi7+AJeTxN8N4=;
        b=NO/ooxkBMdgJdai51JeyjHsUwCILGcxrAUzZq7eS04wpTWeFCCBuFak1gn7KdNLMxT
         OmwS6Yn/uHlb7nSmnem3+SibNgnPB4N0R/iQVzuEjHrC4EKpaLbbcO4NC9jfF/f6g0f9
         Z660dNUlW00XBRgg3ioVlFagJZcIY42H+a6egv4AKAcz/Qveu7i1maKHIghtD4SP/y96
         9dDCEIm9xDWncvcfwjVyTpCptfJ+6AHauguVnKW+amHzpvmNHbVD9+eAn7fOHfLL1DSu
         hWVUNE9wkDphIVam+U2sJwdrY5/UjdiLNyFG8xzUT05YQakJ5uhWt2zbERhO3YX/YjP9
         CpTw==
X-Forwarded-Encrypted: i=1; AKwUvByJWqULdlexu43dUEqOaQKYah4Ha/Jk8EkvP5bIlp1+G8H5Hdd4xjxaA8HkSFgOJeppPwlUIKXcIss=@lists.xenproject.org
X-Gm-Message-State: AFuF++ncC1uOj/lDct6yIn9fAQcUmHkXm+iqisuZG5WF7qzLkePHUtP7
	XAcRIfSqDrhjHRCmw6+1KEg+LzsvGEPD8F2wSN1+OQiRC/hCDshyoVtd8z1pHkh26FcLGoporbJ
	S90rAjA==
X-Received: from pleg13.prod.google.com ([2002:a17:902:e38d:b0:2c9:b703:3bfb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce8b:b0:2d7:2edd:d140
 with SMTP id d9443c01a7336-2dd2a1c3e42mr9017035ad.3.1789063156725; Thu, 10
 Sep 2026 10:59:16 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:59:16 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
Message-ID: <aqLv9GwBNymyHs8q@google.com>
Subject: Re: [PATCH v6 00/51] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-ef75cf/1789063159-A44CBAE4-014D8D59/0/0
X-purgate-type: clean
X-purgate-size: 1189

On Thu, Aug 06, 2026, Sean Christopherson wrote:
> The primary goal of this series to fix flaws with SNP and TDX guests where a
> PV clock provided by the untrusted hypervisor is used instead of the secure
> TSC that is controlled by trusted firmware.
> 
> The secondary goal is modernize running under KVM.  Currently, KVM guests will
> use TSC for clocksource, but not sched_clock.  And Linux-as-a-KVM-guest doesn't
> support paravirt enumeration of the TSC/APIC frequencies, even though QEMU
> provides that information by default.
> 
> The tertiary goal is to clean up the PV clock code to deduplicate logic across
> hypervisors, and to hopefully make it all easier to maintain going forward.
> 
> The quaternary goal is to clean up the TSC calibration code, which was made
> stupidly hard to follow by hypervisor code mixing in with the native
> calibration routines, instead of being implemented as a pure alternative.
> 
> Note, the VMware and Xen changes still probably should get acks from those
> maintainers, as my understanding of what they're trying to do may be flawed.

This (thankfully) still applies cleanly.  What can I do to help move this forward?

