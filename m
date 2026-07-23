Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E124EC531FC
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:14:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369655.1618210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2bm-0006Wk-Or; Thu, 23 Jul 2026 23:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369655.1618210; Thu, 23 Jul 2026 23:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2bm-0006Wd-M0; Thu, 23 Jul 2026 23:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1369655;
 Thu, 23 Jul 2026 23:13:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wn2bk-0006WM-Oy
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:13:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2bg-00A8PH-O2
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:13:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a62a007-5cb7-0a2a0a5109dd-0a2a4506cddc-20
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:13:36 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a62a01e-195a-0a2a45060019-c689ca88b3ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:13:35 +0200
Received: from [IPV6:2601:646:8081:7da1:14d6:374d:d1f7:d29c]
 ([IPv6:2601:646:8081:7da1:14d6:374d:d1f7:d29c])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66NNCwoO3915882
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 23 Jul 2026 16:13:02 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026062701 header.d=zytor.com header.i="@zytor.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66NNCwoO3915882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784848383;
	bh=yGM4H+NKV/eCj832lsl0YUE76vaWUmRyALUU4TyU40o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pl0j6OrZ7uVKrD6fTNUy6jPbIMhBpYHuCEuBisV/Ln1QqlAnthsrc//n2qAx1lPnj
	 MG9dcOYl8kjjQXxup1KyhQIKXRj8yo1m1LC7qN2o9qOvVrViYsFcEGQqK5sIxwe0zk
	 WPPEuDDTU4Fxjr5hKYolEANiY76Pk9tqFs5mLpn9gaWeyUXCJZd3luINB18vjZJgRq
	 VajvVhAHl5Lf6XbUsO9fY7BoOaUCC+ROX4CRL73jb7UrZnIQVBOlWhE+OxtR2FLqqa
	 5awTdUjFe9tlEf15rHjHCBjUXP6qv2quIlTZFCOFAz1oupu3EoJqfGI7ZKWRKlLi/m
	 AKJvoKvPx7Lgw==
Message-ID: <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com>
Date: Thu, 23 Jul 2026 16:13:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
To: Brian Gerst <brgerst@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
 <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784848416-FEC7777B-216E7DF7/0/0
X-purgate-type: clean
X-purgate-size: 3009

On 2026-07-23 12:37, Brian Gerst wrote:
> On Wed, Jul 22, 2026 at 2:53 PM H. Peter Anvin <hpa@zytor.com> wrote:
>>
>> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
>>> hpa in To:.
>>>
>>> On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrote:
>>>> Add the volatile qualifier and clobbers parameter to prevent bugs with
>>>> instruction reordering and optimization.
>>>>
>>>> Also check the zero-length case, as the 'repe' prefix does not run the
>>>> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
>>>
>>> Please use capital letters for insns: REPE, CMPSB and you don't need to put
>>> words in '' - it reads fine without them.
>>>
>>>> the condition-code/zero flag, so the result is based on a stale flag.
>>>>
>>>> Those are pre-existing issues found by Sashiko.
>>>>
>>>> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
>>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>>> ---
>>>>  arch/x86/include/asm/shared/string.h | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
>>>> --- a/arch/x86/include/asm/shared/string.h
>>>> +++ b/arch/x86/include/asm/shared/string.h
>>>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
>>>>  {
>>>>      bool diff;
>>>>
>>>> -    asm("repe cmpsb"
>>>> -        : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>>>> +    if (len == 0)
>>>> +            return 0;
>>>> +
>>>> +    asm volatile("repe cmpsb"
>>>> +                 : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>>>> +                 : : "cc", "memory");
>>>>
>>>>      return diff;
>>>>  }
>>>
>>> So this is a fix which should probably go to stable, I think. Going back into
>>> git history, it points to
>>>
>>>  62bd0337d0c4 ("Top header file for new x86 setup code")
>>>
>> >from 2007. And we have carried it this way through the years and who knows
>>> what hit this or not. So please make this the first patch in your set - you
>>> can even send it separately so that I can get route it through stable.
>>>
>>> Then you can base the rest ontop.
>>>
>>> Thx.
>>>
>>
>> Also, this is silly. Instead of adding a whole separate test, just do "test %3,%3" before the repe to set ZF and let the REPE skip.
> 
> REPE does not check ZF before the first iteration.
> 
> From the Intel SDM:
> "When the REPE/REPZ and REPNE/REPNZ prefixes are used, the ZF flag
> does not require initialization because both
> the CMPS and SCAS instructions affect the ZF flag according to the
> results of the comparisons they make."
> 

The point was to ensure we have a valid result in ZF (which should be ZF=1)
even if len = 0.

	-hpa


