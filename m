Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48326C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 10:51:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363780.1615307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJfz-00036J-0O; Thu, 16 Jul 2026 10:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363780.1615307; Thu, 16 Jul 2026 10:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJfy-00036C-S7; Thu, 16 Jul 2026 10:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1363780;
 Thu, 16 Jul 2026 10:50:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkJfx-000366-Bn
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 10:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkJfw-007TGs-Gl
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:50:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b771-e002-0a2a0a5209dd-0a2a4507abd8-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:50:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b784-b4ea-0a2a45070019-d155802ae0ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:50:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so23880785e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 03:50:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541e8e1adsm74433785e9.7.2026.07.16.03.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 03:50:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1784199044; x=1784803844; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/YZQSFkKYwUnyaMkzJOUNUgXpj25RyNKMC+cLx9vCs=;
        b=CpUqlCsV9gg/cgdJI/2dRh0FbM6GSLWWhHB488fnMfmUI5TQRLup7ATFChVRaCMq39
         ss6CrPrtWWwX8MHFXW1JOvLIhd5hCZMoEEkKZJLxxPqDJRfXVM7P/n+M4ZYdnWJY75qJ
         UoH/XHFP1xV1MEEAmni5hGxMDyWxHgx4pC5hXlCfj1qVdKWCNk2rdCwi8+BTI+S48v3O
         ZlO8PAjghzHFs+SZohn6DwLFSU47qRyLn0WFcHBTYHzu6SdZ7/gZpiv1YIMvH/DEUNIK
         cVzRG3TDU1l6fqcE2pIT/LeVC05jEzNVxG855aiD6bSkCTyDHfZGJjzrf9chlYPCb51V
         oaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199044; x=1784803844;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/YZQSFkKYwUnyaMkzJOUNUgXpj25RyNKMC+cLx9vCs=;
        b=U174t7SN/VyznFez4nNlBbAn8yxddxPuj9OeFJCEHhck8rLHtxoSpTIgavcyFBzgnR
         YegvcqRgvtcA5N+kZUxe9tLmKX+RgBkjMxHwCLz60Vdjon03OiEGi7aT+Col8C6/ATKR
         etUP6fOjDorp2QjyPpDEo1EVHURNRQCzoO9HongrqfbvfMKOaSMo0THLsf6N5P3WI/lp
         MzeqR/pWhpe9f7209q8GqRIb7x8Vw0raX/QSiNPeYbhpKwhu7BVScaEYnd2IJQHwWWyT
         fgbPp/Nu90G2tAgFiORXByph/y91vU689AUSHVjjU1WA8k5PQVBZmXIQ6G1MrmM5WOFv
         3Hbw==
X-Forwarded-Encrypted: i=1; AHgh+RqxFOd/xWQnhVBy2sS5l3TuY5vXULYaWr63WLV4L5m+qCzz2LG6wCjUxgAHmveORJSLEw/zZxFGmSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9GJDzLIG64P5ikxaFyOzVxeKGSxIasY1sRtylOefxQMmI4bM4
	DKk0VRqRNJ/FWvVQ0jyqhJRrzGrUWFT42pZsP6NgbkWdLH3U7QRLSilnyjqZ4NmL0Q1nLgcFbJk
	eSf7sTQ==
X-Gm-Gg: AfdE7ckhIRL6tZA+WOiVVn4QWSMdV3CasMFq35Wbsu/joThvx3uBW8OkFvpfxiRvBqz
	xnUiH0XEhw/0gVteFKVQiF1nbcPmR1wu/xxoAFRImI2Kg0Iqgbk60gejwujD4r/khE78PD7Uie9
	VZNuNeGZZLxjFFR1X2PfINwRiyAcRluNhTZLat6Aee+cQEsug8DDSXBn2m/8ce1VKoWssoYiXg/
	Ijpp+wiS4i7Lj8LON+d1v3Y5PImODS6WaeU95c68D60m0AISqCxe2U/2V1GxAt5wgrTnb2ExduJ
	VpnfglAMpdXlBiS2HhPO22UipSnCnVSGpYdl0LDf3XW61ppdd8voa+kwiUajhT/6Fm9BnP8KAxE
	TFIAYIzJ1kXWXY2sOHtKxxnZwU/nhrbR6SP5V4K5KFFkjVJZU3pNy/ev2mtOUA4Nf2Ag8haXtki
	lBqOu5YG8OLJ4W3tiNFdhSovMrl8MpqqT5CE4zRuUn/kbdYhu+4EAqeauOn2l+ruDs4A==
X-Received: by 2002:a05:600c:8011:b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493f8818045mr226393885e9.19.1784199043840;
        Thu, 16 Jul 2026 03:50:43 -0700 (PDT)
Message-ID: <e307a7ec-5a72-4acf-9028-9a288332e82c@suse.com>
Date: Thu, 16 Jul 2026 12:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
 <1f8c6f13-f774-4d99-97f2-79767392785b@citrix.com>
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
In-Reply-To: <1f8c6f13-f774-4d99-97f2-79767392785b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784199044-A4AC8AE4-A2BB3F84/0/0
X-purgate-type: clean
X-purgate-size: 1155

On 16.07.2026 12:44, Andrew Cooper wrote:
> On 16/07/2026 11:43 am, Jan Beulich wrote:
>> AFL has pointed out that the op_bytes-is-not-0 assertion in common SIMD
>> handling can trigger for these insns. Indeed when the (relevant part of)
>> the controlling mask register is 0, no memory is accessed at all. Leave
>> op_bytes unaltered in this case, to engage the short-circuiting in common
>> SIMD handling when fault_suppression is true and op_bytes is 0.
>>
>> While there also correct a related typo in the test harness.
>>
>> Fixes: 65f82d4ce1ea ("x86emul: support AVX512{F,_VBMI2} compress/expand insns")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Is this local AFL testing?  I'm slightly surprised that OSS-Fuzz hasn't
> found this.

Yes, I'm trying to remember to run the fuzzer every once in a while. Earlier
runs of mine didn't spot the issue either. (I'm presently re-running things,
to have a limited level of certainty that the issues it found are all sorted
now. The other issues it found were in patches I continue to have pending.)

Jan

