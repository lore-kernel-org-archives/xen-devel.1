Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC04CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:09:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446906.1663035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZRF-0006ML-Jk; Tue, 13 Oct 2026 10:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446906.1663035; Tue, 13 Oct 2026 10:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZRF-0006ME-Gp; Tue, 13 Oct 2026 10:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1446906;
 Tue, 13 Oct 2026 10:08:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGZRE-0006M6-8e
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:08:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGZRD-00000003Ksh-3PFF;
 Tue, 13 Oct 2026 10:08:51 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGZRC-0000000AxZ4-3Tbo;
 Tue, 13 Oct 2026 10:08:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=EJ7wNjl4IBOa/oa0kfVKJ9Mqxz/Lly+NqGFPA74zNFM=; b=m2GK7ACfa+nsu5z0lyT88uacCD
	XtVAI/yP/J6rxWHU/MNng3Bamg6v89/Wq5APYYNEWFaPJaRqM8r8tVGAWu8IpZsql5SqjWrCGLBvc
	QzM+iOsTSI+6RwLjwYkFyHQpZ1oQ5h/CZNJc1e+V8vOHYK+EhHbJQxHF4+N9yRlGmPFU=;
Date: Tue, 13 Oct 2026 12:08:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86: constify local variables in
 mapcache_current_vcpu()
Message-ID: <as4DKjCDU5EQUt9Z@Mac.lan>
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
 <d7ddc188-0e92-46c3-a38b-9a628eb60cd2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7ddc188-0e92-46c3-a38b-9a628eb60cd2@suse.com>

On Tue, Oct 13, 2026 at 11:05:44AM +0200, Jan Beulich wrote:
> As of the referenced commit v won't be returned from the function anymore.
> Yet that was the sole reason for it to not be pointer-to-const. curr,
> which was introduced by that change, had no reason to be pointer-to-non-
> const from the start.
> 
> Amends: 622c9a5ba95d ("x86/mm: accurately track which vCPU page-tables are loaded")

I think I recall how this ended the way it is: initially I was
returning v, which was wrong because this_cpu(pgtable_vcpu) will have
changed after the sync_local_execstate().  Later I adjusted the return
value of the function to be this_cpu(pgtable_vcpu), but didn't made v
const.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> I was heavily tempted to also replace the smp_processor_id() at this
> occasion (by curr->processor). With gcc16, that leads to the function
> actually being inlined (in debug builds), i.e. a significant change in
> generated code, and a measurable increase in code size. From the function
> being declared "inline", that looks to have been the intention, yet then
> that use of "inline" doesn't quite fit our principles. The main reasoning
> for this as a secondary change would be:
> - "curr" could be dropped (instead of having const added) if code
>   generated from ASSERT() wouldn't matter quality-wise,
> - if generated code quality matters there, then the unnecessary use of
>   smp_processor_id() should matter, too.
> However, an adjustment along these lines may better fit in a subsequent
> change dealing with the repeated this_cpu() here.

We might want to introduce a local cpu variable to hold
curr->processor and then replace the this_cpu() with per_cpu(),
together with removing the usage of smp_processor_id().  Shouldn't
make the code more complicated IMO.

Thanks, Roger.

