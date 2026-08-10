Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96FDC5B56A
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:43:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387696.1628951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtT57-0002x9-B1; Mon, 10 Aug 2026 16:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387696.1628951; Mon, 10 Aug 2026 16:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtT57-0002x2-86; Mon, 10 Aug 2026 16:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1387696;
 Mon, 10 Aug 2026 16:42:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3c_95agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 1wtT55-0002ww-Mp
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:42:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtT53-00434s-Pt
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:42:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3c_95agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 6a79ff6c-2eae-0a2a0a5409dd-0a2a4506e2d8-12
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:42:29 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3c_95agYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@flex--seanjc.bounces.google.com>)
 id 6a79ff74-195a-0a2a45060019-d155d2c5ec63-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:42:29 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-848544a8496so2343430b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 09:42:29 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786380148; x=1786984948; darn=lists.xenproject.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1aMkrKlnySSkZTh98FOauiGYQlFOQqftaK5JuEjFP4g=;
        b=atN7bTXZeZzv7IrVzyQngYnKgJjlmMoz52g9gAW169OJK86ZDfItMpwKhrTBKVKIQy
         bwhcRRVKdLxPiYFHvuHHummmrJoNTCVyp4BsS2OZTOB1xjBylnsxOBF+kYPdct4kTiK0
         pndTJ1Pnh6qcof3c8FwwFT6wzf2bUas/2KIptcHLhsqKi7luKhMCZi8y7EvkkiDEAnCa
         bqAdEks9R9dOWyFfoIFkuRnevy7FHYDp8SrWDX0Yg9PmHbldsZZcRGFbNZIg/5aMr8iq
         WwlNmKfs6uaSvfqHsiqHkmKfm4UwKa4KmfjRaGOB2eTbLUBmKI4r5gflp3szNIWklF1q
         K3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380148; x=1786984948;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aMkrKlnySSkZTh98FOauiGYQlFOQqftaK5JuEjFP4g=;
        b=hVgMfAJcA6qA5XHLvJEYhFYrLH9Cy5RgPK+wSJx3BUSpxM4QlQGOSsZY4vB8Pso4Th
         p9fue90myBTIgEv1M3Tx7atUHp5NOUpkZCPouzsOmHwWkrMghOYCmS6XQxoRzEw9B+sn
         kBkwQL7GcVu2GXr9U+bROAKXUmaIrSLd0HTQZFocMDDEPLvQcFJp7iqecVAhS7/sHy3j
         pHqD+fyuyqWenPwvHNyz+PjhpWPBAX71+k0bMK3ohh83O9p9F8L7UsfHGBUrqFoqMO+/
         jljQfnidsMG7M3xM48ctYn1xuuPc6tDz5gHYY5aRiIecmFwW4ZJwv7jbngi9m55AiwSy
         DMEg==
X-Forwarded-Encrypted: i=1; AHgh+RomswLUx+Ltg65YDGmmilA8UBsDS2J9Z9gByC6N90O6QaJmrYN9DmWTG6j5oiphr3OOPyBc4G9cObw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw5UyxdrtA/zle/J0sWMihzIJ9wg2ggrA0x0E6+g6wlgo7/OUZ
	0vpMKoSQbafTEY+J/jvDx78zUJvQUKpmQdjxFpqxVQmNg7aotmnAlCO80DTPGsSnFtTRN6ZdGQd
	ICtVfkQ==
X-Received: from pfbkr10.prod.google.com ([2002:a05:6a00:4b4a:b0:848:569f:3464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc5:b0:847:8dec:1427
 with SMTP id d2e1a72fcca58-84f4fd9f647mr32987651b3a.8.1786380147208; Mon, 10
 Aug 2026 09:42:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 09:42:21 -0700
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <178637989949.703398.16006467247639187150.b4-ty@google.com>
Subject: Re: [PATCH v7 00/36] Cleaning up the KVM clock mess
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
X-purgate-ID: tlsNG-16d1c6/1786380149-FD60A77B-0AA3C434/0/0
X-purgate-type: clean
X-purgate-size: 1327

On Tue, 28 Jul 2026 15:39:40 +0100, David Woodhouse wrote:
> This is v7 of the series to clean up the KVM clock, rebased onto
> kvm-x86/next (patch 1 of v6 is already merged there as commit
> 710b3a30f407).
> 
> The KVM clock has historically suffered from three problems:
> 
>  1. Imprecision: get_kvmclock_ns() computed the clock from the *host*
>     TSC without applying guest TSC scaling, causing systemic drift from
>     the values the guest computes from its own TSC.
> 
> [...]

Applied two more Xen patches to kvm-x86 clocks.

Given that KVM was updating the wrong sub-leaf (which amused me greatly), I
didn't see any point in waiting for the new uAPI updates to yank out the CPUID
updates.  Holler if you feel strongly that that change in particular should be
bundled with the kernel that adds the TSC scaling uAPI, omitting these changes
from 7.3 and waiting for 7.4 is trivial.  I'm just trying to reduce the number
of in-flight patches we need to keep track of.

Thanks!

[20/36] KVM: x86/xen: Prevent runstate times from becoming negative
        https://github.com/kvm-x86/linux/commit/36a85200643e

...

[22/36] KVM: x86: Remove runtime Xen TSC frequency CPUID update
        https://github.com/kvm-x86/linux/commit/7d3bd21e457b

--
https://github.com/kvm-x86/linux/tree/next

