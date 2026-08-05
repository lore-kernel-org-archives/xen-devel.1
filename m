Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B951BC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 06:49:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382860.1626134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVRO-0001fj-Lx; Wed, 05 Aug 2026 06:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382860.1626134; Wed, 05 Aug 2026 06:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVRO-0001fc-JN; Wed, 05 Aug 2026 06:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1382860;
 Wed, 05 Aug 2026 06:49:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrVRN-0001fW-Gh
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:49:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrVRM-0063uC-BP
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:49:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72dce3-bab6-0a2a0a5309dd-0a2a450cbd62-46
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:49:24 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72dcf4-f479-0a2a450c0019-d1558036b104-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:49:24 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso2926475e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:49:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e9ad922sm24994565e9.4.2026.08.04.23.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 23:49:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785912564; x=1786517364; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jhv8pkezYCrgt9JiHXX1n8n4He1/X32jhyGT/X0o+E=;
        b=Sfd40lHvtRhfDwYrXlZw0jnPuVYono3VgNH5zStwyWBfDHbkVX7ht/rlWQ5kyTgwoT
         oJKDPaoBWKgwGAm7qNeLNjYZzN4/qg0gLQYA5ImNWFdgAL5T9td8N48tG5YK8moGvTNH
         uGVQ7DJVSvi/WxXK1VKuf/k7DqQ7G5uI8eEC5mIZtSK2LyUzxYYr5Ma0wostFDjPJoDu
         BUsQgVxekE5xzc7YgZLQigjcnHeVNByLcHEc9Dfzqp0UZ679Kusy64osNT8uraTSJSvl
         WsKyPpiBGhBjm0LBGzQmBS7a8mG1cxtnu9XX7EH5wzMMNN4LETanT3aW85YykRRu/LCI
         e4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912564; x=1786517364;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jhv8pkezYCrgt9JiHXX1n8n4He1/X32jhyGT/X0o+E=;
        b=cQXSFmelzG/qLPifqvUEys/cg4WU7TY+RpXO3xqzohRyk3ecxtF8iiIx5uzicNLqjf
         FElksV5sqxsFpHAULmuukvkOupBN235u0npUmv/xNTsmVX2xh11wxn1HCEBOtpLGoduA
         5Hs5pbFmQ2xwUpv5K7Vug07HpHC+N04YvHVi9bykiJgtTgo/HvTyd1k+zbjZSXUnapQO
         kExMElS3Jk0IhkoD6rxQAFQ6iecsLr+8julcWCzt9Jn1EHYDELzwLenZxMMng/ZtPlXv
         xB73PhwhjBVFBb0VwusDZEsoAtfaVbnFq/5k/1aBhZJZ49cSajnHqsW4/nxOKk+/pDJC
         PsdA==
X-Forwarded-Encrypted: i=1; AHgh+RokGE/voe6uD6z8Hc2RQbMpJMUuW7DC56/e7/EqCtO1b7pxpgz3Sn9+GB6OqjUy0mPabkxeb3n5ac0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwR/aCY0zZ9BgghIwFDrQ5wpw9a0x8ECksHVzKXxTuItdw1k2tK
	lko5SQuIzDjhU3EG+oZ5/spMXZirXnL9oDPMrbKrNzezWrpncKk/G4dCDQ9aF37hhA==
X-Gm-Gg: AR+sD108WU3JhUscCWr6153TphdVGQat9eWNmPy69AGa79jFdHT8k/UGZyDUYDExOO9
	7ZXJPpTLnRtFsHzASjRlfDMxrHbEowNQCYRLhQ+j07b8N8a+4l5DmEkysX3A/mM4APk/6httlxE
	GrFOXAS/QHFuhGuO1uMmHwtaglUPTmt+BcYXaUI0iPbagk1aq34tBfuJf6CpgTiAPsaC8n3X5AC
	nqIucmeZyp+6YANIaobiz3Vzz2vJhcdJ7JUwIoAbLQ7ANwMtNmRxUg8iiNKiOgn4TBCynGL2F3e
	wYmbwbEaxIhfVW01EKqua3TucltCptvcEB4GdYWwo/MB2W/F6OTbvU5GQ/DyahONYmFOBq2CLAt
	nuKhKVmednotkw7y261chhirXYKuwr6vetHtMszM48pr6X0nHq1QEYHcqmuxMjMvrb5vQ6xmPp6
	sgzpn5trVKpfnCIV3AMKoryWl3C4IMCB6HKz9JOFAEiwGDt5BxQTFYzN8027DeDIkFwO2z7htXB
	9Fd8/NoeCdHR5+dgw9PfIwy/Y3kdCw0WJvazkd7GfX6VhPUkcGu3X/901w+QD0=
X-Received: by 2002:a05:600c:1d10:b0:495:7a23:1eee with SMTP id 5b1f17b1804b1-4994e7ba86amr37703665e9.12.1785912563813;
        Tue, 04 Aug 2026 23:49:23 -0700 (PDT)
Message-ID: <3ff21b60-fc6a-46f9-94b7-89393cd77933@suse.com>
Date: Wed, 5 Aug 2026 08:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-3-andrew.cooper3@citrix.com>
 <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
 <f15222a9-1d61-4d9c-b923-8e6ad4994af3@citrix.com>
 <cd877869-3d53-41e4-88b3-df629e4dcbbd@suse.com>
 <5d62cfe6-3d97-44f4-9a5f-94b77514b6a3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5d62cfe6-3d97-44f4-9a5f-94b77514b6a3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785912564-01CC3A5B-E8FA380B/0/0
X-purgate-type: clean
X-purgate-size: 1469

On 05.08.2026 08:34, Andrew Cooper wrote:
> On 05/08/2026 7:04 am, Jan Beulich wrote:
>> On 04.08.2026 19:13, Andrew Cooper wrote:
>>> On 02/06/2025 10:57 am, Jan Beulich wrote:
>>>> On 22.05.2025 17:00, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/alternative.c
>>>>> +++ b/xen/arch/x86/alternative.c
>>>>> @@ -20,7 +20,7 @@
>>>>>  #define MAX_PATCH_LEN (255-1)
>>>>>  
>>>>>  #ifdef K8_NOP1
>>>>> -static const unsigned char k8nops[] init_or_livepatch_const = {
>>>>> +static const unsigned char k8_nops[] init_or_livepatch_const = {
>>>>>      K8_NOP1,
>>>>>      K8_NOP2,
>>>>>      K8_NOP3,
>>>>> @@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
>>>>>      K8_NOP8,
>>>>>      K8_NOP9,
>>>>>  };
>>>>> -static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
>>>> ... the (at least visual) connection to ASM_NOP_MAX. Could I talk you into
>>>> adding build time array-size checks for both arrays, to restore the
>>>> connection?
>>> Sorry, but I have no idea what you're asking for here.
>>     BUILD_BUG_ON(ARRAY_SIZE(k8_nops) != ASM_NOP_MAX);
>>     BUILD_BUG_ON(ARRAY_SIZE(p6_nops) != ASM_NOP_MAX);
> 
> The arrays are 45 bytes (and elements) long.  ASM_NOP_MAX is 9.

Oh, right, sorry:

     BUILD_BUG_ON(ARRAY_SIZE(k8_nops) != (ASM_NOP_MAX * (ASM_NOP_MAX + 1)) / 2);
     BUILD_BUG_ON(ARRAY_SIZE(p6_nops) != (ASM_NOP_MAX * (ASM_NOP_MAX + 1)) / 2);

Jan

