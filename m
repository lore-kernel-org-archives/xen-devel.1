Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E5DC56202
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 12:08:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416432100A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 12:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fRHC2Nb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416432100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.32105.63039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5D5-000090-Hq; Fri, 20 Nov 2020 12:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32105.63039; Fri, 20 Nov 2020 12:08:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5D5-00008t-EU; Fri, 20 Nov 2020 12:08:15 +0000
Received: by outflank-mailman (input) for mailman id 32105;
 Fri, 20 Nov 2020 12:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kg5D3-00008R-Rr
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:08:13 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94f38a82-f7f1-4ce8-b36f-00f0d6c02c46;
 Fri, 20 Nov 2020 12:08:11 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg5Cx-0004e7-7B; Fri, 20 Nov 2020 12:08:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DB2573069B1;
 Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C6997200EC4FD; Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kg5D3-00008R-Rr
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:08:13 +0000
X-Inumbo-ID: 94f38a82-f7f1-4ce8-b36f-00f0d6c02c46
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 94f38a82-f7f1-4ce8-b36f-00f0d6c02c46;
	Fri, 20 Nov 2020 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vlXR+DeDm58p736gPlu4ZNiSJsmquQxprWhu8Q3iIL8=; b=fRHC2Nb6zcdTb+UFSiq7GQRUml
	BUcux3dn7RsKDlz4v+LiwCLL5XUhYCq1gUqZpb9juEnjSzn/4qQQIeiFL1LSLrh9HtqKFvu6oo2fy
	YaGX3kbhn8wEu45EEmSdWXGs1CGyP3hJ72OQrgns8cznCA9Yy75jioH9PKqiPbWVoPm3nex2Aw93R
	vbfyV+gyoMK/k6uyjezWSI2d4xiZaaa/qfdcjAV7GkIz2Ijn5O6uyxpTUYsOj7IwiraWKv9KDE44j
	HymhtOgRlYegJPkO3F0EUjLjhaP7ZarIEGVFdAeQafXl7tla9cn5tt/6O/8+i0vh5behC/4jxjuIo
	bAK0zS/w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg5Cx-0004e7-7B; Fri, 20 Nov 2020 12:08:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DB2573069B1;
	Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C6997200EC4FD; Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Date: Fri, 20 Nov 2020 13:08:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: Re: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit
 pvops cruft
Message-ID: <20201120120805.GF3021@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-9-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:26PM +0100, Juergen Gross wrote:
> +#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	\
>  	({								\
>  		PVOP_CALL_ARGS;						\
>  		PVOP_TEST_NULL(op);					\
> +		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
> +		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
> +			     : call_clbr, ASM_CALL_CONSTRAINT		\
> +			     : paravirt_type(op),			\
> +			       paravirt_clobber(clbr),			\
> +			       ##__VA_ARGS__				\
> +			     : "memory", "cc" extra_clbr);		\
> +		(rettype)(__eax & PVOP_RETMASK(rettype));		\
>  	})

This is now very similar to ____PVOP_VCALL() (note how PVOP_CALL_ARGS is
PVOP_VCALL_ARGS).

Could we get away with doing something horrible like:

#define ____PVOP_VCALL(X...) (void)____PVOP_CALL(long, X)

?

