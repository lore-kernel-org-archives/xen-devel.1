Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5980CC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:17:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406857.1640030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25R9-0003EN-F1; Thu, 03 Sep 2026 11:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406857.1640030; Thu, 03 Sep 2026 11:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25R9-0003EG-C8; Thu, 03 Sep 2026 11:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1406857;
 Thu, 03 Sep 2026 11:16:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x25R7-0003Du-Mp
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:16:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25R7-005xcK-2w
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:16:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995724-2eae-0a2a0a5409dd-0a2a45049168-2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:16:53 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995724-b57f-0a2a45040019-d155dd29a5d9-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:16:52 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so1272964f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:16:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e80020sm13488309f8f.10.2026.09.03.04.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:16:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788434212; x=1789039012; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/5sLZ+lEb+ymYx9Ze2ITygxwf4YMxk0A3rsQUdNBG4=;
        b=NfrNatvOcDzwf4L8UVE9E05xvdUQy+HjVkAJ3zUUe8a8D4930RjMW933KP5qXON+fY
         PA41SqxBnKui7ZjpBQGUVFk9KdknSJS+epWfIhYMxSBxxNgksbEjWPHXdMMGUdPDnVOW
         C6Yr6UJK6Ccsmy1V1o5/XSfXJD6dyGpFFRUBhI6YftojC4Kx6kg3Et3Vo9CxfjoLSUh/
         9Gi7FexJWYcb6TvZwpoLO5QbiGzWNwFXmAT8o6aXQpeQVI+fkNw1C4ukXlw47zQmpYo3
         nEfQqMYnXuOFrC5IF6cQzeoyippACegSnHaqTD0vb7ekp9n83nzb5B4dIJhOi0wuWbZo
         jh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434212; x=1789039012;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/5sLZ+lEb+ymYx9Ze2ITygxwf4YMxk0A3rsQUdNBG4=;
        b=pYiOmuGrJUEkGkta6ZxerWVjjAf2ZDlcprrR/mM9EJ1Vft7M2EwqAf2He+yCjIYchb
         Ax44FdZv0iXpARWRitzHDZylNMgZw/sIycYPXMwVSX1rqvlCa+wHkbQy/P1Qi+h+Ut/w
         oh5Pm6GhN0sl7PiTDeWtcA4PHkH2JT9qIWS4SxA6YxVTypx/9QKTFZHBwFwZpJCbHIuq
         iJE6jVmwqTRJHA1Sp/pvfRY5K9goV06HuDpzB/s797kPzT8nNExj9grTdv4DbOBGkheT
         TvXDWHWkukJYzL9ykPIIqIixYKLjztmRuoosRb0c9qCgyo79OpQCE0vzLv5paUpDEGNU
         Lumw==
X-Forwarded-Encrypted: i=1; AKwUvBynOHcwwgFOtIR2Bn7sJCfdLVFLlYA4wNdA1Qrwmz4mkP8wMhTEyfDoHho3qZWLY5DfIbX3ivkM5xY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nYd34PPFZ5rzjDsi/8uw8cuRFUSc03xlDMB5fUYQkCGj4mLNHC
	oY7SQtcwdvdwqADQFdS57FGqoUf3DBEsKxs9YKW3rTvI0aeQWN4682Cm+3owvFdbZg==
X-Gm-Gg: AYBFou2gdPeS+wNWKYg5BsCAT/1dgZTSOblcJqANObLr3Yj1d6xjXBMXM6P2CJkPBA3
	6cAXbFBv9MGkZ9tavbw4KGQW5bU+Y7jNInHg+mYSVRyfEQcEIHMckL4L1Lu4rKqdZLNoTCOIfgK
	PPb4CowYkSvQmtOctD4WNC5zgV/mKHzLiza8YyKoTIKmKCPHa7LcV7wBm4gVe//pKxywq0al1Mz
	wKViOv1agMz21oUbBIY5hVtGClooHT8JxZHc1M0ZKrQ5njzQXWx38fXAyg94cUF6cdUTBV0Bpkf
	hTU1ddZeAfNmLEP7vmj6hJM6bsqUVo8b2jZceIHGOnNZHbTq/E7sxXy2UUfCDfssjTq+oGNKfcP
	5ZAil1RcGidYXOlLGIlE37d7awEgzCuz7/YtVRPGqyt+rhOnwLjen29AJbeU1d/i4iwRcEYfwAh
	bhmbjNZTk51RPUpZUh9wOe3PmqgWn/2KHGQu+gmSimrxrg0PstnZ2jmBYSpxxtuCibfeBlR0Hc8
	OBk36Q+9l0IQ9C5h+7cSMDLd3KC2iYRwHpVyfjkLrIdVxHRkcSv
X-Received: by 2002:a05:6000:611:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-4857e3cdcaemr7340101f8f.2.1788434210685;
        Thu, 03 Sep 2026 04:16:50 -0700 (PDT)
Message-ID: <37af0051-69ef-4f9f-857a-8db76bf047e2@suse.com>
Date: Thu, 3 Sep 2026 13:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] xen/riscv: introduce (de)initialization helpers
 for vINTC
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
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <688352e340872a50af99a51082966669787b1f72.1787836900.git.oleksii.kurochko@gmail.com>
 <be618606-3b3a-41e7-ad99-bf427f1e723e@suse.com>
 <ca6d67f2-a3cf-4303-95e4-aedec031aea9@gmail.com>
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
In-Reply-To: <ca6d67f2-a3cf-4303-95e4-aedec031aea9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788434212-C26CAB50-5460BCB9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1554

On 03.09.2026 12:49, Oleksii Kurochko wrote:
> On 9/3/26 11:20 AM, Jan Beulich wrote:
>> On 27.08.2026 17:19, Oleksii Kurochko wrote:
>>> Add common helpers domain_vintc_init() and domain_vintc_deinit() to
>>> allocate and deallocate a virtual interrupt controller (vINTC)
>>> structure and initialize basic virtual interrupt controller registers.
>>>
>>> domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
>>> is implemented as stub at the moment.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v8:
>>>   - Add call of domain_vintc_deinit() to arch_domain_destroy().
>>
>> Why only there? With ...
>>
>>> @@ -308,6 +310,9 @@ int arch_domain_create(struct domain *d,
>>>       if ( (rc = p2m_init(d, config)) != 0)
>>>           goto fail;
>>>   
>>> +    if ( (rc = domain_vintc_init(d)) )
>>> +        goto fail;
>>> +
>>>       return rc;
>>
>> ... anything added between the newly added code and the return, ...
>>
>>>    fail:
>>
>> ... you will also need to call it here. Since it is (supposed to remain)
>> idempotent, I think you'd better add that call right away (as long as
>> domain_create() calls arch_domain_destroy() only when
>> arch_domain_create() succeeded).
> 
> arch_domain_destroy() (where domain_vintc_deinit() is called) is invoked 
> from arch_domain_create() if arch_domain_create() fails.

Ah yes, so ...

> So, the mentioned case is already covered. Am I missing something?

... no, you aren't. I was; sorry.

Jan

