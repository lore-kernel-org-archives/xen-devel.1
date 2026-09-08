Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EB3C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:58:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412263.1642807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yD3-0000Gw-CD; Tue, 08 Sep 2026 15:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412263.1642807; Tue, 08 Sep 2026 15:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yD3-0000Gp-9Z; Tue, 08 Sep 2026 15:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1412263;
 Tue, 08 Sep 2026 15:58:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3yD1-0000FQ-Sy
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:58:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3yD0-00AgR2-Tt
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:58:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa03089-8faa-0a2a0a5109dd-0a2a4509d370-12
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:58:06 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0308e-be1a-0a2a45090019-4a7de18caf91-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:58:06 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so5770795e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:58:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm542419305e9.5.2026.09.08.08.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:58:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1788883086; x=1789487886; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FqjIpQ2V7YAmkR374RfNe0WAKCvDu36VQreGuLfgxI=;
        b=c01xPeJEwV/Uz35tA0KgRyEKLnOfaTfxQBcfZ11PZ8pf72UueCogXi63CCa4clYJtT
         /qHZO+68O8Q2gALuY60cF3tKjdFUY3KTyeXZd3MB/e8+GdO8YOQZYeYDzLp06m06nF/x
         Z64hU2qmjRd+Bulq/x6LKbFUdWN5OKkkGtmqb0Xtk77IFp9pOL/P8qpX3lT4M1gojJi8
         56PKB9SxtrUbKJv+Z+H6TP4U96CYKFeFIt1foAGgByp3EdYuFNDB+wpI+0rjDuMEUFVs
         E63oO+fxzqkcl7uZCWw81Yp0P3TVzcDXzo6Gms5VcU7Co0R40bFrxuR1sFSEgI0ujmKZ
         fBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883086; x=1789487886;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FqjIpQ2V7YAmkR374RfNe0WAKCvDu36VQreGuLfgxI=;
        b=nJWy/wVkCwrs9VVdYXdKd56UKcWfR9ZwrEYCc01gtiFE/AYvblS6Hc+gEoiDT2cIgV
         b0J2n1Z8dDY8r9LF95D6IjkVImir4++akbAYkvt1uFT9y7qJn0+ZbLM7FkvzSXCLQ1+6
         1SH+cGRsZOGCf4Z0mFPGwVp3sRavfF2QY7Sde0rhZ9zDLe7oOmoh2zlRaejkZJfGaKyC
         zbWruzSjyzaOM1nrr8/A1FcOCsq/razxtUTttwReRlciI5PiIjoZXSkKSTvG0JufnaKa
         ieRt9hRiGMtDG9DDwHUVNiV5IOVIz/ZuSXtK2aR3+VDToqKYkR/uM6s7m1cAhAB0LKue
         NaYw==
X-Forwarded-Encrypted: i=1; AKwUvBwkNeg8hNfte1K9qosCWXu/eHSUkmaq1bDrpo4Zj91VzqP3jTyQvPAuWu3QD6C0yTmyhRA4ZxTqlrk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lkyrGnKWqdrOfS+U/1ts4aZAeZYDXOY3FaYg7S6zkHeL1BQWcC
	T5sjgbs0rPvBuJVXV144Lbdij+mJWsXt7wKsB0eviRsHcmJ4HP0bBKMNGVtcxkKj7Q==
