Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66216CD4F3D
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 21:47:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1317340.1586460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQXiH-0007xe-0w; Fri, 22 May 2026 21:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317340.1586460; Fri, 22 May 2026 21:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQXiG-0007xX-TO; Fri, 22 May 2026 21:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1317340;
 Fri, 22 May 2026 21:47:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36M4QagYKCSEPB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 1wQXiF-0007xR-Gz
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 21:47:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQXiE-000dzV-MD
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 23:47:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36M4QagYKCSEPB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a10ce7c-2eae-0a2a0a5409dd-0a2a4501940e-36
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 23:47:22 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <36M4QagYKCSEPB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a10cee9-c1f2-0a2a45010019-d155d849ac53-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 23:47:22 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-367f715cbd0so7708289a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:47:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779486440; x=1780091240; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=Bpb/DzoLb+H6rxsS1jfidDrvsk4BBm1GeI1buX75JYJjKSC36VL4FjngGdUCH7zp/a
         DknDvrin/XpCmV+7ebnfHUW3bsbRURY0lpxhDR/5c9GIqGg65eZ32Tp3x9BD965/st45
         ngLgWy6a7FiB19RTe6iaqo7sYj9zc78p1tRW7ZtXssHSoyX7MEs8heTRX40nN2nyNZiO
         0X7y+Ae9M/ZEZDNVFidzwxlHwEIf2w0ywcSb6lUU5drPEBpCPrL3jSREB3VnXpZvRYZz
         ZD4WMWo91GUeL52Y9MQTGY8NM4d2Eu/rnSgfasZKxfaUX1bJ3NlHrN4El6nLq9KfY6E2
         ckfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779486440; x=1780091240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=GgfJ6c91OP8UPnBT7iioNFvqMyfEg6VmimadSkxbh4bx4aseEz5Xzqg5/hSpUHneXk
         3/VwO3u7EB0z0io3zz9MrfqnzJyi7orzYX4/jkqAI8Bg8FcSS4HUCSxDcYecSlOEXpur
         dLIArnK3Uw74Zt3swSqVeIgLcQIfJ28ug3PwFQCrgCu/306EDoDMdNh4QEF5zyH3/NrZ
         FUjV4AyOvjA3qsg9jNwouOzlhE4vhWfnBjkGhoXcODBferL5ggTmFRHpNz8fydjh1b+C
         oDm0GxBpme8z+wo6Tg8j1m7JZ3csqSGWpIGvSDgHBwgZ5ra3gfr/0EdSgv2JWmNIne1v
         SQ7A==
X-Forwarded-Encrypted: i=1; AFNElJ9CThXvSWzL/Er7LXytun5SS/asudNnG6sueuwDkWQ+wMT+V90LhcZeGbgPCxziEV5qutuAl0eDhbs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb9aBsdoVoddEgLW0xB2G8PnfrdxY+BjME3RYvitNVYCKCkBkz
	cQVwwPDO6QAer+oAXqtoXcyRy3LgSKsiVK3Z07u4Yt05ZdJ7CvbMeTIfezPGZSdTlo255hPSXif
	OpGqP/w==
X-Received: from pgkb12.prod.google.com ([2002:a63:eb4c:0:b0:c82:743c:ea8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3887:b0:369:a359:b181
 with SMTP id 98e67ed59e1d1-36a6787b0dcmr5234805a91.23.1779486440140; Fri, 22
 May 2026 14:47:20 -0700 (PDT)
Date: Fri, 22 May 2026 14:47:19 -0700
In-Reply-To: <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
 <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
 <ahCQluJj59uWlDAF@google.com> <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Message-ID: <ahDO58dKuPt-lj_J@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
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
X-purgate-ID: tlsNG-d62444/1779486442-B454DFF4-1B096409/0/0
X-purgate-type: clean
X-purgate-size: 429

On Fri, May 22, 2026, David Woodhouse wrote:
> On Fri, 2026-05-22 at 10:21 -0700, Sean Christopherson wrote:
> > 
> > I'll send a standalone patch, along with a selftest tweak to verify the fix.
> > It's technically a fix and won't generate any conflicts, no reason to delay it.
> 
> Are you suggesting the other 30 should be delayed? :P

LOL, just acknowledging that it'll take me a minute to page all of that code in.

