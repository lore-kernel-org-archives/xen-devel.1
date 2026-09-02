Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9BEC624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:27:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406001.1639437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lvg-0001PX-Te; Wed, 02 Sep 2026 14:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406001.1639437; Wed, 02 Sep 2026 14:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lvg-0001PQ-Qg; Wed, 02 Sep 2026 14:27:08 +0000
Received: by outflank-mailman (input) for mailman id 1406001;
 Wed, 02 Sep 2026 14:27:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1lvf-0001PK-Dd
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:27:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lve-00BmMc-AU
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:27:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a983235-bab6-0a2a0a5309dd-0a2a45039bb4-10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:27:06 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a983239-fae8-0a2a45030019-d155dd2aed71-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:27:06 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1110275f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:27:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee08e0dcsm3125585e9.5.2026.09.02.07.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 07:27:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1788359225; x=1788964025; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uUZg+nGoOHw5M9J4hVqatta8vcUweqR+Ea7r4gWW5U=;
        b=O1Zc1TFNcw1UC4emTY8VmzyK7eEobJYqMhOVVa+nvoMoS5KAOgIoXoRhn/5L1YSSnD
         eEqu46h3mZp5akIItEAVpul3eB9b7zVMv1vrkEtfFIFhUfp8YVvXEscPpqAK4hOF4shR
         wb+S/c2TO3mNbtG4jal2jcRn5di91odXqrKfvFSOXjIEO6d3F1jzgUqfWLPN2tfX8ZrR
         rnRNN7ol7KUyiiGHbBdOlJbBockaMpYPjsypK+Xo56EhqkMNjH8/JLhGbJS4cDgQcU3H
         snVQvrEl1sIdiMcNT2HX8Hdx0i8AcJPFPGc6fGzMbl57K0h7aacmrE3fO5VlRUv2kAHb
         LsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359225; x=1788964025;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uUZg+nGoOHw5M9J4hVqatta8vcUweqR+Ea7r4gWW5U=;
        b=mKjIvicM+epntkQmDKx5ulFdpFjyKOL8KoEYBkdqY5ulXGvQ1LOfBHCq+sAJAKF0l6
         FEmsH5ydbXd17EbrFErDEPJl0xiADpk9kclz2ScjCJBSKJJ32p3qtgBRc99d0JAfzemS
         CE8uNYjiLADHHJhKpdIKhe0SMtYmxGYudUAkZKsXhLzIAbhjkRNFl1NwI85uXTB16ttS
         V+e2pgXm4wBqf6MtftfRjxQm1ngp5s61SgRWGmeKko/2QCawRKZ/b84YhCCfZE3IuOLT
         EuEfUJOCMExptzFs9hHPZMVu9OeSkzVs+p1cFOmohx5pZd1dTtU6fKZOx8vSk/DvP54K
         Lx+w==
X-Forwarded-Encrypted: i=1; AHgh+RolZgtm3TSb8By/Q0DcxXdSatRvi0LQKNC6aaze0d2ImU3LkN68eym3PJJa7s9UqEniraZCPTIAyjE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lX1MTdoDhltOv8Wm6pJAKxtf1inGq2eZs44eeYJa+VtBJ79ReF
	nKqlUXvF+r7lVXPPyqFsmyrDlJ4VkT/uUO1c5SKkimjoxlONO2BpuuLGk1I/nRAguQ==
X-Gm-Gg: AR+sD13PncCTBQCOJVr9bMhwN91Sr4tex13fvpEgYFzRnPTNmRPj2N67S6MU9yVSox/
	Eu4hybelDBYKGkpJsLbWIGgXzYlbglDa2bCnpdnYt3OJTuGh/RTCafvDLcbuBh6uWbIhewRdEd8
	2wc0FIhx7+khaxZIa388Ejc4YjZpMRV9LngR/t/1+naznGQ9NpgHKuZFmYvc+vyMA4XMEuuo6bM
	OrL/u32K0TUywlJH/5ds2ZpRG5keTGZVXSFV1thI0qVtyeyW+hEQqnF8jrWlxqQXXQKGX5uWxWK
	XBHqz6SNdJeuIytzeB19TO8ZjvHvdfd/CQLO3vIcev36GKiro5KLuOM+BpFKwmkdT5OY/32quEd
	ajQYNH2uIBIT2vDTnh8ygxwXE7UrTBlQbug8QiQ/pRnhsfQvK1ZH1gPJVEZIlaTEU8F/3WrHGeu
	cha8LnkzZvogMfXmykrfYT8d4I9J+bpvYnkLCQglTbDaDbLepmlfVoetcbZnXIXLMHDEYUeQOkj
	rd3ep8usd7jBaqnTdv2+3XhPo2R0t/lrCZ1mLz/hJBXMl1J902Q
X-Received: by 2002:a05:600c:c170:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49ce57f072fmr117230545e9.8.1788359225436;
        Wed, 02 Sep 2026 07:27:05 -0700 (PDT)
