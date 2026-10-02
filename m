Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B89CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 13:30:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439136.1657589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCdL9-0006V0-G1; Fri, 02 Oct 2026 13:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439136.1657589; Fri, 02 Oct 2026 13:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCdL9-0006Ut-DD; Fri, 02 Oct 2026 13:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1439136;
 Fri, 02 Oct 2026 13:30:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCdL7-0006Un-O1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 13:30:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCdL3-00B8dt-0Z;
 Fri, 02 Oct 2026 13:30:13 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCdL2-00BgHY-2C;
 Fri, 02 Oct 2026 13:30:13 +0000
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
	bh=B+ryK4cNzLrxJOPKW+kaF8YUKQUNuiDy7z0zKhxK+V4=; b=b+VhN9NxHWK3tskMdVI3bHIhJQ
	U2iCc6hpmd7uDLBqAVcQxWbSCGFvRuty+s0F46CMLXQDxoezfD12falIunEvIhLefgicJWjr8A7RI
	e+kNcr/xRV5eJZzelzvNINBHxD2WKtAbELuCMJvXC0FgSlcuJynZcLlvS2PniZiXKL/4=;
Date: Fri, 2 Oct 2026 15:30:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/domain: restrict context switch hooks for the
 idle domain
Message-ID: <ar-x2j5ggSMKUzMN@Mac.lan>
References: <20261002112005.20656-1-roger@xenproject.org>
 <8e26f887-453b-47cc-aaea-6c6675d9f9a5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e26f887-453b-47cc-aaea-6c6675d9f9a5@suse.com>

On Fri, Oct 02, 2026 at 01:33:42PM +0200, Jan Beulich wrote:
> On 02.10.2026 13:20, Roger Pau Monne wrote:
> > From: Grygorii Strashko <grygorii_strashko@epam.com>
> > 
> > The arch_init_idle_domain() initializes struct arch_csw idle_csw as:
> > 
> >     static const struct arch_csw idle_csw = {
> >         .from = paravirt_ctxt_switch_from,
> >         .to   = paravirt_ctxt_switch_to,
> >         .tail = idle_loop,
> >     };
> > 
> > but only place where d->arch.ctxt_switch->{to,from}() are used is
> > __context_switch() where they are both guarded by !is_idle_domain(pd)
> > which makes the callbacks in idle_csw unreachable.
> > 
> > Introduce a new poison value to be used in unreachable function hooks, and
> > set the from/to fields of idle_csw to it.  Use a different value from the
> > currently defined ones for easy differentiation.
> > 
> > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> provided this doesn't raise new Misra violations, including for rules which
> aren't entirely clean yet, but which are actively being worked on.

I've wondered the same, but since your recent change in:

68c3f7fb3a84 Eclair: relax long <-> function-pointer conversion deviation

I think it should be fine?  I will run a CI loop first anyway.

Thanks, Roger.

