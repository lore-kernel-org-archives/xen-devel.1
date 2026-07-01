Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD7C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 07:06:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349527.1607258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wep0y-000326-Dz; Wed, 01 Jul 2026 07:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349527.1607258; Wed, 01 Jul 2026 07:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wep0y-00031y-A1; Wed, 01 Jul 2026 07:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1349527;
 Wed, 01 Jul 2026 07:05:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterz@infradead.org>) id 1wep0w-00031q-27
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 07:05:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wep0v-008YJK-BR
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:05:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterz@infradead.org>)
 id 6a44bc3f-2eae-0a2a0a5409dd-0a2a4502da62-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:05:40 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterz@infradead.org>)
 id 6a44bc43-5a27-0a2a45020019-5a9b3222db76-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:05:39 +0200
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wep0n-00000006Avt-1h6e; Wed, 01 Jul 2026 07:05:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id ECCFA30035C; Wed, 01 Jul 2026 09:05:31 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+AaYpDAuxo7H4NIsCnNAZDJ/up1aHckwKckTsZUvyYo=; b=obljbhuiEFfUuQG2puQ/PkbnJB
	ObvbkN3jtXxrgtWidSkKLpIFrJAhoSkE0ln3nU9mr8U/s6eVLGJ3wgVZE8OqsfGTjooaeg/G1q0Bx
	4ykvNq3SVgHh1vZGY7LQyVu+cJwysZH/AAayjUiEuDzqqlHKusFT0kOfmcjqEYfAVSrhjYoo/ALlN
	eDOtGEALQpKWr8R+L6fOm2nhZ/X04WVjwDX15RQsFxk+5sT62z2LjJ/ohPAf6WnBh3i2BJ4e5YSFk
	ZvmTMJW/gH/cz4XaFf28ftNCy6xI6xFAw48J2trogdaLMXogw0JaXN+VhndNhW4UY1f5oe60hJl86
	9HZxYVNg==;
Date: Wed, 1 Jul 2026 09:05:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
Message-ID: <20260701070531.GK48970@noisy.programming.kicks-ass.net>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
X-purgate-ID: tlsNG-720697/1782889540-4D3037C5-3C8A4052/0/0
X-purgate-type: clean
X-purgate-size: 3069

On Tue, Jun 30, 2026 at 02:21:46PM -0300, Mauricio Faria de Oliveira wrote:
> Move the inline memcmp function currently only available in 'boot/string.c'
> into the shared string function header <asm/shared/string.h> to be reused.
> 
> This is not done through <asm/string.h> to avoid pulling unnecessary code
> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
> and 'purgatory/purgatory.ro'.
> 
> Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
> (reported by David Laight <david.laight.linux@gmail.com>).
> 
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  arch/x86/boot/string.c               |  6 ++----
>  arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
>  arch/x86/include/asm/string.h        |  1 +
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
> index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -15,6 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <asm/asm.h>
> +#include <asm/shared/string.h>
>  #include "ctype.h"
>  #include "string.h"
>  
> @@ -31,10 +32,7 @@
>  
>  int memcmp(const void *s1, const void *s2, size_t len)
>  {
> -	bool diff;
> -	asm("repe cmpsb"
> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> -	return diff;
> +	return __inline_memcmp(s1, s2, len);
>  }
>  
>  /*
> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..422952152f533ad75b98f3873297b39c4f5e2477
> --- /dev/null
> +++ b/arch/x86/include/asm/shared/string.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_SHARED_STRING_H
> +#define _ASM_X86_SHARED_STRING_H
> +
> +/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
> +static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
> +{
> +	bool diff;
> +
> +	asm("repe cmpsb"
> +	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> +
> +	return diff;
> +}
> +
> +#endif /* _ASM_X86_SHARED_STRING_H */
> diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
> index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..f0f4fd8227bf992e78c69209efb31f0a9a0cc3b1 100644
> --- a/arch/x86/include/asm/string.h
> +++ b/arch/x86/include/asm/string.h
> @@ -7,6 +7,7 @@
>  #else
>  # include <asm/string_64.h>
>  #endif
> +#include <asm/shared/string.h>
>  
>  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
>  {

It seems weird to have __inline_mem{cpy,set}() in a different header than
__inline_memcmp(). I'm assuming this is because boot cannot include the
normal string thing?

Perhaps make inline_string.h or somesuch to carry all three of them and
include that from the relevant places?

