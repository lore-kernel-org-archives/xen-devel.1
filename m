Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A552C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:56:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387509.1628771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQUX-0002Ey-CC; Mon, 10 Aug 2026 13:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387509.1628771; Mon, 10 Aug 2026 13:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQUX-0002Er-9f; Mon, 10 Aug 2026 13:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1387509;
 Mon, 10 Aug 2026 13:56:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3j9h5agYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1wtQUV-0002Eh-SL
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:56:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQUT-00EaMq-TR
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:56:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3j9h5agYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a79d889-e002-0a2a0a5209dd-0a2a4505e71e-30
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:56:33 +0200
Received: from [209.85.214.200] (helo=mail-pl1-f200.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3j9h5agYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a79d890-4cb1-0a2a45050019-d155d6c8ccb9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:56:33 +0200
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cacd6d37edso31874985ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 06:56:33 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786370192; x=1786974992; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scUOSvWK83pq1cJ9Y23cB7+1ZF4+W+kSdr2X3LP0fns=;
        b=Btw3EVE0HPrzXezXN8OZpzVtRs6G+8xuttQe0mJUOu8hc7KcFEPRSWnd9WSxLNRWBI
         9GspDDOsCJIVD8dB23HSAAQ9H+lNeiS3VZA1ZyMWb5HbCLO028zIBj1Dp4bP6KPWRC1l
         koUk3Gvbruyp8VLAdTBXD7CCCnahk4Jtx15NgK4l+UqA9j1omZvwuQ+kJxSh+trEWi/D
         19AXPFpY+NFf+BAQq4NLPb2q14O/Qzkpu526C/dhHfcD7k+fygUDAYwpjG7utyzXEzHO
         4XYUtp6A2vse944RP/FePCNa2BVO/cv8svX1JoWM+L1mJo5mGuvqdsZq9HLSw8EuKdvs
         2Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370192; x=1786974992;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scUOSvWK83pq1cJ9Y23cB7+1ZF4+W+kSdr2X3LP0fns=;
        b=mLoGQjaVMaOsxvOskj9X2QA7B0bRnpT0h2vtmXlDVlRSSrY1tPKJwB4tHv3PHb4EWg
         Z59/NkwFBEtra78lmL586nOd2zBl326tGpHw2rCSfIh/jgxtVDCkAIrt1fOjxmoiBG5+
         pueIA84/o2Coi9MR0ZfBi5S18rCfPQlS8x45J5JY1L0Hn5+6gfcoJUFG/0h1YzV0T5GA
         4+pDCBC84uRBTVNm38VMvZDUJ6AsmS+bZPpoJETzZU+e4UpI8aYld1WI5gfsZ4Zy+26s
         DMQetZvQ1A5MH/VARXwnnh4e55rRQD2V8el8EKKsW5zDgF0RmaZhfyLGjZ0oDvBic9rp
         3esw==
X-Forwarded-Encrypted: i=1; AHgh+RpJcUuNE3bLAl8wev9Gc+9Yj1OnPmn1AwV0kMcNhQNF/A566RI+HigjuMOIFpT1LODTR469GuPCtmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxceE7SkJdcEp0Hr2dHBZzgrO9NtPTqW9FJgrDe5UZiNmLhdzkB
	TIYK0MMJhI90sypr+fR4T2Ng4pGwSoiRjgiRqcvj5fWKJGF/bACWxPu+bhII8TxoZ7bQIlOsr7d
	gTZg6nA==
X-Received: from plml3.prod.google.com ([2002:a17:903:1843:b0:2cc:7ef7:ea41])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:13c7:b0:2ce:9c48:22d3
 with SMTP id d9443c01a7336-2d30033718fmr21913835ad.11.1786370191619; Mon, 10
 Aug 2026 06:56:31 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:56:31 -0700
In-Reply-To: <d0ee3cf97854b904323db3799e05117d065a6ba0.camel@infradead.org>
Mime-Version: 1.0
References: <20260806233609.212337-14-seanjc@google.com> <d0ee3cf97854b904323db3799e05117d065a6ba0.camel@infradead.org>
Message-ID: <annYj0zj68hH8zIu@google.com>
Subject: Re: [PATCH v6 13/51] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, pbonzini@redhat.com, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, jan.kiszka@siemens.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	jgross@suse.com, daniel.lezcano@kernel.org, tglx@kernel.org, 
	jstultz@google.com, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-c201ff/1786370193-716AD2A1-C2E3E16F/0/0
X-purgate-type: clean
X-purgate-size: 876

On Sat, Aug 08, 2026, David Woodhouse wrote:
> On Thu, 2026-08-06 at 16:35 -0700, Sean Christopherson wrote:
> > Mark the TSC frequency as known when using ACRN's PV CPUID information.
> > Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
> > the TSC freq is explicitly provided by the hypervisor.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Huh... does this literally get reverted completely in the very *next*
> patch in the series? Kind of weird, but I guess in some ways it makes
> sense...

The literal code gets reverted, but the functional change does not.  Before this
change, ACRN is the only guest-side PV code that doesn't set X86_FEATURE_TSC_KNOWN_FREQ
when the hypervisor provides the exact frequency.  I.e. this patch allows for
making the "No functional change intended" claim in the next patch.

