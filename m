Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2FC606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UuutKmAE
Received: from list by lists.xenproject.org with outflank-mailman.1490844.1691800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvkT-0001ty-MR; Mon, 16 Nov 2026 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490844.1691800; Mon, 16 Nov 2026 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvkT-0001tr-J3; Mon, 16 Nov 2026 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1490844;
 Mon, 16 Nov 2026 12:23:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSvkS-0001tl-AX
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvkR-000dLZ-Ft
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:23:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaf5d2-2eae-0a2a0a5409dd-0a2a4502c0ea-10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:23:47 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaf5cd-6ca4-0a2a45020019-d155802ab1f3-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:23:41 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so20402625e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:23:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ae501bsm308587195e9.10.2026.11.16.04.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 04:23:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794831821; x=1795436621; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJOpk7UyWJ1WK43qPMbqmJDnQHb5x0UTyukoMygxnj0=;
        b=UuutKmAE+DmYiD0YMGCZrxN7uEEbEv6OQ/sfOxA3W90EVizbm7TwtozLZQDdmjcb9X
         cdqLvU0qkQNSXRt/kidLbyDjFMoHPeLVwBXPFbRJcJ5boV9iayp2As5PDgZFYMU+zeL/
         XFO1XiOsGMRHYIFAqmAEIvrprIyet6oDOTSQuyH4ND+xKQL9vmjUKP+4R6+S/J4M3i5b
         S0Pj6Xlg5IOMZkJzFcS8FdGY4AwoNb5/5FEYBbSS01ZEbZNpTYi98fsaCx+kkRn0gNpd
         YRRxdiIg66He9ytufpjOcKQmi3IiTkxsfuV+RCIV4qbySF9kx2qhM8l3Eo9AcUZ4QImq
         WE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831821; x=1795436621;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJOpk7UyWJ1WK43qPMbqmJDnQHb5x0UTyukoMygxnj0=;
        b=0/HZdybHwJHQEZJvIVBxao7AU8mGJNTvc23GomL8g0ERCG/klrHMQYeSUtKSKkjLCK
         itpK40NnTHhymxmOye5uOzqY1OFBIcL+aFz6dPilvCEefXXKx5X4RznlZhZcEkzf5m3+
         MUxfNfO+AyOE4m0WMYyVHeFSeB1OeufcYIP26Zja4bLk5C4qkHWLUcSFcL9q42O4FNNb
         9j7kr9yhKM1B9Ctn4O/Xq/agvMlwUdmthpX+5JTeyCJgVs1SW8aS2MX+vdAn4H2X/MVX
         FDMBqILXpZer0+rpNCbGv2jA0VlWvIq1auo7drZUZ6gF5nbt196HWwF1qxwklx8cP6h1
         7Z/g==
X-Forwarded-Encrypted: i=1; AL+hErEDiJHcc7SVoGkR3HqVt+eR8acRdZIC2uJ1qKrnR3S257/e94rvtEbg09DShsEHeK4P38Dyl3JPWwM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/O5e7uQDL2KpO1sf7mfZ1b4+kh9g4JTwft9Jd8ZMknne4WkVcY
	oYZH2tnSNW4FYqigXX6mMBpenPOeq5myfzIN14ugRYO+GKHsf7zGVa/LXm2ZlWgsIw==
X-Gm-Gg: AYBFou1gu5aZRQ8Hhc+Bh1oF1grUPOxWhZ6L/ujUAoBI8McWGIXzT3EDPcb83WSY0cR
	Y94aBUGaUTvQYglzcZbSE2A7vkUioo5oMwMuGFdm8Z/jwyVvzHr6VAOn5WUg90lyMcyfBpzzdn3
	yxTWp27axCCjsRsAs3/Md1jNIHg7aRjSV9TiiPbKttOi7OeAjxPsPS2K9uJbdAmMcGG3dLCPQiE
	JtUz5jPwP2XFkLBbhPIzGfG3snbFm5SOkqq9fJ9XLpJNvSKTLD/UdOAo3VDeAOgZCsB/0E0i1Zf
	ZmR26jFh1SuhSXHQyG/lD0IjLmjuLQQlJ/hcp8JndOb5A4sLsiy+z3mdpZOik8bUQzo87ze+Nn7
	cDZA4ByoniiWnqKV+C76bSjEuj9ClyWLOXYa1UtCxYzbOCSsx0YnxPhjF0T7EEIGOofhRT4OoF0
	MP6JBfz3gNXa1UxgQDh46evbop/L6vnOGgJpXksMetR3+XWmjwlk2M+mDtMKC1mFjfz24CoPjvd
	VK1fxhDXQ0fW1EdVP5idx+VEGXqU+JPhWmN1O2zPceFTVGi+xdnAUALaNyrWx44vwmaqPZtV0MG
	zsLcEaZlJeWKYb3nPJQl44udwuGjWTk+d9dpuY9K0Xic0nhvrEkPRaQPLsE1GcKiyN/TFR6kaaX
	Px82EDoenGW3D4a1xiw==
X-Received: by 2002:a05:600c:4f93:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb55ab36famr229615795e9.27.1794831820799;
        Mon, 16 Nov 2026 04:23:40 -0800 (PST)
Message-ID: <eda4ce7e-458f-4c23-802f-862169dcf15f@suse.com>
Date: Mon, 16 Nov 2026 13:23:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set CR2 while injecting
 VMEXIT_EXCEPTION_PF
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261113172444.720081-1-ross.lagerwall@citrix.com>
 <4aed0b50-f224-48f2-97c4-d56ae1ac3012@suse.com>
 <d9fd4604-6a59-46b3-82eb-7737a446b2ce@citrix.com>
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
In-Reply-To: <d9fd4604-6a59-46b3-82eb-7737a446b2ce@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794831821-672B12AC-16390282/10/78276251493
X-purgate-type: spam
X-purgate-size: 1775
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 13:05, Ross Lagerwall wrote:
> On 11/16/26 11:42 AM, Jan Beulich wrote:
>> On 13.11.2026 18:24, Ross Lagerwall wrote:
>>> According to the APM, the #PF intercept is tested before CR2 is written
>>> so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
>>> The faulting address is available to L1 in EXITINFO2.
>>>
>>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks
> 
>>
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>>>                   ns_vmcb->exit_int_info = ns_vmcb->event_inj;
>>>               break;
>>>           case VMEXIT_EXCEPTION_PF:
>>> -            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
>>
>> Further to what you say in the description, isn't this also a stale value,
>> as ...
>>
>>> -            fallthrough;
>>>           case VMEXIT_NPF:
>>>               ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
>>
>> ... the correct one is written only here? If you agree, I'd be inclined to
>> have the description say "... so don't write CR2 (with a stale value) while
>> ..." (happy to adjust while committing).
> 
> In most cases it wouldn't be stale because ei.exc.cr2 is the same as exitinfo2
> and ns_vmcb->exitinfo2 is updated before this in prepare4vmexit(). However, I
> think it may be stale in some cases, e.g. if the #PF was raised by the L0
> emulator.

So further add "possibly" to what I suggested? (If ns_vmcb->exitinfo2 was always
updated earlier on, the updating here could be avoided.)

Jan

