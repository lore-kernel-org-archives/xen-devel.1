Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489EFC531D0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:17:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369712.1618272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2fK-0001Ud-JT; Thu, 23 Jul 2026 23:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369712.1618272; Thu, 23 Jul 2026 23:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2fK-0001UW-GP; Thu, 23 Jul 2026 23:17:22 +0000
Received: by outflank-mailman (input) for mailman id 1369712;
 Thu, 23 Jul 2026 23:17:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn2fI-0001UQ-Pt
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:17:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2fI-00AA3Z-6o
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:17:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a0a3-bab6-0a2a0a5309dd-0a2a4503bfb4-46
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:17:20 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a0ff-fae8-0a2a45030019-d561b338d4d6-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:17:20 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn2f3-003dxL-E8; Fri, 24 Jul 2026 01:17:05 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wn2f0-001vGh-UY; Fri, 24 Jul 2026 01:17:05 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wn2f0-000000031om-34zR;
 Fri, 24 Jul 2026 01:17:02 +0200
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
	bh=iz6E4BrpWd+r0aWdrdKsx0L9pMZaz696rZOSQQ8lwLQ=; b=WvmO2NuGiN1okDC4E61j4ggHNW
	33/Rc2fCFQXaqeZgaHYNnCckzodMQS+KjAJngAKh/TqS5qiW3aNDwY2SW9DOFMfpeC88LIUZM+PJQ
	XMZK+3oE5JnRaoVnTH3wphiwjC3c69DbckSzRYGYCmSHSJrRrg6wVOtuXgpNQnQcxAT/Sisw/ZpPO
	GzRdxFVfItLlHCBs8gsRSSCUQH18PLmvA62ZhPvCVfWhC/ydugpf5W9prsO4Sb2zv1E0XQxWJ/iQx
	DJy9dcTLSUNGYDO1HgyiCOST8663Eap8NxbzoFS4QAj4Gt0EXsGVNLLcYKUK95P/Bf8Pgk4khtW1p
	7PJz8cUw==;
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 20:17:02 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
In-Reply-To: <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
Message-ID: <1e451a9179c1faa8e7805d17c6e1ee10@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784848640-7428D4E9-EE9D286A/0/0
X-purgate-type: clean
X-purgate-size: 2370

On 2026-07-22 14:03, Borislav Petkov wrote:
> hpa in To:.
> 
> On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrote:
>> Add the volatile qualifier and clobbers parameter to prevent bugs with
>> instruction reordering and optimization.
>> 
>> Also check the zero-length case, as the 'repe' prefix does not run the
>> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
> 
> Please use capital letters for insns: REPE, CMPSB and you don't need to put
> words in '' - it reads fine without them.

Ok.

> 
>> the condition-code/zero flag, so the result is based on a stale flag.
>> 
>> Those are pre-existing issues found by Sashiko.
>> 
>> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
>>  arch/x86/include/asm/shared/string.h | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
>> --- a/arch/x86/include/asm/shared/string.h
>> +++ b/arch/x86/include/asm/shared/string.h
>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
>>  {
>>  	bool diff;
>>  
>> -	asm("repe cmpsb"
>> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> +	if (len == 0)
>> +		return 0;
>> +
>> +	asm volatile("repe cmpsb"
>> +		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>> +		     : : "cc", "memory");
>>  
>>  	return diff;
>>  }
> 
> So this is a fix which should probably go to stable, I think. Going back into
> git history, it points to
> 
>   62bd0337d0c4 ("Top header file for new x86 setup code")
> 
> from 2007. And we have carried it this way through the years and who knows
> what hit this or not. So please make this the first patch in your set - you
> can even send it separately so that I can get route it through stable.

Sure:
https://lore.kernel.org/all/20260723-x86-memcmp-asm-v2-1-d93ecb43797f@igalia.com/

> Then you can base the rest ontop.

Done:
https://lore.kernel.org/all/20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com/

Thanks,

> 
> Thx.

-- 
Mauricio

