Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89F3C55ABA
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 21:59:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382661.1626000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNAG-00022P-A8; Tue, 04 Aug 2026 21:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382661.1626000; Tue, 04 Aug 2026 21:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNAG-00022H-7M; Tue, 04 Aug 2026 21:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1382661;
 Tue, 04 Aug 2026 21:59:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3q2ByagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 1wrNAE-00021L-Uk
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrNAE-00CrRL-00
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 23:59:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3q2ByagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 6a726056-bab6-0a2a0a5309dd-0a2a4504cbb2-18
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:59:09 +0200
Received: from [209.85.215.200] (helo=mail-pg1-f200.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3q2ByagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 6a7260ac-b57f-0a2a45040019-d155d7c8d157-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:59:09 +0200
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-ca7c1e22995so319660a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:59:09 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785880748; x=1786485548; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dhc7N1hQKet78fMxmoZ11biZ2HS+JiXgm3DEUzu8sT0=;
        b=GZlmgCQRiP6KXQ+vgOxzCfmpjphw57dNbEy14zZh2DGlqG1cuL2aWgJ+yYOjdict+C
         PvSKSWPHOByZPyZ1iluCRTj5Kme8SwkWq0T4ZWOqxc/bMVlDp+iR7oUYIGPe/zrMnKNN
         6zmoQpcf9ZrBgu+bVW0Pbh8dOMJ2ZO/rbWTd8WjSLQyqWi7lefwJXxAj4vDnygjIHgvT
         w/NsqlamcssEibwoKhGE3+Mo/B3Pe4DmpvBypAoUDHqlbXEUanC+QLESYYV34D8iYfJS
         VB4/jhNgC4GwmnJuE5IS9YPugihkZrNpa8tgVxs4fL1BBSRVuDxiF1g/JtA6kHeSluur
         nL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880748; x=1786485548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dhc7N1hQKet78fMxmoZ11biZ2HS+JiXgm3DEUzu8sT0=;
        b=q8gLO3QgAMiQ0Bh+rrFpw7wovGISnZANjd0eqEqGpzluIiNnc1p3ueMcdo2IvGSIcP
         QLJgLUZa/bxSl0qriAXm5yyLAh/ASbG8MxLbZHvNzdkbl4ZMKdM91GlMoKexdLxBMny6
         Mj/t7Hkh9XKaPe57ne0lRBdQXf2bfxxBL2ogJDFg/3sOtg6cV8tQHClEE+JsNSQplagE
         /bAKtMZPhcQQrLNdUXkgT5MwgP9bT0kA4djJVZBqqhvv7lGt2mGVpYei7byW+u2eYKos
         leWkG1rWE2jyP/u1FVOJHBfAToUZ1k/eIjEvpW/Odjg19gpXTTduioiZUHrkOzdvcpkv
         RjmA==
X-Forwarded-Encrypted: i=1; AHgh+RqAFgfTLFt2F3KezkR9IRkUNwmPHtBl0bU18XkTcLHiQmvBrpAbHwdhYLgC67InEX40vnBUjHtuO3g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQyeh6Q9IXBlCTpfklPWNdbWfalFnIYoQmd+I59UTUEzeqjTOo
	bVwHar7Zz0eFEFOCGIyudbj+bQZC+7TNhOtPtyjln1ZTTQqryzLrUkHj/tbdg1UMPg0u7CV8Feq
	W8ikSOg==
X-Received: from pgbdv13.prod.google.com ([2002:a05:6a02:446d:b0:c9a:3646:2398])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998c:b0:3ba:cd5b:3dc8
 with SMTP id adf61e73a8af0-3cb8603af30mr1757125637.31.1785880747446; Tue, 04
 Aug 2026 14:59:07 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:59:06 -0700
In-Reply-To: <anE4GtMa33nz7qdK@google.com>
Mime-Version: 1.0
References: <178552799129.2700794.10181439022561913222.b4-ty@google.com>
 <8b90851f38ef5b10cdcdc70e7543bd6b0b5e2773.camel@infradead.org> <anE4GtMa33nz7qdK@google.com>
Message-ID: <anJgqpOJGPjLAqYe@google.com>
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
X-purgate-ID: tlsNG-ebf023/1785880749-524CBB50-55F4180F/0/0
X-purgate-type: clean
X-purgate-size: 1049

On Mon, Aug 03, 2026, Sean Christopherson wrote:
> On Sat, Aug 01, 2026, David Woodhouse wrote:
> > On Fri, 2026-07-31 at 13:09 -0700, Sean Christopherson wrote:
> > > Applied patch 1 to kvm-x86 clocks.
> > >
> > > [01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
> > >         https://github.com/kvm-x86/linux/commit/3d4b20b5a7df
> > 
> > Thanks. Could the clocks branch be based on something that includes the
> > timekeeping work from the timers-ptp-2026-06-13 merge (in v7.2-rc1)?
> 
> Yeah, I can rebase onto a 7.2-rcN.  Y'all are likely the only people that care
> about the above commit, so a late rebase isn't a big deal.
> 
> There's basically zero chance I'll get the entire series applied for 7.3, but
> "Use ktime_get_snapshot_id() for master clock" is at least in striking distance,
> so there's no reason not to allow for the possibility.

New hash:

[1/1] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
      https://github.com/kvm-x86/linux/commit/633d7652f80f

