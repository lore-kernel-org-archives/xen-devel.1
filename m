Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6193C433B4
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 09:17:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732916144F
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732916144F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123886.233732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewbw-0003Fl-Tx; Fri, 07 May 2021 09:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123886.233732; Fri, 07 May 2021 09:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewbw-0003Fe-Qg; Fri, 07 May 2021 09:17:28 +0000
Received: by outflank-mailman (input) for mailman id 123886;
 Fri, 07 May 2021 09:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lewbu-0003FC-TQ
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:17:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74b66c6e-be2b-4029-9fb0-70f492ec8228;
 Fri, 07 May 2021 09:17:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0BBDAF26;
 Fri,  7 May 2021 09:17:24 +0000 (UTC)
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
X-Inumbo-ID: 74b66c6e-be2b-4029-9fb0-70f492ec8228
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620379045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDtyuZNsX6fgkwJ7eE+6AnDA+t3eK0Inq7oGPZZCrS4=;
	b=rI6qREDSGhMeOVNXCZdUzXLJKwA4pePvssrU2q7jXfNKdzVvPFHJhlILD2KLB1+XsMS4XX
	02KXJQZUbRaiq+4dpQk5fXlixRG2E9AafjLzPhyfrqavGMc1JjRYRSoFCSzPn3/gxn1ZpB
	uiBmxSq2tfAsylno09/XB1H9MK+ioVs=
Subject: Re: [PATCH] x86/shim: fix build when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
 <YJT4cV62lqFgFKq/@Air-de-Roger>
 <c00c73a5-0d9c-9e1e-20d7-5d65ac23976e@suse.com>
 <YJUDhB1dBVDF8vmd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31ce12b7-b6c0-c8c6-13f3-fbc6826d2810@suse.com>
Date: Fri, 7 May 2021 11:17:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJUDhB1dBVDF8vmd@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.05.2021 11:08, Roger Pau Monné wrote:
> On Fri, May 07, 2021 at 10:34:24AM +0200, Jan Beulich wrote:
>> On 07.05.2021 10:21, Roger Pau Monné wrote:
>>> On Fri, May 07, 2021 at 08:22:38AM +0200, Jan Beulich wrote:
>>>> In this case compat headers don't get generated (and aren't needed).
>>>> The changes made by 527922008bce ("x86: slim down hypercall handling
>>>> when !PV32") also weren't quite sufficient for this case.
>>>>
>>>> Try to limit #ifdef-ary by introducing two "fallback" #define-s.
>>>>
>>>> Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/pv/shim.c
>>>> +++ b/xen/arch/x86/pv/shim.c
>>>> @@ -34,8 +34,6 @@
>>>>  #include <public/arch-x86/cpuid.h>
>>>>  #include <public/hvm/params.h>
>>>>  
>>>> -#include <compat/grant_table.h>
>>>> -
>>>>  #undef virt_to_mfn
>>>>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>>>>  
>>>> @@ -300,8 +298,10 @@ static void write_start_info(struct doma
>>>>                                            &si->console.domU.mfn) )
>>>>          BUG();
>>>>  
>>>> +#ifdef CONFIG_PV32
>>>>      if ( compat )
>>>>          xlat_start_info(si, XLAT_start_info_console_domU);
>>>> +#endif
>>>
>>> Would it help the compiler logic if the 'compat' local variable was
>>> made const?
>>
>> No, because XLAT_start_info_console_domU is undeclared when there are
>> no compat headers.
>>
>>> I'm wondering if there's a way we can force DCE from the compiler and
>>> avoid the ifdefs around the usage of compat.
>>
>> The issue isn't with DCE - I believe the compiler does okay in that
>> regard. The issue is with things simply lacking a declaration /
>> definition. That's no different from e.g. struct fields living
>> inside an #ifdef - all uses then need to as well, no matter whether
>> the compiler is capable of otherwise recognizing the code as dead.
> 
> Right, I see those are no longer declared anywhere. Since this is
> gating compat code, would it make more sense to use CONFIG_COMPAT
> rather than CONFIG_PV32 here?

I don't think so, no, from the abstract perspective that it's really
PV that the shim cares about, and hence other causes of COMPAT getting
selected shouldn't count.

Jan

