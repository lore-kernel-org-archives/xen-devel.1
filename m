Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1656C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:54:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391383.1631233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuw6z-0005JI-Ng; Fri, 14 Aug 2026 17:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391383.1631233; Fri, 14 Aug 2026 17:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuw6z-0005JB-K8; Fri, 14 Aug 2026 17:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1391383;
 Fri, 14 Aug 2026 17:54:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3VVZ_agYKCVoK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 1wuw6y-0005J5-Ep
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 17:54:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuw6x-003QFF-Gc
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 19:54:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3VVZ_agYKCVoK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a7f562c-e002-0a2a0a5209dd-0a2a450bc922-28
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 19:54:31 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3VVZ_agYKCVoK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a7f5655-b7e8-0a2a450b0019-d155d2c6b4e0-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 19:54:31 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-848568a6f62so1366672b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 10:54:30 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786730069; x=1787334869; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfaLWAErtycI8626dIr9iK18/ZV1rhd51zLN5VGW8CI=;
        b=c7kdra7Qck2cMP+Rs7XLWwxDNaODFcGhMm7v69w2bQac/EseFbMDosYDJBKAnfGokF
         4QDJiRdp/0HctWr7MP8NPPDcCZxn30aDYkAHkDSiDwfyyr4lLVW1XD82dkgWZAeqZZcc
         Zrw7mNH8aB1P5DC8dZQFi8We6NlpfOBREEiCPLxZRH3XWMA9e0x0Fe8VDlUpDI9gcbXd
         x2eM8hqq5/VW8u6Sukhby+TNmtXwLNpNn95AnAa2iWuNZ9bekqTQb7MYtiiKnK6r4J0C
         QDA687+ojQcsaYaFXYk1RmMXQEOsOkhRWm/zfcC88z6Sxe+fJQ2ivcnFqfACcN2p9ikb
         Y6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730069; x=1787334869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfaLWAErtycI8626dIr9iK18/ZV1rhd51zLN5VGW8CI=;
        b=Yntk64VHh/YyrVqCUmLHpvMa2dPwrVZGQLCjOzYJHmlt+Uq4BQ3Ifd4ic/Nw4zuSA9
         hkqTY+yTveialGb2EbWVEbLOrXqOIPq5vR7g2OwgLIXB9CgZ1Ca/l97J/w699vH+2YqX
         oAtmLUzNAwqDPe6Z/0JG3lT1OeN3aPJFlopAZ5TJpBqRpG92O8VkPRj094VxhMmOVFr1
         oh2d7vsaHO4n40ePnlo7S5c7IQJiwuHMhyX2a6Qe/RrELNEUOrPqEfDjGcewgUoHd/mY
         V9bNRgdFGHJZhRiwnon+KhUYhWCONbXp2yeylAoI595Qh73RftN6fv98MQd/zCybi68N
         JUVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2LRfmKjf8wttWoeAz1/OTTvxDPngxnnqSO3icJfZ2bwt9WmhLHJq9TYqp74jxPrzC9FKncv7wVqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo3dYijjzCXfZefjRb+kEwCy/Iw8OBtI6J40Cya9XtGFa5hE/S
	pNgAquUCyy+jrZhgrxggLIyd8btgSp9Iuw87iZmaSWoPbF3m3hSM07qLRPHESktGnz66i9/rhs5
	EdzpSYw==
X-Received: from pge22.prod.google.com ([2002:a05:6a02:2d16:b0:cbe:e919:f4bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88c3:0:b0:848:4d1a:9554
 with SMTP id d2e1a72fcca58-84fde32cb70mr7530427b3a.38.1786730069038; Fri, 14
 Aug 2026 10:54:29 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:54:28 -0700
In-Reply-To: <c5c532e01309c8c73de2b0f393539b608c495f1f.camel@infradead.org>
Mime-Version: 1.0
References: <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
 <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
 <ants4VjfAiblaWsl@google.com> <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org>
 <anuYNxD81OE3MrQw@google.com> <5efe7a3914a3610ee00a487379caff84af6aa731.camel@infradead.org>
 <anusv0DloFhLMMoW@google.com> <c5c532e01309c8c73de2b0f393539b608c495f1f.camel@infradead.org>
Message-ID: <an9WVBHSsy5W0PUk@google.com>
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
X-purgate-ID: tlsNG-42698a/1786730071-190CD9EA-958C6DEE/0/0
X-purgate-type: clean
X-purgate-size: 820

On Fri, Aug 14, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 16:14 -0700, Sean Christopherson wrote
> > I'm not totally opposed to a broader GET, but we should definitely get Paolo's
> > eyes on this sooner than later.
> 
> We've been saying that for two years. Shall I bring a net and a whip to
> KVM Forum? Or Plumbers? :)

I pointed at this thread in the "clocks" pull request, so then should be now,
soon.  And if that doesn't work, I'll just rename the getter to
KVM_GET_PAOLO_PAOLO_PAOLO and send a pull request.  Either that will get his
attention, or we'll have a source of amusement for years to come :-)

Joking aside, this would be a good PUCK topic if we need/want a synchronous
session to sort things out.

[*] https://lore.kernel.org/all/20260812213206.1564354-2-seanjc@google.com