Message-ID: <dd883314-5be7-4a17-b178-d366809a1c78@suse.com>
Date: Wed, 2 Sep 2026 16:27:03 +0200
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
 <3b07e1c6-eee0-4b54-8bd5-fce8db4ef726@suse.com>
 <21e80092-5abf-427d-87d8-cdbe58874a10@gmail.com>
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
In-Reply-To: <21e80092-5abf-427d-87d8-cdbe58874a10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788359226-74A894E9-89DDC8B3/0/0
X-purgate-type: clean
X-purgate-size: 3642

On 02.09.2026 15:45, Oleksii Kurochko wrote:
> On 9/2/26 3:02 PM, Jan Beulich wrote:
>> On 02.09.2026 12:48, Oleksii Kurochko wrote:
>>> On 9/1/26 9:01 AM, Jan Beulich wrote:
>>>> And then
>>>>
>>>> #define INSN_16BIT_MASK			0x3
>>>> #define INSN_32BIT_MASK			0x1c
>>>>
>>>> are really named backwards, seeing e.g. their use in
>>>
>>> It was derived from OpenSBI project and I haven't paid enough attention
>>> for these defines.
>>>
>>> Now looking at them again I fully agree that names here not really
>>> correct. It should be according to the spec:
>>>      #define INSN_32BIT_MASK          0x3
>>>      #define INSN_48BIT_MASK          0x1c
>>
>> Especially the latter would then still be misnamed, as the mask merely
>> identifies insns >= 48 bits. Even for the former I'd still question the
>> name to some degree ("mask" doesn't mean all of the bits need to be set).
>>
>> In how many places are you going to need these constants? If, by suitably
>> using helpers, it's just one - maybe better to get away without any named
>> constants in this case (i.e. when suitable names are apparently difficult
>> to come up with)?
> 
> INSN_16BIT_MASK - will be used only once (except INSN_IS_32BIT() and 
> INSN_IS_16BIT()) in insn_fetch_faulted() introduced later in this patch 
> series:
>          di->insn = htinst | INSN_16BIT_MASK;
> 
> INSN_32BIT_MASK - is used only inside INSN_IS_32BIT().
> 
> And INSN_IS_32BIT() and INSN_IS_16BIT() are using in several places.
> 
> I am okay to drop these masks and then just have a comment:
> 
> /*
>   * Instruction length encoding helpers (see RISC-V Unprivileged ISA,
>   * Section "Base Instruction-Length Encoding").
>   *
>   * - Instructions with bits [1:0] != 11 are 16-bit (compressed).
>   * - Instructions with bits [1:0] == 11 and bits [4:2] != 111 are 32-bit.
>   */
> #define INSN_IS_16BIT(insn)      (((insn) & 0x3) != 0x3)
> #define INSN_IS_32BIT(insn)      (((insn) & 0x3) == 0x3 && ((insn) & 
> 0x1c) != 0x1c)

Largely okay; I'd still prefer

#define INSN_IS_16BIT(insn)      (((insn) & 3) != 3)
#define INSN_IS_32BIT(insn)      (!INSN_IS_16BIT(insn) && ((insn) & 0x1c) != 0x1c)

> As an option we could come up with the following names:
> 
> /* Bitmasks for instruction length encoding fields */
> #define INSN_LEN_1_0_MASK        0x3   /* Bits [1:0] for 16-bit vs 
>  >=32-bit */
> #define INSN_LEN_4_2_MASK        0x1c  /* Bits [4:2] for 32-bit vs 
>  >=48-bit */
> 
> #define INSN_IS_16BIT(insn)      (((insn) & INSN_LEN_1_0_MASK) != 
> INSN_LEN_1_0_MASK)
> #define INSN_IS_32BIT(insn)      \
>      (((insn) & INSN_LEN_1_0_MASK) == INSN_LEN_1_0_MASK && \
>       ((insn) & INSN_LEN_4_2_MASK) != INSN_LEN_4_2_MASK)
> 
> But it seems the first option still looks better.
> 
> Would you also prefer Option 1?

I do, yes.

>>> I think that for now it is enough to go without common implmenntation of
>>> INSN_LEN and just return 0 as suggested above.
>>
>> Suitably commented upon that would certainly be okay with me.
> 
> The the following comment looks good enough for me:
> 
> /*
>   * Length in bytes of the instruction whose first parcel is @insn: 2 or 
> 4, or
>   * 0 when the encoding is 48 bits or wider.  No ratified extension 
> defines an
>   * instruction of such a length, so rather than open-coding a decoder for
>   * encodings which cannot legitimately occur, leave it to the caller to 
> treat
>   * the 0 as an illegal instruction.
>   */
> #define INSN_LEN(insn) \
>      (INSN_IS_16BIT(insn) ? 2 : (INSN_IS_32BIT(insn) ? 4 : 0))

Reads okay, thanks.

Jan

