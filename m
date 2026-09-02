Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77667C624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:02:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405875.1639316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kbl-0001Kt-OR; Wed, 02 Sep 2026 13:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405875.1639316; Wed, 02 Sep 2026 13:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kbl-0001Km-JJ; Wed, 02 Sep 2026 13:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1405875;
 Wed, 02 Sep 2026 13:02:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kbk-0001Ka-5V
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kbj-00BgUE-IL
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:02:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981e60-e002-0a2a0a5209dd-0a2a4505973e-16
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:02:27 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981e63-4cb1-0a2a45050019-d155dd2bc10e-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:02:27 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so656201f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 06:02:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492cdc37sm6820642f8f.34.2026.09.02.06.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 06:02:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1788354147; x=1788958947; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ag0JmfDwxevGBw5kL139Z/6F+5N/7/FNh63AC6xHi7M=;
        b=grKq9ebw6fza1NEyA4vR0bOzIMHHlPhIcQpKoM4mVBXTonuJBr/uNlaX5mxqEhpAun
         x5mlU/1XRF9p5kIYjZz4cxANLCmBPkcjQK4CzThb81eUaHFNF17OlIGDviBquGqw5pRu
         Mq20/4utQFHRMhxZJxGQLxzaO3oeh4B/X/lQ/b3LL8L2XrlpLC1YXiNW5LgJSSosq4gR
         XbB0GOO/hi1lALHjZmPFPC6KUFYOQdjatKP07rOnohGdvv2w7LOmdPJVovLky49bIXVG
         a6DYx8KezgcwHYhn90/IfCqr5E95XFS+JQuo01zHlO/dB5yIx4kjdgHoJqk74SqMbt9t
         p91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354147; x=1788958947;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ag0JmfDwxevGBw5kL139Z/6F+5N/7/FNh63AC6xHi7M=;
        b=a/goiUW+7sqo7tNhWmQEwJf0jGgkknCtUV7Xo38JqKrvHT1HEzKxTUFwPTksnLcQvF
         mxTsKyeecBdUBo4OVZ7Mxy042vmvuIlopNtrf4v8F4QMknTjeqa10UvW2viPoLD6rL+X
         PL883JmLj1grXIwZ+32imWVNhx2y8+wbPL+/c998H2KjFR921xELdAXMydFXAZsrlRD5
         0La+u5MkmeipsiQRopGqVhpHOhggAEOugubBWaT8P6H6qtW4Og5UYO14OO6EsHLfa9Ba
         MESMVekuRVzzCMTa95upAUlY4da/eytIBkXk+1oKmhgs9K2keucbsRTqn4HFkI/GlPbv
         eACg==
X-Forwarded-Encrypted: i=1; AKwUvBw5MHNhH6AxiInkJ93Yaf4bYxl66Kl97n2segRQY2FAnMQC9Ib1c4CXRExiU4x7nVzNJnCKM9eiBf0=@lists.xenproject.org
X-Gm-Message-State: AFuF++n5JCJZaNsNxUwS9nNfjiXgAVZSbvafUiwEvuZti15koru4Euyq
	ZK0aot4g5K5K1cSFrlfWXvQ2IGGV+dCvKasITuPRg6S/UYFr8EpyQ4qpG5KsluoN5Q==
X-Gm-Gg: AYBFou3XR1OkD4nlH+lM5iX1Fe+e56NMRzoL3A8NYT7dQjqD7CUfzr7jIhwFV8WFUGr
	NOVmX2FqNJQdxr99X9T31TZEF230DBJc+ZGq3tFG8YlLlROijLugBGhT/Ed1Dp+GQncnw+eBhOo
	2DJIhiDGaCgB0s4tAa0yVBeSWuGPZXOXR7DGYBzkgQuHCqQa8+wzCbTzUoTzsft5NuhkGoaL+Bg
	h1fDDwmurF5HibalOgp8vkY0Ei/WK2E7417+nI7NL2DjSdLlxNUwYgI7EUsokyz6yUyVGNeZLOR
	g3dErx2Cg+VsMqS6cp1QzIDVNW8maj82kCrNnWmGGqfNABznkznUT0E7Pr+fsQbXHZLMDtCdKqe
	4v9ttimQwSS5JmvqffuTd8VFaFdqljT8AhWY0OUQqODov04kUeAtdDFOwy1PZ+X3H6nFfXH78G6
	XmkyZr6xwtVmTcMIfJJuG8zqFaN/sA/Sl5ZL/EpOyisSq9QlqNPZD7nQXfn3REN63Mszdo/LTai
	UAz9uFYxy3LgENTIAYcopyJ8mHBLxrcrJpdI9w=
X-Received: by 2002:a05:6000:2282:b0:482:e62e:a528 with SMTP id ffacd0b85a97d-48488f0e579mr9711622f8f.12.1788354146362;
        Wed, 02 Sep 2026 06:02:26 -0700 (PDT)
Message-ID: <3b07e1c6-eee0-4b54-8bd5-fce8db4ef726@suse.com>
Date: Wed, 2 Sep 2026 15:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction
 length helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
 <fba838ed-b6a0-4cef-8dcc-8b5d1f8a8aab@suse.com>
 <5d8888f1-d6f6-4f73-812b-8a79edceed95@gmail.com>
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
In-Reply-To: <5d8888f1-d6f6-4f73-812b-8a79edceed95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788354147-24F1F2A1-F2848AA4/0/0
X-purgate-type: clean
X-purgate-size: 1217

On 02.09.2026 12:48, Oleksii Kurochko wrote:
> On 9/1/26 9:01 AM, Jan Beulich wrote:
>> And then
>>
>> #define INSN_16BIT_MASK			0x3
>> #define INSN_32BIT_MASK			0x1c
>>
>> are really named backwards, seeing e.g. their use in
> 
> It was derived from OpenSBI project and I haven't paid enough attention 
> for these defines.
> 
> Now looking at them again I fully agree that names here not really 
> correct. It should be according to the spec:
>     #define INSN_32BIT_MASK          0x3
>     #define INSN_48BIT_MASK          0x1c

Especially the latter would then still be misnamed, as the mask merely
identifies insns >= 48 bits. Even for the former I'd still question the
name to some degree ("mask" doesn't mean all of the bits need to be set).

In how many places are you going to need these constants? If, by suitably
using helpers, it's just one - maybe better to get away without any named
constants in this case (i.e. when suitable names are apparently difficult
to come up with)?

> I think that for now it is enough to go without common implmenntation of 
> INSN_LEN and just return 0 as suggested above.

Suitably commented upon that would certainly be okay with me.

Jan

