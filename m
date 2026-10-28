Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE8606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S2RXC7gh
Received: from list by lists.xenproject.org with outflank-mailman.1462853.1673824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxj9-0003Wa-G1; Wed, 28 Oct 2026 07:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462853.1673824; Wed, 28 Oct 2026 07:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxj9-0003WT-Cc; Wed, 28 Oct 2026 07:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1462853;
 Wed, 28 Oct 2026 07:05:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLxj7-0003WK-92
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 07:05:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLxj5-00BMNJ-Qj
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:05:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae19eb2-2eae-0a2a0a5409dd-0a2a450b9518-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:05:35 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae19ebf-b7e8-0a2a450b0019-d1558036c181-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:05:35 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so3426415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:05:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c42bb6fsm25163915e9.7.2026.10.28.00.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:05:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1793171135; x=1793775935; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tc7spCv2fTJgkdoI13qjZe6u2b0xg4MGuIzXzDYhuTo=;
        b=S2RXC7ghW7j8Hwe6yEk6z++fbNoUCkudpD1NAy71cnk0jgbQP1QdsPXZXmlPR1SihB
         WWsJsKwk++5vKVrs1T3Zo7HnIUu9C950M3NEEv6lQjnpwT+Fu/pgMaPFNRsXzVIKKlT1
         Chn1+U5WJ1+Wi7ctHolo3U0pGy+tEubbsxc07iSzplIUjkJuG7SqVcyQRLT+4Fq5XJET
         pU80ReNtpYvtgauGHuwzjTthyoTtYlnuJTt3iDq84Bdqp9D82me48kPe7Zev1Jmx8ShP
         3V8p8e6WIzbUQ2Xf2+c754AitryzvS28J0wY4B/MuvO6r0zdJPCu105g3sJFQ5MKuAeg
         52GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171135; x=1793775935;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tc7spCv2fTJgkdoI13qjZe6u2b0xg4MGuIzXzDYhuTo=;
        b=xKpnK1GCzG01lGOUJQERCDNsM2IfLglueeFs5pKFdkG9HKdr1KRpr+F6nqqctcmE1E
         /ZLv5M2AVnAjeK/mHAGo3zIfAe0aaEUyDrM/9Tzk0Z9sCevxJHDmx3RfRTgA8zw9IRuL
         mChFmUW8/GCGkjMs471Bm6RdjWrIUnlb92vFX9DeHpzrlfYeFUHySzndwiKco35DinLY
         ZuFvpunbCVMsF61WNA2B0nRSQx965A3Yh//Jgup9OFrsgrjQ0RnKDFzcQNoG61aIzkqP
         Wt5U4eAdwVINRab8jgZ9Hn3tQ+2C9vOnoA+43+iHwnIpoXS1/h/a94/PIAp7vzlEPC/C
         i5AA==
X-Forwarded-Encrypted: i=1; AKwUvBzsEa3Udhb7ZM0k6lC1uw3MB9eTTZOTxu9w8vGrntotH6hNil6R2lLbjkpHjIi0TDhUEYEYMgWNoyU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKTF8ZlggdYcwOexsF9lWmANb2OGDAIKzzbj4GTj9pRPcEqg7WI
	sgwaXyQSSyMDHCkXM9G5yao9Q+mUTJaOhQ/UE6IoVAX6qOgUU3Fp5neC2AktlmoUfA==
