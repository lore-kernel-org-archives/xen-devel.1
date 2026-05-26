Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA01DCD5BC8
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 15:11:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320053.1587473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtR9-0001w8-Rw; Tue, 26 May 2026 15:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320053.1587473; Tue, 26 May 2026 15:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtR9-0001w1-Od; Tue, 26 May 2026 15:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1320053;
 Tue, 26 May 2026 15:11:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wRtR8-0001va-0V
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:11:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRtR7-00BI5q-C4
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 17:11:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b809-bab6-0a2a0a5309dd-0a2a450c845a-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:11:17 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b814-62f1-0a2a450c0019-d561b338e9fc-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:11:17 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRtQq-008ULx-0d; Tue, 26 May 2026 17:11:00 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wRtQn-00FQhw-Gh; Tue, 26 May 2026 17:10:59 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wRtQm-00000004KKo-3QFA;
 Tue, 26 May 2026 17:10:57 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dgXPzZks042vDCPxwi/FYcjpoAOOgxJVnLQfvZEDcwU=; b=nuduw5SXvbcCXV/Mvx9DeIwsQn
	GC+6hx3vjvtfn5o8Q3q84RnCOk7HXuPFHnIxF4OESlsBxH3xwy3wfpjXjtCQKXuBG5WJVSZd0zwM2
	wZJS/eXXUpvA8r2GppxKCQFP95UlHH7TETC3L+BtvunYCFUXpRJKelEq0uA4AJM5NPz3sd4X5bHgw
	x7cEydk9sMcA5WlGuvo/nIv3PcR1jKUaHeXLhtkcDXhsrDeR60OO9LaSFU54nipgHQ83tYyvyw/rG
	hSvka5eQpPYrJ/rsxTmuBJjZnHooMuG1Hy82Poa2D3d+PLOHsHhu9okwSeT4+s/28VI0YDe0k9cbQ
	8Nayt9ug==;
MIME-Version: 1.0
Date: Tue, 26 May 2026 12:10:57 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Juergen Gross <jgross@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
In-Reply-To: <c47a38fb-9945-4d0f-8d19-bd455c591245@suse.com>
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
 <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>
 <c47a38fb-9945-4d0f-8d19-bd455c591245@suse.com>
Message-ID: <aba22765c480013447670ac37f016543@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779808277-DA577CF5-85A19095/0/0
X-purgate-type: clean
X-purgate-size: 3487

Thanks for reviewing.

On 2026-05-26 06:51, Juergen Gross wrote:
> On 20.05.26 23:12, Mauricio Faria de Oliveira wrote:
>> In next patch, inline string functions are included from 'boot/string.c'.
> 
> Please don't use "In next patch". You can't be sure the patches of a
> series are going to be committed all together.
> 
> A better alternative wording would be "In a future patch".

Ack; replaced.

> 
>> Using the header <asm/string.h> is problematic for a couple of reasons (*)
>> (i.e., build errors), which can be addressed, but introduce unnecessary
>> complexity and regression risk (beyond these _found_ couple of reasons).
>> 
>> Using a new header <asm/string_inline.h> is simpler and transparent to
>> existing users of <asm/string.h>, with less changes to 'boot/string.c'
>> and its users (eg 'boot/compressed/string.c' and 'purgatory/purgatory.ro'),
>> which minimize regression risk.
>> 
>> No functional change intended.
>> 
> 
> I'd rather put the footnote below after the "---" line, as it is more
> interesting for the reviewer than the consumer of "git log" or "git show".
> 
> Note that others might disagree, though.

Good point; indeed, that is review material. I'll change it for now.

>> (*) Reasons not to include <asm/string.h> in 'boot/string.c':
>> 
>> 1) 'boot/string.c' is built for 16-bit/real mode thus some type and word
>> size errors happen when <asm/string.h> include, e.g., <asm/string_64.h>.
>> 
>> This can be addressed with '#ifndef _SETUP' (defined by 'boot/Makefile').
>> 
>> 2) 'boot/string.c' is included by 'boot/compressed/string.c' which is
>> the source of 'purgatory/string.o', linked by 'purgatory/purgatory.ro'
>> (CONFIG_KEXEC_FILE).
>> 
>> In 64BIT, <asm/string.h> includes <asm/string_64.h>, which references
>> __memset() and __memmove() with KCFI_REFERENCE(), ie, __ADDRESSABLE();
>> however, 'purgatory/purgatory.ro' is not linked with implementations.
>> 
>> So, CONFIG_KEXEC_FILE and CONFIG_CFI without CONFIG_KASAN hit errors:
>> 
>>    >> ld.lld: error: undefined symbol: __memset
>>       >>> referenced by string.c
>>       >>>               arch/x86/purgatory/purgatory.ro:\
>>                         (__UNIQUE_ID_addressable___memset_0)
>>    --
>>    >> ld.lld: error: undefined symbol: __memmove
>>       >>> referenced by string.c
>>       >>>               arch/x86/purgatory/purgatory.ro:\
>>                         (__UNIQUE_ID_addressable___memmove_1)
>> 
>> (Note: this is not hit with CONFIG_KASAN because 'boot/compressed/string.c'
>> adds aliases __memset()/__memmove() to memset()/memmove() in that case.)
>> 
>> This can be addressed with 'CFLAGS_string.o := -D__DISABLE_EXPORTS' so to
>> disable KCFI_REFERENCE() in 'purgatory/Makefile' (it removes CC_FLAGS_CFI
>> anyway).
>> 
>> ...
>> 
>> However, since a change in this series would need more changes to address
>> errors it causes, it is reasonable to change the series not to cause them,
>> by using a separate header with _just_ inline string functions.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> 
> With (at least) my first remark addressed:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Sent v4 with both remarks above addressed and your new R-b tags; thanks!

> 
> 
> Juergen

-- 
Mauricio

