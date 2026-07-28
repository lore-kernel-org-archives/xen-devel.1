Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84951C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 23:06:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375077.1622355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woqsJ-00033J-IB; Tue, 28 Jul 2026 23:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375077.1622355; Tue, 28 Jul 2026 23:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woqsJ-00033C-F5; Tue, 28 Jul 2026 23:06:15 +0000
Received: by outflank-mailman (input) for mailman id 1375077;
 Tue, 28 Jul 2026 23:06:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <34jVpagYKCU07tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 1woqsI-000336-2N
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 23:06:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woqsH-0041UP-6R
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 01:06:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <34jVpagYKCU07tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a6935a9-e002-0a2a0a5209dd-0a2a45089f22-28
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:06:13 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <34jVpagYKCU07tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a6935e3-f659-0a2a45080019-d155d7c6c462-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:06:12 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cb11535e6a1so200448a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:06:12 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785279971; x=1785884771; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIqmps2dhv8tBsBvZD3H17qhoPMotCZtd+Geu7ae0Wc=;
        b=jWPYtpkihLO1u8d8m51+F6C8kiQRwqg6s64tMXeH3r1MoJC1Ad0IKt2FoEZGRAPx31
         TKNjPD6IdnMQCsZ+VRV75rBs6eyto7Wnz5kPXN3CLIqsshBKLoSjJxnktGMap6UBFwRR
         n8+ur4a23FOYe80Jr1Zkw5g/DmUBFRqxNwBxjwW8B8WYG2Wn0OwWhYOv+jA/rqAt0ViC
         YErsLKa8qc4ACSxQ8zgiJ9crCyqX7VquKQOOMXhsu6lSm1PRIC7qPCuKZCzkDda51Q2U
         hRY113HX+E96/kx6GMW+w+g2wXtVSbR1xHPKyEYLG9TEUXju/+Bo2qL56MV67L0ZLrgx
         1BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279971; x=1785884771;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIqmps2dhv8tBsBvZD3H17qhoPMotCZtd+Geu7ae0Wc=;
        b=VfRgrPzwFGmmeakBBaXw23/+3L4TX6fLwzPRUrJKZaBB43zl+Tq6/cPeorHAPw1fZM
         R4ldEUj253Wk0TBOJjiHESrvP7ntlst6V7ngGZAYYjtCpdce1BbV5Tfe8tbH5VNuAAJl
         GGAvKaFhlhJ65fxptugFO4TB3xz1gp1OhjRukJJzzfDbcQ8DTLA4Yc0LmGiOU/fHv6LV
         W1yxBpZL6Sx/9O5Kic1Rbb0Rfiw1/ONJr7gD9+gV6ERXzGcFrykHQQsHbLJ+yWgfxOlO
         s0MsUWwkwes1asKKCRtBaWas1VoJ1qwx9A40TqdJYb1NZqSCoialxozneM6Qu+DdnIto
         RBxw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Xk/k2x/tY7C/Bq8B9o7PaRsgNHSzGvoaGFJqt2g8kahySQBd0nawnQHSohElMppB8QxEChGwsTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxpkh0TFVO2zkUFyy5OXL1cdKtDzDYQddwMRVGnvZskfneg1mcp
	Lw6VGjihAvPT9d7pfEcc0EAHTS1rwfow8hd7FBep5cqtvYaSbbuNNIuIqASexi8DlFMNubZghDx
	Kp7nDgg==
X-Received: from pfbig10.prod.google.com ([2002:a05:6a00:8b8a:b0:848:478d:6efb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c5:b0:845:f107:38c8
 with SMTP id d2e1a72fcca58-84e9332e63bmr4750014b3a.47.1785279970563; Tue, 28
 Jul 2026 16:06:10 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:06:09 -0700
In-Reply-To: <20260728144954.355376-6-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-6-dwmw2@infradead.org>
Message-ID: <amk14dmn5j7Oov1B@google.com>
Subject: Re: [PATCH v7 05/36] KVM: x86: Fold __get_kvmclock() into get_kvmclock()
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
X-purgate-ID: tlsNG-c1860d/1785279973-CFCD387B-F72D2932/0/0
X-purgate-type: clean
X-purgate-size: 781

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There is no need for the separate __get_kvmclock() helper; just inline
> its body into get_kvmclock() within the seqcount retry loop.

Actually, there ends up being quite a bit of value if we rework the inner helper
to be all about the master clock mode.  If we go that route, then the main loop
is pretty self-explanatory, we can use early returns instead of continues and
subtle fall-throughs, and the indentation levels go down.

	do {
		data->flags = 0;

		seq = read_seqcount_begin(&ka->pvclock_sc);
		if (!__get_kvmclock_master_clock(kvm, data))
			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
	} while (read_seqcount_retry(&ka->pvclock_sc, seq));

