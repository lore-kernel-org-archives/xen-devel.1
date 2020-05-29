Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA2BC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 12:41:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245A020721
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245A020721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeJl-000404-Si; Fri, 29 May 2020 12:40:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeeJl-0003zx-0V
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:40:57 +0000
X-Inumbo-ID: a3806864-a1a9-11ea-a8a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3806864-a1a9-11ea-a8a9-12813bfff9fa;
 Fri, 29 May 2020 12:40:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A7E9ACB1;
 Fri, 29 May 2020 12:40:54 +0000 (UTC)
Subject: Re: [PATCH v2 12/14] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-13-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5be19f55-979a-3cef-18bf-f9673cef1da3@suse.com>
Date: Fri, 29 May 2020 14:40:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 21:18, Andrew Cooper wrote:
> The SYSCALL/SYSENTER/SYSRET paths need to use {SET,CLR}SSBSY.  The IRET to
> guest paths must not.  In the SYSRET path, re-position the mov which loads rip
> into %rcx so we can use %rcx for CLRSSBSY, rather than spilling another
> register to the stack.
> 
> While we can in principle detect shadow stack corruption and a failure to
> clear the supervisor token busy bit in the SYSRET path (by inspecting the
> carry flag following CLRSSBSY), we cannot detect similar problems for the IRET
> path (IRET is specified not to fault in this case).
> 
> We will double fault at some point later, when next trying to enter Xen, due
> to an already-set supervisor shadow stack busy bit.  As SYSRET is a uncommon
> path anyway, avoid the added complexity for no appreciable gain.

I'm okay with the avoidance of complexity, but why is the SYSRET path
uncommon? Almost all hypercall returns ought to take that path?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -191,9 +191,16 @@ restore_all_guest:
>          sarq  $47,%rcx
>          incl  %ecx
>          cmpl  $1,%ecx
> -        movq  8(%rsp),%rcx            # RIP
>          ja    iret_exit_to_guest

This removal from the shared part of the exit path needs to be
reflected on both of the sides of the JA, i.e. ...

>  
> +        /* Clear the supervisor shadow stack token busy bit. */
> +.macro rag_clrssbsy
> +        rdsspq %rcx
> +        clrssbsy (%rcx)
> +.endm
> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
> +
> +        movq  8(%rsp), %rcx           # RIP

... not just here, but also like this (with the JA above changed
to target the new label):

         ALIGN
 /* No special register assumptions. */
+.Liret_exit_to_guest:
+        movq  8(%rsp),%rcx            # RIP
 iret_exit_to_guest:
         andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
         orl   $X86_EFLAGS_IF,24(%rsp)

Granted it's mostly cosmetic, as the IRETQ ought to fault, but
it's still a use of IRET in place of SYSRET, and hence we better
get guest register state right. With this or a functionally
identical adjustment (or a clarification on what makes you
convinced this adjustment isn't needed)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

