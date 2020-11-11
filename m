Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155B4C388F9
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:12:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C352053B
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="d0waCxHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C352053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25033.52585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrme-0007a4-MJ; Wed, 11 Nov 2020 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25033.52585; Wed, 11 Nov 2020 15:11:40 +0000
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
	id 1kcrme-0007Zx-I0; Wed, 11 Nov 2020 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 25033;
 Wed, 11 Nov 2020 15:11:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcrmd-0007Zs-R2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:11:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c14d34c5-a5a1-4335-8f81-1d25083b6ad6;
 Wed, 11 Nov 2020 15:11:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B42F0AC82;
 Wed, 11 Nov 2020 15:11:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcrmd-0007Zs-R2
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:11:39 +0000
X-Inumbo-ID: c14d34c5-a5a1-4335-8f81-1d25083b6ad6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c14d34c5-a5a1-4335-8f81-1d25083b6ad6;
	Wed, 11 Nov 2020 15:11:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605107497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D25xFq44o+ROSq7PtmfH57k0SQUUt62DuVfai3k9VCg=;
	b=d0waCxHO7tk55pPhck7LiWSWY87tM0XreYEYGdcsf2A9eJYDLb8oP0pgPLyqJQGJ7v5OA4
	IrFTN912Djc/wiq7/2hyx5as+z7+y+GGIUROqw6tr/bVG9mbHkMrqn8uhtpNcH3Y/mq/Kz
	XgDZ7huIBciRGexFHVO7gkAWa2CIhoA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B42F0AC82;
	Wed, 11 Nov 2020 15:11:37 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: Work around Clang code generation bug with asm
 parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201111124512.2268-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8282790a-a0bd-1d33-d992-9d194766254e@suse.com>
Date: Wed, 11 Nov 2020 16:11:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111124512.2268-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 13:45, Andrew Cooper wrote:
> Clang 9 and later don't handle the clobber of %r10 correctly in
> _hypercall64_4().  See https://bugs.llvm.org/show_bug.cgi?id=48122

Are you sure this is a bug? With ...

>  #define _hypercall64_4(type, hcall, a1, a2, a3, a4)                     \
>      ({                                                                  \
> -        long res, tmp__;                                                \
> -        register long _a4 asm ("r10") = ((long)(a4));                   \
> +        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
> +            _a3 = (long)(a3);                                           \
> +        register long _a4 asm ("r10") = (long)(a4);                     \
>          asm volatile (                                                  \
>              "call hypercall_page + %c[offset]"                          \
> -            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__),     \
> -              "=&r" (tmp__) ASM_CALL_CONSTRAINT                         \

... this we've requested "any register", while with ...

> -            : [offset] "i" (hcall * 32),                                \
> -              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3)),     \
> -              "4" (_a4)                                                 \

... this we've asked for that specific register to be initialized
from r10 (and without telling the compiler that r10 is going to
change).

Also, by what I would have hoped is convention meanwhile, the new
macro local variables' names shouldn't start with an underscore,
but instead perhaps end in one. But to be honest, despite knowing
of the latent (albeit highly hypothetical) issue, each time I
find myself making such a comment I'm one tiny step closer to
giving up.

Anyway, with at least title and description changed (or your view
clarified verbally)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

