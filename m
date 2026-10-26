Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403C606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EVaPb1cy
Received: from list by lists.xenproject.org with outflank-mailman.1461040.1671970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHYv-0006nQ-Em; Mon, 26 Oct 2026 10:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461040.1671970; Mon, 26 Oct 2026 10:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHYv-0006nJ-CA; Mon, 26 Oct 2026 10:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1461040;
 Mon, 26 Oct 2026 10:04:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHYt-0006nD-Ot
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:04:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHYt-000BD5-5j
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:04:15 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2598-8faa-0a2a0a5109dd-0a2a450bbcde-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:04:15 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf259e-b7e8-0a2a450b0019-d155802ee0cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:04:15 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so17368895e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:04:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0cc374sm190781715e9.9.2026.10.26.03.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 03:04:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1793009054; x=1793613854; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCy6WRUFpl6zKU+eACKqrRPCwL9Wyxk81Q/SdeQ+jrs=;
        b=EVaPb1cyeqSM334RnmWEo4e5ysP+ESmN1rTDqIaCbgR2KUIocndxfoe8Dyn/hJKNGL
         jrDhxFtZXrMjdKHK4GP4F9Dhp7CXSItV5HiqIkltzrIbW3WVqQVhs6NlXsbRVdEzVjQX
         2v2x7ay3TTfwiWVRMd5kQMWaaljLFXxfKVSjm0WCkyGs93sPRSJM7x1EbgPEhyyi4LHf
         TlGiJFTsqHI11Buy0TNAZEhy639oglaWhD946ualSyd5TWGlZg7Wmc5qKKTjENTRIRSZ
         Hy3/SgYIjA0WS2iRQDh8K1jalEWoh7v/evrkRU8z9xcbumYqOzOUbnkChvUqLWFXsOpB
         8Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009054; x=1793613854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCy6WRUFpl6zKU+eACKqrRPCwL9Wyxk81Q/SdeQ+jrs=;
        b=QMHDUETzAdufvy1wxfWTpOBsUE0ORnKIUY+TDNL25ImmmZm5684zvbZiF+IisIuaBE
         tRpM2sbVAe//cHZflsglZ0SCzPrTnQPp1xJn25EVyL14LT2Z2KLtfqMOMCuuJiq26xca
         4N9w0jbQwQtiu7P7982ivl/7nf3mZfxlAPH12cIzovfkO5RJrVSVVmrZoFtCY/HwXNfV
         nsvUM4emUfJPUxw8AkDJSVugT2wljf8UYWN4ZdnYQrcEfbAyeqC4OYwFdkqnOex3auVC
         IwTL/b3iAUFUkvERMtW3jNDRFo5xwIQRV+o/qM3gLWlmFfjcbakElOlbz8F7z8z25jrF
         8x9A==
X-Forwarded-Encrypted: i=1; AKwUvBwNEkI1UUONy/eJauDvZkb7AJRPg1nxtSZM4UcdBY4kc+fssBrGTSZbb8zmbkau42wns00g2NyeBj4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI/GYS8jSFFfv261j2ItFj57eU/VTu0eZVjJ9oYESVJf0vcR/wj
	FI/OZIJgcUA//cy0eLKca3cOKaKcAzTzlk64Og2oozuxxVYWnNSXi+kmvrpbLifkEw==
X-Gm-Gg: AYBFou0epU/6DPkxdCYVb8AA6ex2WNoZ+VLHRrJg08NRbux3U9isjkfdby85TbJcOBv
	HZUc6GLWPBu0OdVe9CT65d6veGD74r3UohScRb8dHenYfpDypNM8dUHP6TdASEKu1yZmn5/lNv9
	D9JrQ1tv14qYup0bGSiOMoc4FoaKsinflzGI2olBsA/Z8AwX7x4FB9SuuYw3Y3JnaUBNyCjjpxS
	e3ml/WW8uRAdsJac2qpxchuR7Fq8OSIlF511JiQ1YZ7K9u6wE6pmp0+kkLGMD2LCAIlAr0dwuXm
	P4lB55ECCwvZJ8MJC/P25gPvd/Y/Sp1wBwy6gBb6yqnyBglzzKpS4WX0K7k4gPqdcVm6QrjlYEs
	Llj4dS4rSxgFALKDDiC4IIOvUDt6cMzCoWKEeR/H0T+ZAn2hk/p5Chzqa5lUA9b1dCdOJtdrd5p
	RAn7jSigMzljmdf7j7FMnlw555MOt/Q7mYuSSkbkj+fguTMAlgDuO/2UUfk/yWnBmwttGpVYiWC
	CClo8h/wTVFGfqhvurzsWvBhz2Z3uQM9Lq8H/nF+Pk2Ejyfr1xY3UNz5KsJS2GTsPWN9O5NS5ET
	beX1deuVNxN61eT4XCcMaI5EHMByyQLsxxpsfLTmZyIC
X-Received: by 2002:a05:600c:530f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a35ac8b2a7mr123321495e9.10.1793009054532;
        Mon, 26 Oct 2026 03:04:14 -0700 (PDT)
Message-ID: <f7542e5e-1569-4745-8d48-bc955623cb15@suse.com>
Date: Mon, 26 Oct 2026 11:04:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Don't swap the IVMD read and write
 permissions
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261020220821.3681692-1-stefano.stabellini@amd.com>
 <1792571797.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@vates.tech>
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
In-Reply-To: <1792571797.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793009055-1B6D29EA-1BFE42BC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1692
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21.10.2026 10:36, Teddy Astie wrote:
> Le 21/10/2026 à 00:10, Stefano Stabellini a écrit :
>> Per the IVMD Flags definition, bit 1 is IR and bit 2 is IW, matching
>> ACPI_IVMD_READ and ACPI_IVMD_WRITE.  parse_ivmd_block() takes iw from
>> the former and ir from the latter, so a unity range firmware declares
>> read-only is mapped write-only, and vice versa.
>>
>> Ranges with both permissions, including Xen's own, are unaffected.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>   xen/drivers/passthrough/amd/iommu_acpi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
>> index 4688908824..fe3dee872c 100644
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -414,8 +414,8 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
>>           exclusion = true;
>>       else if ( ivmd_block->header.flags & ACPI_IVMD_UNITY )
>>       {
>> -        iw = ivmd_block->header.flags & ACPI_IVMD_READ;
>> -        ir = ivmd_block->header.flags & ACPI_IVMD_WRITE;
>> +        iw = ivmd_block->header.flags & ACPI_IVMD_WRITE;
>> +        ir = ivmd_block->header.flags & ACPI_IVMD_READ;
>>       }
>>       else
>>       {
> 
> That probably wants a Fixes: note.
> Fixes: e941abd7cab1 ("ACPI: eliminate duplicate IVRS definitions")

Argh, I did screw up there.

> With that,
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

This was committed with an A-b of Roger's, but such an ack was never
(publicly) provided.

Jan

