Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24F606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Kxp6w5fW
Received: from list by lists.xenproject.org with outflank-mailman.1494267.1693892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdMI-0004N1-BQ; Wed, 18 Nov 2026 10:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494267.1693892; Wed, 18 Nov 2026 10:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdMI-0004Mu-8c; Wed, 18 Nov 2026 10:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1494267;
 Wed, 18 Nov 2026 10:57:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTdMH-0004Mo-71
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:57:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdMG-0049wP-Bm
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:57:44 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd84a8-e002-0a2a0a5209dd-0a2a4505dffc-0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:57:44 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd84a8-4cb1-0a2a45050019-d155802fe014-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:57:44 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so9162815e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:57:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78418853sm194030655e9.8.2026.11.18.02.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:57:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794999464; x=1795604264; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmvB5A4LAdiuMU9it+7Y6Pb8tYCNsRMJEXEdeAWdXV8=;
        b=Kxp6w5fWus4AN+62SxuoooCyr8WVf5BFN1NcYwkc7MZn3WsBd1I14f0iZMSWpyKfBP
         /psGyo7R6R1TzZUjV80Ce+jFRnWClbYTiRlu3i6jSoIbgb0tQA4MSCq8V+Ll6amOxiwO
         XtOMWihBhoQHPRnXcb/VrYKLZuSNxj01+LexdbbtgBgPTUVW0uhvuDQZQnFbuc7sX6OV
         U2EEVGyPj/aWW0U3Bkaajo+tTQZLDQUMJTDEYN4imtvtMsz7XEXcfGrSn8KlCfDGTkdo
         Ol/iCA+rOwO6uimc7700FppfQl+821yPWs8ncvEBx/EIlELygqt4T7l7BFJn58J8FLvw
         otJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999464; x=1795604264;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmvB5A4LAdiuMU9it+7Y6Pb8tYCNsRMJEXEdeAWdXV8=;
        b=gzROS/subC9Li5gUOd+Gs/5R6CkA88F8ZekOrToLziPLhM6htEyaAR3zzn8Ah0lGyF
         Rflnje0V64mxcgxzeeZNxWUKd4O/yN2ojgA6SDLWIuahAAX9c60wKTUjTG3NTmDqZEQB
         5ZK3SzFQs3osoX+L/xDouvd1PkwSBSHYhVpTN22q2svtFX6TcrBZnivB/Ns/Uh0QGjVl
         3e/GcM9C2GpGJM6neFMQTQhQJSddCVaERfbzxtw/Ok/58c9dkj/yMyp/PtMDkQ14AhAU
         aXghuVLVY4424+z3B+/O6eVqqZ/U9UqC9BsZhmKyt6OXVo5+NSXpTm0pYedvayo3S+fS
         jaUA==
X-Gm-Message-State: APuU4Z+5mRryWu2le3hV6YqPS9hrhsAIsU6IEQC+w5koApnDh79lJhm1
	6tr/QvoKWfI4c5P3ERKXDoan8I38wFBCWma9ZX1OIVAFN1fb1p6L0SrH65LeyIlopQ==
