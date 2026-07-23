Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D6CC531FA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:27:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369730.1618291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2oh-0003wV-Mv; Thu, 23 Jul 2026 23:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369730.1618291; Thu, 23 Jul 2026 23:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2oh-0003wO-KC; Thu, 23 Jul 2026 23:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1369730;
 Thu, 23 Jul 2026 23:27:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn2og-0003wI-FC
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:27:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2of-0038pO-Dj
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:27:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a2e0-5cb7-0a2a0a5109dd-0a2a4502b998-26
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:27:01 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a344-6ca4-0a2a45020019-d561b338a7e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:27:01 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn2oM-003e8A-1v; Fri, 24 Jul 2026 01:26:42 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wn2oJ-001vz2-GQ; Fri, 24 Jul 2026 01:26:41 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wn2oJ-000000031ty-1Ci6;
 Fri, 24 Jul 2026 01:26:39 +0200
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
	bh=fLZIWX2wSccqFNik9bhUsUlx9S80wKp6f12wJ1NBHj8=; b=cr/zucLaHLMdD0S1h4riL0nIts
	y9InaI9oC8hrKeP2gFjWw0b0i9wSmasJfpAB4xnXGfLPgtnp5mLkvrJ3rIGzB2bR+iTQivVTKjl5j
	jvXq/qnpoZrCAX6GfXffP9sL7/Ne5nvBUBxKsupykJC3Zm4pU6BzgBpn4teszoaokNz7yWfvy11lb
	D057F9tzX/JozgyY1E3QxOw4GiJ6GMlbAsuCsIPlICBumzEEzYMCLY8eS3pSYRJbLv6CaqSkifuq/
	Ir88SDy8SpbFTp0XZs5uqeFvFWHJqSy4mZ0YELdNC8Vlv/LinUBe/R5GPrebmCarOR81IfKhuHNGu
	aONrK+Yg==;
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 20:26:39 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
In-Reply-To: <829A5D01-29A2-454E-AE78-AEAD8FC597E6@zytor.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <829A5D01-29A2-454E-AE78-AEAD8FC597E6@zytor.com>
Message-ID: <182aa568ea05a0f1297d307a169eb687@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1784849221-66CB22AC-13660725/0/0
X-purgate-type: clean
X-purgate-size: 2532

On 2026-07-22 15:48, H. Peter Anvin wrote:
> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
>>hpa in To:.
>>
>>On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrote:
>>> Add the volatile qualifier and clobbers parameter to prevent bugs with
>>> instruction reordering and optimization.
>>> 
>>> Also check the zero-length case, as the 'repe' prefix does not run the
>>> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
>>
>>Please use capital letters for insns: REPE, CMPSB and you don't need to put
>>words in '' - it reads fine without them.
>>
>>> the condition-code/zero flag, so the result is based on a stale flag.
>>> 
>>> Those are pre-existing issues found by Sashiko.
>>> 
>>> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>> ---
>>>  arch/x86/include/asm/shared/string.h | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
>>> --- a/arch/x86/include/asm/shared/string.h
>>> +++ b/arch/x86/include/asm/shared/string.h
>>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
>>>  {
>>>  	bool diff;
>>>  
>>> -	asm("repe cmpsb"
>>> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>>> +	if (len == 0)
>>> +		return 0;
>>> +
>>> +	asm volatile("repe cmpsb"
>>> +		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>>> +		     : : "cc", "memory");
>>>  
>>>  	return diff;
>>>  }
>>
>>So this is a fix which should probably go to stable, I think. Going back into
>>git history, it points to
>>
>>  62bd0337d0c4 ("Top header file for new x86 setup code")
>>
>>from 2007. And we have carried it this way through the years and who knows
>>what hit this or not. So please make this the first patch in your set - you
>>can even send it separately so that I can get route it through stable.
>>
>>Then you can base the rest ontop.
>>
>>Thx.
>>
> 
> I suspect that the zero-length case simply can't happen in the real code, but who knows; the use of the code has expanded over the years.

Agreed, and its use may expand more in the future, being in a header
(e.g., this very series :)

Thanks,

-- 
Mauricio