X-Gm-Gg: AYBFou3VFT3tNw2cpWm//LmdsbCztY8mIiHkB83J6Vev9HknuVPj1zMHskkkj8r31fZ
	aPBzWJ4t0sCAJ4Sr9kzHe5vXE+c/APht9GvNnqB6CLPmFKM1KffxLCGhVA/o8UA/asX9XnyAdyQ
	Gz/N2rgt2EtikTtNnOyaxE5g5fBPTVwORdHgg8Z41pJoTdGEe8z+2PIocltdYy+Jqg5bBt3qtaG
	ccne0GmZAecIfMd6rQCCENYInuiCHhzFtwVGcbUG0NZ90FgZhVkWQOxR79xyBuJvyPQ6DPahc/Q
	3ZdOyL+CCT+rYFrSdWHKUxRPXj74ePaovMlrTU+Zoe5TsdDWLuSGHQ/oJxserRTgN2DkeMpS5/j
	kgKFv1iWFw+0iUPXUIgMelsO+4BI2QwY5GBeK2U/hSqnQ5j7I6Xj8vtxDMrYLc865lIGIdM2UpS
	B7Q64Lh0mvEqgVktzd3MYFBdhDqVZtTDJLbpUKw1SfYSVcm+yXu1RURZF3BhSVg4Bxks67kzRFH
	p3Y+OPNPUTg2ynmHQkxf0yrVfmLK3eUDiPwmJv0aOsAUANDjFutKo2lm3nIMqwyi+HoA0mMyC4+
	utUlLeKgvEk6wpyJFSESdn3fmOZkQjkPvVV1Yw04CjelAPBmmrQc658r/KTK0Ff18xm0e8eclbs
	oBKhsdf1E/rg8e+sCVss=
X-Received: by 2002:a05:600c:4f89:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a967e8d598mr21789485e9.26.1793171134837;
        Wed, 28 Oct 2026 00:05:34 -0700 (PDT)
Message-ID: <284e1262-2eda-46d7-9307-029faed83d90@suse.com>
Date: Wed, 28 Oct 2026 08:05:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bzimage: Check that the payload lies within the
 image
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261020214825.3655848-1-stefano.stabellini@amd.com>
 <20261026221008.1143527-1-stefano.stabellini@amd.com>
 <19979fff-0554-4ec8-969b-6fe50606b1b1@suse.com>
 <6df73c0e-0d78-d7e4-3837-e4622271f02e@amd.com>
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
In-Reply-To: <6df73c0e-0d78-d7e4-3837-e4622271f02e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793171135-19EC69EA-9BF9B3C8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2786
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 20:43, Stefano Stabellini wrote:
> On Tue, 27 Oct 2026, Jan Beulich wrote:
>> On 26.10.2026 23:10, Stefano Stabellini wrote:
>>> bzimage_check() doesn't validate setup_sects, payload_offset or
>>> payload_length against the image size.  A truncated or malformed bzImage
>>> therefore makes bzimage_headroom() and bzimage_parse() read beyond the
>>> end of the boot module, which shows up as a fatal page fault, a bogus
>>> headroom, or a decompression failure, rather than as a bad image.
>>>
>>> Reject such a header up front.  bzimage_parse() passes bzimage_check() a
>>> length which includes the decompression headroom in front of the image,
>>> so subtract it to check against the image alone.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>> Changes in v2:
>>> - drop the UL suffix: setup_sects is 8 bits wide, so the multiplication
>>>   cannot overflow, and the offset is now computed the same way as where
>>>   bzimage_headroom() and bzimage_parse() use it
>>
>> Upon looking again, I think this may have been a mistake:
>>
>>> @@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>>>             hdr->version >> 8, hdr->version & 0xff);
>>>          return -EINVAL;
>>>      }
>>> +
>>> +    payload_start = (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
>>
>> The multiplication can't overflow, but the addition can. Question is what
>> the behavior should be in that case: Adding back the UL suffix would allow
>> payload_start to go beyond 4Gb, but that may not be what is intended. The
>> alternative would be to check for overflow in the calculation (easiest by
>> way of using __builtin_add_overflow(), yet then needing adjustment when
>> backporting to 4.20).
> 
> What about this
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> Subject: [PATCH v3] x86/bzimage: Check that the payload lies within the image
> 
> bzimage_check() doesn't validate setup_sects, payload_offset or
> payload_length against the image size.  A truncated or malformed bzImage
> therefore makes bzimage_headroom() and bzimage_parse() read beyond the
> end of the boot module, which shows up as a fatal page fault, a bogus
> headroom, or a decompression failure, rather than as a bad image.
> 
> Reject such a header up front, including one whose payload offset
> overflows the 32-bit calculation bzimage_headroom() and bzimage_parse()
> use.  bzimage_parse() passes bzimage_check() a length which includes the
> decompression headroom in front of the image, so subtract it to check
> against the image alone.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


