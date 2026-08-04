Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B83C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 10:40:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382101.1625500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCZ2-0005Kc-St; Tue, 04 Aug 2026 10:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382101.1625500; Tue, 04 Aug 2026 10:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCZ2-0005K6-Of; Tue, 04 Aug 2026 10:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1382101;
 Tue, 04 Aug 2026 10:40:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterz@infradead.org>) id 1wrCYy-0004g3-Bt
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:40:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrCYx-000HMQ-AZ
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 12:39:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterz@infradead.org>)
 id 6a71c16e-5cb7-0a2a0a5109dd-0a2a450cd6bc-34
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:39:57 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterz@infradead.org>)
 id 6a71c17c-f479-0a2a450c0019-5a9b5cc7e060-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:39:57 +0200
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wrCYe-00000009nOq-2bzw; Tue, 04 Aug 2026 10:39:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5984030045A; Tue, 04 Aug 2026 12:39:38 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MsldYqnXOycsS4y2/7KD3GU//XDAu63pq55swDGd2xw=; b=LGA1lkkRQbVX1KW9YPvaAmrSjX
	iVDDDoXj/8hc/CzXkHA5ffJ8pRRD8pKaS0GgylshFZGV1Gt51cxqLuoVgYiuV2+ASvLqawoyP37O2
	ta0OHhxCiAPtEM7zdUElmcx4T8aqOOi6F0Y2q+lPdg8ionsZP3yHhQDAZ8wcCfqcYRJN5+hEbCGN8
	sfZ+ukTa3ier64oRKtJsK+zhxdviWmRFE/G+2nNfwhkLzN58M0Lmk13/TM+rpL52AWovHxCh20cap
	NFJT1Jbuiblfw8ziL76Tp7Ia//DA11YVN9uCIT6u7MxpE8hBCpXj1BKi8NhSEyEoqHzzQKtxscgCI
	IVoTVISw==;
Date: Tue, 4 Aug 2026 12:39:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 0/5] locking/qspinlock: Add contended_release tracepoint
Message-ID: <20260804103938.GH776954@noisy.programming.kicks-ass.net>
References: <cover.1785778551.git.d@ilvokhin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785778551.git.d@ilvokhin.com>
X-purgate-ID: tlsNG-d25034/1785839997-016C6A5B-6B0A1322/0/0
X-purgate-type: clean
X-purgate-size: 616

On Tue, Aug 04, 2026 at 07:15:40AM +0000, Dmitry Ilvokhin wrote:

> Patch 1 is Peter's draft from [1] and is missing his Signed-off-by.
> Peter, please add it if you are happy with the patch.
> 
> Dmitry Ilvokhin (4):
>   locking: Factor out queued_spin_release()
>   locking/qspinlock: Add contended_release tracepoint
>   tracing/lock: Use TRACE_EVENT_FN() for contended_release
>   x86/paravirt: Trace contended_release on unlock
> 
> Peter Zijlstra (1):
>   x86/paravirt: Use static_call() for the paravirt spinlock ops

Right, this all looks nice. Let me go queue this for the robots.

Thanks!

