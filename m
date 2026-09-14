Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4971C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:22:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420799.1647020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64lk-0005iW-HW; Mon, 14 Sep 2026 11:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420799.1647020; Mon, 14 Sep 2026 11:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64lk-0005iP-EP; Mon, 14 Sep 2026 11:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1420799;
 Mon, 14 Sep 2026 11:22:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x64lg-0005iG-Ul
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64le-00FVed-Kt
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:22:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa7d8f7-2eae-0a2a0a5409dd-0a2a450ae968-10
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:22:33 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa7d8f8-f2d2-0a2a450a0019-d561b3389ac8-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:22:33 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x64lG-001qu6-1K; Mon, 14 Sep 2026 13:22:09 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x64lE-005S9L-IM; Mon, 14 Sep 2026 13:22:09 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x64lE-00000001lBc-2bZU;
 Mon, 14 Sep 2026 13:22:08 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=2ydmnqg3HzMcYUZI2KHG3VyDjXAqFDQPhoUDoniAetY=; b=cy74yz1Y2/+YbLAzf8335Y1wM1
	1qLgLIt0fU9HO16yeqOoAy75tO5s7AnypubeO87+oGmwMGKg6q/MUoFSq/tZGgTz3sgbEqxG4vc06
	zP5qqCPG2YgXWFEm/jscvjKnYZqQADeVQe6vHEZwKPPqvss9nk2fDZVgKLv8YLmEjIjHVWeRlSwW2
	WcYalKf39RPww+iHWTzwYX2w9xtZlPVx5pqbT5wAQEq6eQ1cloAxLY//PvcnaFRV8H/pR1T5tVApd
	0JemAXv1ZInZf4KodOETfh6hsN1r8ePc9cSgp/7sirQgvLogFgLm4GzTF7q6H4HXrK+Il1qrPcrRb
	rLAiSyAQ==;
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:22:08 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
In-Reply-To: <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
Message-ID: <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789384953-53AD4CFC-9956213B/0/0
X-purgate-type: clean
X-purgate-size: 2518

On 2026-09-11 01:38, Borislav Petkov wrote:
> On Sat, Aug 22, 2026 at 03:33:20PM -0300, Mauricio Faria de Oliveira wrote:
>> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
>> index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
>> --- a/arch/x86/include/asm/cpuid/api.h
>> +++ b/arch/x86/include/asm/cpuid/api.h
>> @@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>>  		 * from PVH early boot code before instrumentation is set up
>>  		 * and memcmp() itself may be instrumented.
>>  		 */
>> -		if (!__builtin_memcmp(sig, signature, 12) &&
>> +		if (!__inline_memcmp(sig, signature, 12) &&
> 
> Dunno, did you not think of simply doing it by foot and save yourself all
> those gymnastics in patches 1-3?

In the review of the original patchset (fixed by this series) it is
mentioned that a compiler might turn it into a memcmp() [1] -- and thus
revert back to the same issue.

[1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/

Thanks,

> 
> IOW, something like this totally untested thing below:
> 
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
> index 2d9f3d4d63de..a2db83d17940 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -192,9 +192,10 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
>  #define for_each_possible_cpuid_base_hypervisor(function) \
>  	for (function = 0x40000000; function < 0x40010000; function += 0x100)
>  
> -static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
> +static inline u32 cpuid_base_hypervisor(const char *__sig, u32 leaves)
>  {
>  	u32 base, eax, signature[3];
> +	u32 *sig = (u32 *)__sig;
>  
>  	for_each_possible_cpuid_base_hypervisor(base) {
>  		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
> @@ -204,9 +205,12 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>  		 * from PVH early boot code before instrumentation is set up
>  		 * and memcmp() itself may be instrumented.
>  		 */
> -		if (!__inline_memcmp(sig, signature, 12) &&
> -		    (leaves == 0 || ((eax - base) >= leaves)))
> -			return base;
> +		if (sig[0] == signature[0] &&
> +		    sig[1] == signature[1] &&
> +		    sig[2] == signature[2]) {
> +			if (leaves == 0 || ((eax - base) >= leaves))
> +				return base;
> +		}
>  	}
>  
>  	return 0;

-- 
Mauricio

