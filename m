Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8359AC531D0
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 00:36:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369762.1618309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn3t1-0007Uy-3s; Fri, 24 Jul 2026 00:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369762.1618309; Fri, 24 Jul 2026 00:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn3t1-0007Ur-12; Fri, 24 Jul 2026 00:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1369762;
 Fri, 24 Jul 2026 00:35:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn3sy-0007Ul-HH
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 00:35:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn3sx-00H7aB-Co
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 02:35:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62b2f0-e002-0a2a0a5209dd-0a2a45048ad0-48
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:35:30 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62b350-b57f-0a2a45040019-d561b33881da-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:35:29 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn3sX-003fP3-Lm; Fri, 24 Jul 2026 02:35:05 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wn3sV-001zJH-53; Fri, 24 Jul 2026 02:35:05 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wn3sU-000000032Rd-3vQK;
 Fri, 24 Jul 2026 02:35:02 +0200
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
	bh=za9DVNeNQi2CkxfiaNpm43Br1tng2ZjZAAgVDdOwwuk=; b=crJzBPGuYnh42uDIAkGdg9100i
	cSwv8BdzsmzDDmyeYB6+8Rk5tCfr/WYJRGisnmywBCTKpYUjED51+phtVyvri8UXmmjfykOy8NTwS
	M2bD0OIukZo0Bp3rm9hX3kGWAsW8gXUAEZPh/lqHDyU6B2HgslnbWu1X9lTOIuNPyKpZ5RxATZczR
	/RxF8egA4Phr8JBySYycZx82VlPnbF+z6/eOlOT6+/ynMVwiyeA0ofe2Y4Y3fuzj6AELlH5MLkdS6
	LASl3I04JBBWmQcoKEowBigorxQ+yyu6oG2YPQsMWduO2R4WFpOVLo5Hqum80pctA9a6UigvaCNU8
	fPU+Gi9g==;
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 21:35:02 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
In-Reply-To: <5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
 <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
 <5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com>
Message-ID: <8df0340f0dc7f6c303c6a7da78fad7b8@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784853330-C14D3B50-9B5BE693/0/0
X-purgate-type: clean
X-purgate-size: 4130

On 2026-07-23 20:12, H. Peter Anvin wrote:
> On 2026-07-22 23:59, Jan Beulich wrote:
>>> 
>>> Also, this is silly. Instead of adding a whole separate test, just do "test %3,%3" before the repe to set ZF and let the REPE skip.
>> 
>> Besides this, isn't the function effectively returning bool wrong anyway? This
>> way you can use it for equal / not-equal comparisons, but not for sorting and
>> alike.
>> 
> There is no use case in the early code for sorting, and it seems rather broken
> to burden the code with that.

If this is merged, other users not in early code might eventually
appear, which might introduce the use case for sorting. Even though that
is unlikely, as such users could probably use regular memcmp() instead,
consider that just in case, so I can ask for your input/advice on this:

> That being said it probably should return bool explicitly (it makes no sense
> for the prototype to be different than the internal variable.)
> 
> We could call it memneq() if someone really, really cares, I guess.
> 
> The early code is very size-sensitive, so I'm really not fond of the idea of
> burdening it further. Perhaps something like:

Do you think this implementation (returns -1/0/+1) is reasonable,
size-wise, for early code?

I considered submitting it eventually, once the return value difference
to regular memcmp() was called out [0], as an improvement, if there's
agreement this would be a good idea considering the scenario above.

static __always_inline int __inline_memcmp(const void *s1, const void
*s2, size_t len)
{
        int above, below;

        asm volatile("test %2, %2\n\t"
                     "repe cmpsb"
                     : "+S" (s1), "+D" (s2), "+c" (len),
                       "=@cca" (above), "=@ccb" (below)
                     : : "memory");

        return above - below;
}

@ arch/x86/boot/string.o
00000028 <memcmp>:
  28:   66 57                   push   %di
  2a:   66 56                   push   %si
  2c:   66 89 c6                mov    %ax,%si
  2f:   66 89 d7                mov    %dx,%di

  32:   66 85 c9                test   %cx,%cx
  35:   f3 a6                   repz cmpsb %es:(%edi),%ds:(%esi)
  37:   0f 97 c0                seta   %al
  3a:   66 0f b6 c0             movzbw %al,%ax
  3e:   0f 92 c2                setb   %dl
  41:   66 0f b6 d2             movzbw %dl,%dx
  45:   66 29 d0                sub    %dx,%ax

  48:   66 5e                   pop    %si
  4a:   66 5f                   pop    %di
  4c:   66 c3                   retw

> A memory clobber is ugly here since no memory is actually modified, although

I'm definitely not an expert, but IIUIC, this memory clobber is for
reads, not writes? Say, a caller/optimized code that writes to the
buffer(s) prior to __inline_memcmp() and data might still reside in
registers; even if theoretical/unlikely.

As in [1]:

  The "memory" clobber tells the compiler that the assembly code
performs memory reads or writes [...] (for example, accessing the memory
pointed to [...]). To ensure memory contains correct values, GCC may
need to flush specific register values to memory before executing the
asm.

> it probably doesn't affect code; "cc" is completely redundant with condition
> code output operand.

Thanks for explaining. I'll remove that in the next version.

[0]
https://lore.kernel.org/all/324ef97b16f52e0ccc72f6381d1b5dd2@igalia.com/
[1]
https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1

cheers,

> static __always_inline bool
> __inline_memcmp(const void *s1, const void *s2, size_t len)
> {
> 	bool diff;
> 
> 	if (__builtin_constant_p(len == 0)) {
> 		if (!len)
> 			return false;
> 		asm volatile("repe cmpsb"
> 				: "=@ccnz" (diff),
> 				  "+D" (s1), "+S" (s2), "+c" (len)
> 				: : "memory");
> 	} else {
> 		/* Clear ZF beforehand in case len == 0 */
> 		asm volatile("test %3,%3; repe cmpsb"
> 				: "=@ccnz" (diff),
> 				  "+D" (s1), "+S" (s2), "+c" (len)
> 				: : "memory");
> 	}
> 	return diff;
> }


-- 
Mauricio

