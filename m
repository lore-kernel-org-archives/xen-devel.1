Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C5CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:15:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446927.1663062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZXf-0000UN-Nm; Tue, 13 Oct 2026 10:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446927.1663062; Tue, 13 Oct 2026 10:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZXf-0000UG-LC; Tue, 13 Oct 2026 10:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1446927;
 Tue, 13 Oct 2026 10:15:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGZXe-0000Tb-KY
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:15:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGZXe-00000003L1H-1OJL;
 Tue, 13 Oct 2026 10:15:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGZXd-0000000BBKI-1RyE;
 Tue, 13 Oct 2026 10:15:30 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=NjfaseW22rn6/mrzlpo9xWsmsB4ZykF4RI68Y3e3So8=; b=lb21lDmE8IrXmk004Oi+yJ7WMB
	8nU9uSipTzBwhN/gfYeLJSPUJo/0jFQVAyb0Tjt1Hq//zC+7TWuGMYJocFcxh6tSt96hS5UckbbZS
	R05hM+grPjW0rxAndUpzhmZq/OfgNk1rDt67m3gu+THCb6RIUpLj+rvanbcgnQlORcTg=;
Date: Tue, 13 Oct 2026 12:15:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] x86: replace this_cpu() uses in
 mapcache_current_vcpu()
Message-ID: <as4Ev_8NGq-dyK-2@Mac.lan>
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
 <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com>

On Tue, Oct 13, 2026 at 11:06:27AM +0200, Jan Beulich wrote:
> We have accumulated three of them, plus a hidden similar 4th construct
> from smp_processor_id(). Latch the result of the latter into a local
> variable and use the slightly more efficient per_cpu() instead.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oh, so that's kind of what I've suggested in the previous patch.

> ---
> A 5th such construct is "current", yet to replace that we'd need to open-
> code both it (i.e. get_current()) and then also smp_processor_id(). I
> wasn't quite sure whether that would be deemed acceptable.

See below, we can reorder and use the processor ID value stashed in
current?

> Like indicated in the earlier patch, this similarly leads to the function
> actually being inlined (and hence generated code size actually growing) in
> gcc16 debug builds. In release builds (with older gcc) the function is
> being inlined no matter what. Overall, having looked at generated code
> differences, I'm not quite sure anymore whether the earlier observed
> inefficiency with repeated this_cpu() really is much of an issue (here or
> maybe even more generally).

I think we sometimes focus too much on this kind of
micro-optimizations when the cost of the operation itself is orders of
magnitude bigger than any performance difference the optimization
might cause.

In this case I don't think the resulting code is bad or harder to
read, so I don't mind adjusting the logic.  But that's a question of
taste, if someone else has a preference for the original form I
wouldn't change it.

> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -20,7 +20,8 @@
>  
>  static inline struct vcpu *mapcache_current_vcpu(void)
>  {
> -    const struct vcpu *v = this_cpu(pgtable_vcpu);
> +    unsigned int cpu = smp_processor_id();
> +    const struct vcpu *v = per_cpu(pgtable_vcpu, cpu);
>      const struct vcpu *curr = current;

Maybe you can reorder the variables here:

const struct vcpu *curr = current;
unsigned int cpu = curr->processor;
const struct vcpu *v = per_cpu(pgtable_vcpu, cpu);

So that we avoid two smp_processor_id() calls (ie: the hidden one in
current).

Thanks, Roger.

