Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3F606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 20:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8uD/cAR
Received: from list by lists.xenproject.org with outflank-mailman.1486485.1689115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRbMm-00060T-6S; Thu, 12 Nov 2026 20:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486485.1689115; Thu, 12 Nov 2026 20:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRbMm-00060M-3i; Thu, 12 Nov 2026 20:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1486485;
 Thu, 12 Nov 2026 20:25:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRbMk-00060G-VD
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 20:25:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRbMk-002u8q-Bu
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 21:25:50 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af620c4-e002-0a2a0a5209dd-0a2a4503be52-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 21:25:50 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af620ce-fae8-0a2a45030019-d155802dbddb-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 21:25:50 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so1657345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:25:50 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55a68c65sm7545515e9.2.2026.11.12.12.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 12:25:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794515150; x=1795119950; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grQZVUaUQpToVF08bFJ08As8l+mKfwwbgrWNLBbHBSg=;
        b=r8uD/cARuIFMA3ssgy5V45YL9QaKN7nPSfkdbG2SXCQ1ww2DmbxWckIX2MSIaDxhVi
         5O+JiFo9q38tTlX7Sk9QSSedug19UZToTyeWPe9agDzIuBrsHHaTStHGNTezzndW+2o5
         0+Iorr9TMKqls/9EXrJPPzrwRh9445GJ4FhOJTuCzyHbeOa9jhqEuOiIKNWHeBQeMBx8
         GfZgQdYW3k+OSr0e8MriqD3DGdEdkonuKtI7iM85kU9UCbDdb0fOZ/sY/Hlg9sOmeG3C
         BQdjxdnGP2s3+GK9iU4RuRSLxXhY1bUDxjnjqBssrEPWrwM6lWGnJV5PheTuyrtvN27m
         GB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515150; x=1795119950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grQZVUaUQpToVF08bFJ08As8l+mKfwwbgrWNLBbHBSg=;
        b=OZpqH6EWrjha8BpqcEp7xyuqdoxE9zhhDmkdyh3Jqq6kpLtnjwE56lVWmwv6jldqgD
         EnsXoO3mawe8aoUKti+d4gMRl4JseYiSVwIeJuz6HD/4b+BAD4t08mBsGZM5Y/6Emo1d
         sKqflFdHVZeg7YrHkarpLabtNj2IdQfe1aayW+ZCxI1PlTSSNxY/TfEF7x8D9teEkFFy
         cYpKs0xlFREBbGrg2OhrQkCr1XbONTymW9Lg7lB4I0vjuiW7Visq5lgfsCucsQjP4gDg
         TguyeM2BPWlNoObw+dWNa3yhpxJCXZCmXY9ub1zha8//v3qW7v3HpX5oTFbXl7fgtseU
         NH5A==
X-Forwarded-Encrypted: i=1; AL+hErFZNVW1qDan+O8xZreCyCVD16rlZDC/xuhjrpHL9af7WMFuuSDZdLQ+zvGOJ9kQZ6YvgnW71CeYrfU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/Sm2JudCyp07kGP26exSs4S8KFE/P9lFaZYS3XrWdefxCTdmuY
	dUExZprh5ObPY5ULpL4TNMpgU+RkuMGr27q5urW0W8tYDNsiftMgQ61L
X-Gm-Gg: AYBFou2zJIxIT2rp2JS/pvefW1DrF4wDnaRObi+CruQBVOZWqTj1KKsPa6QVIYfnw01
	A+qwUOeik/h6+FOuRr4mh60QfQo4or2MAS3wpRPFFVqrxPvCMfRYnYK6oHXaJIElU77/wBYYE55
	HkQq1aL96YJZk//MrMAEO3tDYFly+xEtQfElb/nHO3oONq6V0d+W6pQBK1yW4HaQfbHQr+bRnSz
	Laqx4OesICuaB3aPNfOgZzb+oUmYpQol+5SWOmH/XLEDnVA3zEPpHl1LPwxSnMs4OO3wXyzPfic
	tYc3KgIcxu3AqaYqk5B+yYqn663xV1//qKhvFNXyBCf4d5l0depfLpBVyp3MwbtMoGCz8PMNnGw
	3LsNIVsKEQcsdAmbwg4MKRx8gu4un+B6ItZ4yyUR16GbvNzaHZsvuwXENPm2fLEg4AX9HxEUcAL
	w1wE65bq5y3u5HPjD4it9/ucIfFFF6kbU7Ddbx2l4ezfdriwHxVvDWR2YmR1z0FRVFhoBUh83Ak
	4lbd0qCLJaXx3hS89u5eqSBxemBUPyTug5QWQFvECnJ7Ft5slNRZqcItKJDhCvzU8eier4472fM
	LT9NloMLNDzavNQCIPCf6KBGz6HB+UKPqp+gGnbMm3iwoW+qaMdNPDwLsKl9Vvkjyhtyolzhe37
	XbA==
X-Received: by 2002:a05:600c:154c:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4bb55a64586mr7440005e9.14.1794515149594;
        Thu, 12 Nov 2026 12:25:49 -0800 (PST)
Message-ID: <10af125e-21cb-49a7-bc32-304d11b55427@gmail.com>
Date: Thu, 12 Nov 2026 21:25:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/26] x86: fixup dependencies for asm/x86_emulate.h
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-4-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794515150-6F0C94E9-7638FD21/10/73395122804
X-purgate-type: spam
X-purgate-size: 1841
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add xen/bug.h so that asm/x86_emulate.h can be cleanly used if listed as
> the first include in translation unit.

It would help to say what is needed from it: x86emul_invpcid_aux() in
x86_emulate/x86_emulate.h uses ASSERT(), which lives in xen/bug.h, and
xen/lib.h no longer provides it.

I haven't checked by do we really need then inclusion of xen/lib.h in 
x86_emulate.h? Won't it be enough to have only xen/bug.h as my 
understanding that the only reason for xen/lib.h is (was) ASSERT?

> 
> Amends: 0a249bcb0279 ("x86: reduce dependencies on x86_emulate/x86_emulate.h")

I don't think that commit is where this comes from. A translation unit
containing only #include <asm/x86_emulate.h> fails with "implicit
declaration of function 'ASSERT'" both at 0a249bcb0279 and at its
parent. The ASSERT() dependency got lost with 8de3afc0b402 ("xen: move
BUG_ON(), WARN_ON(), ASSERT(), ASSERT_UNREACHABLE() to xen/bug.h"),
which dropped xen/bug.h from xen/lib.h. Since the header wasn't
self-contained before that either, I'd rather drop the tag than point
it at 0a249bcb0279.

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/include/asm/x86_emulate.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/include/asm/x86_emulate.h b/xen/arch/x86/include/asm/x86_emulate.h
> index 2b75f7f8e215..209d1e54e03f 100644
> --- a/xen/arch/x86/include/asm/x86_emulate.h
> +++ b/xen/arch/x86/include/asm/x86_emulate.h
> @@ -13,6 +13,7 @@
>   #define __ASM_X86_X86_EMULATE_H__
>   
>   #include <xen/types.h>
> +#include <xen/bug.h>

Nit: alphabetical order (xen/bug.h first).

>   #include <xen/lib.h>
>   #include <asm/regs.h>
>   #include <asm/x86-defns.h>

~ Oleksii