X-Gm-Gg: AYBFou1XDwhh5u6ErGuEmhmKlBH/qYbVf3mxx2kwzNT6G6BpH1aYad9+bXpoVxIvBOV
	mbKj02eHZGLIpzNdKGWbF/jscogl8LKHgMVEPaPTdUiSbIHOJyihZ8k42zb0752PcsQcCRnKplt
	0PldgHRf1alZJJrk/8odaV9kbOxXsdXBTWq5/zv7pDr0YNvgX9nvmV9QiY0L/dYoU1pQ+IsFTQr
	IoVdMf0IDyHBmMLAlreb2huoZXnQ21FPrqYAC5fQF1/AKXVCPRaIYQlWm3LvNUAjUIlnxmaDwe7
	tUnEAtfVxpZHhi5FKLSmwuHo+f4rSdEk8HdSOrsGvwTVAdOmAi5ThGhezm3uH50wFrPOd8x/fn5
	qF/Ne5w/AIXrsakvrwiNjshXkP8KhyzsEz57zllzSljMhpKQOe+m8AvFZMbJ3Ht4CqB5WwdIjcY
	NETyVHpPtb8CLK3ulYvASJNdZKMkFCAnDO9hYgZJEpheREj2WxFBH5IYhrVipV+5hUFX7cv72D+
	HimGrpoXD8tNXTO+cc/31Lm9w/45rvigkFQLbx2PC8fRw95Zd5V
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr56268315e9.8.1788883086303;
        Tue, 08 Sep 2026 08:58:06 -0700 (PDT)
Message-ID: <c1754399-9ba7-436d-9275-d0887cd649ac@suse.com>
Date: Tue, 8 Sep 2026 17:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Romain Caritey
 <Romain.Caritey@microchip.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
 <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
 <72b89a0c-ad0e-4c1d-97f7-92f49ede7a55@gmail.com>
 <da081e7c-eca8-48bc-b62d-bc84a9c09d7f@suse.com>
 <1788882453.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@vates.tech>
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
In-Reply-To: <1788882453.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788883086-3A2C4034-22CFF9E1/0/0
X-purgate-type: clean
X-purgate-size: 2228

On 08.09.2026 17:47, Baptiste Le Duc wrote:
> On 2026-09-08 17:05 +0200, Jan Beulich wrote:
>> On 08.09.2026 16:58, Oleksii Kurochko wrote:
>>> On 9/8/26 12:01 PM, Oleksii Kurochko wrote:
>>>> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>>> @@ -109,6 +109,12 @@
>>>>>>   #define SIP_SSIP            MIP_SSIP
>>>>>>   #define SIP_STIP            MIP_STIP
>>>>>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>>>>>> +#define STVEC_MODE_MASK            _UL(0x3)
>>>>>> +#define STVEC_MODE_DIRECT        _UL(0x0)
>>>>>> +#define STVEC_MODE_VECTORED        _UL(0x1)
>>>>>> +#define STVEC_BASE_MASK            (~STVEC_MODE_MASK)
>>>>> Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
>>>>> this patch (only STVEC_BASE_MASK is). Either use them where you decide
>>>>> exceptions always target BASE regardless of MODE, or drop them until a
>>>>> patch that needs them.
>>>>
>>>> IMO it is fine to introduce *_DIRECT/VECORED here as they are used 
>>>> implicitly through STVEC_BASE_MASK and thereby it will be better to 
>>>> introduce them here now instead of open-code them and then just update 
>>>> STVEC_BASE_MASK again when *_DIRECT/VECORED will be re-introduced.
>>>>
>>>
>>> Oh, sorry, you are right. STVEC_MODE_DIRECT and STVEC_MODE_VECTORED are 
>>> really not used here (in this implementation). I planned to do:
>>>
>>> #define STVEC_MODE_MASK (STVEC_MODE_DIRECT | STVEC_MODE_VECTORED)
>>>
>>> But I missed to do in that way.
>>>
>>> I will update the defintion of STVEC_MODE_MASK in suggested above way.
>>
>> But that's yield a mask value of 1, when you want it to be 3. That ORing
>> together looks bogus to me anyway.
>>
> Yes I agree. It might be enough, for the moment, to only keep #define
> STVEC_MODE_MASK _UL(3) and drop the others defines (even STVEC_BASE_MASK as Jan
> mentioned the comment in the caller is already precise enough).

To me having STVEC_MODE_MASK without at least one of
STVEC_MODE_{DIRECT,VECTORED} would feel odd / incomplete.

Jan

