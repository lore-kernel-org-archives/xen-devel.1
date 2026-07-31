Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B255C5516F
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 20:10:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379605.1624066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wptYc-000652-Ed; Fri, 31 Jul 2026 20:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379605.1624066; Fri, 31 Jul 2026 20:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wptYc-00064u-B4; Fri, 31 Jul 2026 20:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1379605;
 Fri, 31 Jul 2026 20:10:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3IgFtagYKCTMhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 1wptYb-00064o-Bg
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 20:10:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wptYa-004Eb6-Os
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 22:10:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3IgFtagYKCTMhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a6d0119-bab6-0a2a0a5309dd-0a2a4507aa9c-6
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 22:10:12 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3IgFtagYKCTMhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a6d0123-b4ea-0a2a45070019-d155d2c8b198-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 22:10:12 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84a3514f912so2381086b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 13:10:12 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785528610; x=1786133410; darn=lists.xenproject.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dGHZhChNpAHEZYB2yzeExiUjrKbT3b7Zh2GTXyKqp4=;
        b=ODcLAgV6tFlYELuvpBA3kRtaaR5eZYGCU2Fk+Xuh9Pg/R0gcNrwgwYNxR7hd5tVqn3
         5lI92MtbGDMBpN9T1kVOUsjW71alCbnFu37jIXtOTfoa8Ff7fj9uhUGIW1O6pwSoYtHq
         Y1ekBhhHnMtCi5iwnvQY96s7c0cO5yYxYihxfxiytgLqqO+/G056v86uCBT77e1QnG7S
         BYx6pPa2qXh7ShKbzN3SpLK8xw2ROnWZxqdo5bbUclFIWIvS2GO+pwc8xCXUGeByGeGC
         xZasgcf8fcrJ+v73Rvtof0AOXPJ9CC3DS56evMGT1rSPFLQCWzGOU+IhQOaLFQAgYagz
         cvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785528610; x=1786133410;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dGHZhChNpAHEZYB2yzeExiUjrKbT3b7Zh2GTXyKqp4=;
        b=EZUvpIf95FWD/I+cD6gKtVFSow/k1WZ//MezAS6ADgJF0f34ME6XcLXehDoy9PxC6d
         FsfeQMfMpRbVPQwPI1X8w1MHt7nj+NMT/VQegU59haz3bdG9LIk4i0yYlKKOtPSuUA1/
         vswbzsAbmhmKe8mnDbrMVrg8RsOotSsllSRY7JVmoiMLDlj1jkwH3QlzEDNeoam0SaPI
         GjopLCicdGR6VM+0xTxxJkyAgde4+dpLQy+EtltkuDmvLRtmtTKD6iuVK8RBehUjHBJE
         F0XLZGkfXihkEmsWxGuqvx/+lfAQlIngAKbTJCFje55Z853dvQPnnDwL082wzuYk/6RB
         ifQg==
X-Forwarded-Encrypted: i=1; AHgh+RrTmg6XyZjxlqLSJhqXX8LAYN8TIgEKbNZcyhpbUpKvld74de89h2i7SBvhZdTn6dCFFA5R087cQPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+2rTQQP/fVpVRbcuveUKPC8x4uxkiJxFcClX9l60V5Mf0ZHvE
	oRR4uNXqkyMeQ9YyqJaf5IQ4jYVHF8h/zHQzxPI1hYLaUC66EkPrps/kQI/Ia+NNBhmKt0NIGGZ
	0QR1tFw==
X-Received: from pfbi27-n2.prod.google.com ([2002:a05:6a00:a51b:20b0:848:5395:9a78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1d87:b0:848:4256:d6ad
 with SMTP id d2e1a72fcca58-84ee48f8ab0mr799329b3a.60.1785528610394; Fri, 31
 Jul 2026 13:10:10 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:09:44 -0700
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <178552799129.2700794.10181439022561913222.b4-ty@google.com>
Subject: Re: [PATCH v6 00/36] Cleaning up the KVM clock mess
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
X-purgate-ID: tlsNG-ef75cf/1785528612-352CCAE4-3725A5C1/0/0
X-purgate-type: clean
X-purgate-size: 792

On Fri, 03 Jul 2026 22:17:39 +0100, David Woodhouse wrote:
> This is v6 of the series to clean up the KVM clock, rebased onto the
> tip timers/ptp material (the timers-ptp-2026-06-13 merge, which includes
> Thomas's ktime snapshot series and the read_snapshot patches).
> 
> The KVM clock has historically suffered from three problems:
> 
>  1. Imprecision: get_kvmclock_ns() computed the clock from the *host*
>     TSC without applying guest TSC scaling, causing systemic drift from
>     the values the guest computes from its own TSC.
> 
> [...]

Applied patch 1 to kvm-x86 clocks.

[01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
        https://github.com/kvm-x86/linux/commit/3d4b20b5a7df

--
https://github.com/kvm-x86/linux/tree/next