X-Gm-Gg: AYBFou1Dl2VFn9Jeq3a8YOjSgRKdHYdqC/ucNHaXMPixtgDMIrLYPu/Szvq1+XCeXns
	aexVEZt9sGXeSmPEP/p2SgP4Oy3DxOKL8mWZbeDPjLtjwWHxpaSr31B7iZArQXUDFYB0u5z/Hdh
	IB5Wnp0nFRkEW6XvhCajmj7RaPRbsUCjZy9sICjKoaaRksaZZwdRtzLcNkzuEkTS/qRnGDAtFcb
	Ut++21kOxPPQEFrU13FGGPewzq0BALt44fP8WHXy2jb0RwzycdRC8ofFeu9CDqk2WKk09CIlAri
	fA16CQdJsfvovN0bNozebixpPBlEbcs3rHrERqSf//rODJ/zdlQrRKcfgjtbk+uG46zs9kc8bSi
	j3IB/fBm06eWxcPjDuWh8Gkkgn5ng45/SpiWjzR75gzlUaQ5kcjD+cRwEvk9XdK8lFPP9HBt5lq
	wHzvCc7IOUqTXExTs+kPzZZlUoz31RtjVsU1SS/YVVJxfWrrRtm0efW9Lin6KxeWNxKMnrz/IdU
	7hIRPxYOaETBE0lQla3vqdw9v5ghzcLUgLWwB4SFkvszYQsvR/tU4IHxqbjNWHFJjCc4lgevEyz
	A0YmMUTpp8NrudjpLtmy6q/RtOYBHvrQY9uC/r3GzMH9FGMUgRLLFkjbWn5PJVnXw9Sgl9g9BJt
	W0WGoHX7pyAPzq2BM
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr42701825e9.21.1794999463753;
        Wed, 18 Nov 2026 02:57:43 -0800 (PST)
Message-ID: <09ed219f-5b4f-45f3-944a-b65c446d3274@suse.com>
Date: Wed, 18 Nov 2026 11:57:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/42] xen/riscv: introduce csr_volatile_read64()
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@vates.tech>
 <cb819638-8a44-4485-8e50-9c1408f9ef28@suse.com>
Content-Language: en-US
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
In-Reply-To: <cb819638-8a44-4485-8e50-9c1408f9ef28@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794999464-24D1E2A1-DC12C2F4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2723
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 11:49, Jan Beulich wrote:
> On 18.11.2026 10:50, Baptiste Le Duc wrote:
>>> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
>>> the halves with two separate instructions isn't always safe: for a CSR
>>> which hardware increments, a carry from the low half into the high one can
>>> happen in between, so a plain pair of reads can produce a value the CSR
>>> never held. Therefore the high half is re-read and the sequence retried if
>>> it changed in the meantime.
>>>
>>> Only CSRs which change under Xen's feet need that, hence the name. The
>>> majority can be read with a plain pair of csr_read()s, so no helper for
>>> those is introduced here as there would be no user for it.
>>>
>>> Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
>>> uint64_t. Otherwise get_cycles() would still truncate the time counter to
>>> 32 bits on RV32.
>>>
>>> No functional change on RV64.
>>>
>>> Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v4:
>>>  - Take the CSR name without the CSR_ prefix, so that the macro parameter
>>>    is used as an operand of ## only (MISRA C Rule 20.12).
>>>  - Drop the (void) of the ...H constant on RV64.
>>>  - Initialise hi_ in its declaration.
>>
>> Jan gave his Reviewed-by on v3. It is gone in v4. Dropping it may be
>> fine given the macro rework, but please say so in the changelog :)
>>
>>> [ ... 45 lines skipped ... ]
>>>  #else
>>>  #define csr_write64(name, val) csr_write(CSR_ ## name, val)
>>> +
>>> +#define csr_volatile_read64(name) csr_read(CSR_ ## name)
>>
>> Nit: On v3 Jan suggested "#define csr_volatile_read64 csr_read64", and you
>> answered you would then move csr_read64() into this patch. In v4
>> csr_read64() still only comes with "xen/riscv: implement vCPU context
>> switching".
>>
>> On RV64 I think it would read better like that:
>> #define csr_read64(name) csr_read(CSR_ ## name)
>> #define csr_volatile_read64(name) csr_read64(name)
> 
> #define csr_read64(name) csr_read(CSR_ ## name)
> #define csr_volatile_read64 csr_read64
> 
> i.e. matching what I suggested earlier. Otherwise what is passed into
> csr_volatile_read64() would be macro-expanded before further
> expanding csr_read64(), thus prepending CSR_ only to the result of
> that expansion. (In the common case there'll be no difference, but
> things can go wrong if some unexpected new #define appears.)

Oh, and - happy to fold this in while committing (perhaps with an adjustment
to subject and description), if you agree. With that
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

