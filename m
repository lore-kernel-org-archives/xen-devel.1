Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3954CC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:04:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393414.1632216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCvU-0002sE-1d; Tue, 18 Aug 2026 06:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393414.1632216; Tue, 18 Aug 2026 06:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCvT-0002s7-Uy; Tue, 18 Aug 2026 06:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1393414;
 Tue, 18 Aug 2026 06:03:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwCvS-0002s0-7C
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:03:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwCvR-00DvT5-KB
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:03:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f5be-2eae-0a2a0a5409dd-0a2a4509ee06-40
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:03:53 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f5c9-be1a-0a2a45090019-d1558030f17a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:03:53 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so49603825e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:03:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm485317795e9.13.2026.08.17.23.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 23:03:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787033033; x=1787637833; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LabPGz6IlAPikEkXQ50zGIPTM2WVsLsnc+T4zZgumK4=;
        b=JIBheYvhz9nVafARBo5SNRNt1eEu4xabs5hHZLzfHBoILlNLOSQZzQyKtUNAvtdCet
         n+V+WOY2ruD3/c5UwwjKKo8Pks5WQglZAQ2d4fnH0aWuLoGh6IbtEtdSK8059IxQj8Uk
         1cIKHlEOjhnIuESOAkjeMgc5HDZ54HtazEivjapPl3dMQB+nxq+kPh1v1+Z0kNmAIJU+
         BCX+2WDX4e/x7s6P6e7Qcp4ccnUvdR353Afyb9PPlrQBmpUjyK7HeiNgYaRraBGpr+RT
         3YXZxl1c8E7rm8TXBF6CCe2jj2OLi6VlJE6bYyn4/zPEX4DniwDaJcHt9PhziaIg3Hbh
         y3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033033; x=1787637833;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LabPGz6IlAPikEkXQ50zGIPTM2WVsLsnc+T4zZgumK4=;
        b=VDaKHBIeqJh8Mk4R8FrsdAOee6+FLwPML/YVbxJs8AyogMSP7uOxAS8dUHuVmIVHlY
         uguKloWtx6Jnnp0YprlmAlwSyEE4l59jLXYrCyuLRPrvaMIvSML6cmTbUjz+e2lME1eL
         3sXFEvTQ28doHV01JKZcrAJwunUgBWp4zAaN8FBiae7UbXL482auh/gcjDJwKmWt3jtk
         a/1qfP6ZoM36ivMsqtBHZQWcjOq9GCZfB4bVqywMSaTe0Iy7C4grwoJcIS/uJ2Poc7ew
         EB9jehB6kp3zsuJ7wI3qtR6zyr30K01VfHSI+REkoH9gmgYXgxK25n0NTDlb2aRP0q0A
         AChw==
X-Forwarded-Encrypted: i=1; AHgh+RqNUui6D4b5owZ9mB8fjf1eb+sodflbko8YY5w5JdfaH9v1zUg6qfNGB4B5UKRiJAYoCrlBsS4icMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx14apSzAIEz3qE4g+d8sZ3SQAmZRYANwWbDMz1dm2sd+ywDmbz
	fJFnq005ukfA2HexZ1kf+QmYGapuWFlBLl9esiAQOSL7W91KmDLbP+9tM6QiGwaWHg==
X-Gm-Gg: AR+sD139tBiF5BLl5JQP1PCOVLM52blqNq/6+tuYUDBFs2ICqXQn7Wx6//+38eHlcJK
	L52BH0OEVN/LTRqDSavyLQk1Qpa0FT3LwKQ73X4pCPx3Wnuq8/UWYV4x7zTqViYCMxIwOtl7wym
	laeMBfFC5L2Ltg/C8HIx0mJCwmU2UPm+uDthw3cC29MlEnzar6pZ7KaC1MdbXCc6DmK4tg9tO/J
	dvKea0Dq6PVPPtF/A/f55RFA9PFHiSWi6vye9IF9kGJ+JL4pdVKTBswtn2YO3tgfaF+WNs7yfYo
	+kJsYGI03F5Q9Eg4NHd+qg9xLjv/iXwF6SnoUlnvFcA9pE2e96QJTpVAe4kKjRcdZFpvbk8RZjp
	LI1U/R8dx2aIEjCHUk8e+HB0PL0M0tLLB/O+b7UVP3BaOXRXFQVo7VphaPUh/20eZQAYbk/jSZO
	AcymSYmMYQBxUU34ygGaodgI9qun29N/MxHl6x8L8eN9dRaYHHUJU2SGylHrL/x7FS5QebBRoUZ
	bKxlNfCw2YpaCGkSA0V3Ze05sLhxuk3o1FjMYWHGNM/8mqWta3u
X-Received: by 2002:a05:600c:528d:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499900c9e99mr361143465e9.9.1787033032884;
        Mon, 17 Aug 2026 23:03:52 -0700 (PDT)
Message-ID: <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com>
Date: Tue, 18 Aug 2026 08:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
Content-Language: en-US
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
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
In-Reply-To: <aoM4ufGg8QO51XB9@end>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787033033-3A8D9034-AB072B27/0/0
X-purgate-type: clean
X-purgate-size: 1029

On 17.08.2026 18:37, Samuel Thibault wrote:
> Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
>> On 17.08.26 09:48, Samuel Thibault wrote:
>>> Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
>>>> There is no user of libpci left in stubdoms.
>>>>
>>>> Remove libpci from the stubdom build system.
>>>
>>> Wouldn't it be useful to keep this for anybody who would want to drive a
>>> PCI card from a stubdomain?
>>>
>>> I mean, in the zlib case, it's really a mere question of build & link,
>>> so we don't need to ship it, people can do it themselves easily like for
>>> any other library.
>>>
>>> But here there is actual porting work, that we'd better not lose but
>>> keep shipping.
>>
>> This is all still available via git.
> 
> No, it is not really.

Question is - does this matter in the first place? If someone wanted to
drive e.g. a USB device, would we include USB code? I'm with Jürgen that
we should have in the upstream tree only what is also used in-tree.

Jan

