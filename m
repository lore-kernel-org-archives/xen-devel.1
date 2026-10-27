Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E75F606A33E
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q36Qes0n
Received: from list by lists.xenproject.org with outflank-mailman.1462045.1673091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLemT-0002UH-Be; Tue, 27 Oct 2026 10:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462045.1673091; Tue, 27 Oct 2026 10:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLemT-0002UA-93; Tue, 27 Oct 2026 10:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1462045;
 Tue, 27 Oct 2026 10:51:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLemS-0002U4-BI
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:51:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLemR-006DqU-3V
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:51:47 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08232-2eae-0a2a0a5409dd-0a2a4501979a-26
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:51:46 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08242-5984-0a2a45010019-d155dd33d0a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:51:46 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso3603856f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 03:51:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4ba7sm22256148f8f.33.2026.10.27.03.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 03:51:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1793098306; x=1793703106; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmcB+jm8qoXpN3NNg9Da3f6QRhX7AatPegTJgXcy+4s=;
        b=Q36Qes0nvdKfl6gb6O5+kLopbLHdmACAzxsCB4s/J0K0Ecigs17+PqYZ3gewmSuUlm
         O+oauH1zdL/M7hLBPqdR6x2OLHMCuz1A5YmNRmRohYVQ8dXlZP46mBKSxxz+oXcdIuUf
         iKJb852l8LRnFaOFIfaCf78CwGiZ+iHm6WdnbmHBWSMl6I8hVqYX4CU/PPJqG0QOXIaG
         ztGX2bxYH0t2ihbaBVYIJe6DscNquNmblm/Qyp9c0g9D0NBEyzYXn4kEK5WEwDGaYlQp
         Fd3hcBFcp/ViGifpoeXPR82dCDvsPbT+3z61WyWgKtK6MJQB0OpDvVa3NAnUscX1TlHD
         nGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098306; x=1793703106;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmcB+jm8qoXpN3NNg9Da3f6QRhX7AatPegTJgXcy+4s=;
        b=t8859auemr+YHq2XvS7tZO9Hx0M2VfdUePUeSDH9zPoph+Ao3LrONPUsLjObnOEW4J
         yewwesdW0dsqJMpk9PUIb25FNPzRErB9zAaP7twy66sCOfOL4ZA95owUEYDnCigh198H
         uyM6FA9Z9bJ8ECVwejgbSZkx6E7d0ht7v29cVfKbKeF8AvpYiDfeEPsBiqXUDzuRVXrc
         0VSu9DTHVdLfZuMHhKixuKbYX6z0gQ0MgR8ip1zbHZ8IAvG8NXKa4yjwjlt5jZQ/C3lP
         BcyTXI3ETW/sSLY501J8FAR5AMwxyQy7ASGfm8vZOByeXh3/k1MGy85pc6Z0okHgrRDk
         ED+g==
X-Forwarded-Encrypted: i=1; AKwUvBzRuaiiw57pJ2aXAaSjMwC/urgN1KzDE9Qp+e6Q65fxWgXDRYS3Dx+v2eQfGIdjaGKINBW4NwC2wY0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ8IRja5nWGmBV379AQKN+vZudBrAHMif05FTMZNFCYnGQUyYkv
	8X0P/Wf/d/Qcmwb3FXK8/AS1NnNfsjVwAlO8vUtB4PP5N8j74huw0M2aMGBNH7eTqQ==
X-Gm-Gg: AYBFou1uXPA7MyYCX3aR44/BSQ39wq+DGFEtF4tm5eRQdG377GxqeT/qdlk41PQYQUF
	45KsywRm0GK66Pz+NKykKe3m2RN2o89qHFhg8CAUFADnT7nMlbGF5ZrAjS+IEdN9SRVIsFkdbMI
	Ud0U+YMOpqT7AsGxsutq0qkURJKL8Y3Bqu4rMlTD3TEsMqf+VXK1p/LAXyB929eHtIMtgbY6JyN
	nzVHrf6wUvw4g9FdwdrI15/qThBI1oVg5mj0NWN246FZsyKlc4gh3CcLOEJbidy5ZTlF/V59I8C
	ofks/lGVgaP+JNVMzgRToT08k59lEVPBr5/O+MXqNU5vc8E4kJwMTD3VCE5uL75ufrVDt2l2Nem
	ibKrUYhu77JBTU/QRGAONi4HLRQcE1//xgjZmnO4MuF/v/UDEdSen0ORLSNZpnb9t9m0wUz6CMD
	pf8+IX9Tl7C0dlOuw9OI49XGDQODrXOvMkxfgr7fUgUqYFJgbRmh8LA62dJMr4AT/ZyhUvZ460s
	KanXbhbjbE9tXH2ATLWz75PRW+O9KoQz2lw08V0B8ZNT2lUQNVJZ8B/lLmyi7rgTZPIylnOi3tB
	Ue3XEaPoVEzUqQL7fua8SwQDKsQ5oQwngJSLaeg6VS1c
X-Received: by 2002:a05:6000:29d6:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e3eb9c106mr12760447f8f.54.1793098306321;
        Tue, 27 Oct 2026 03:51:46 -0700 (PDT)
Message-ID: <19979fff-0554-4ec8-969b-6fe50606b1b1@suse.com>
Date: Tue, 27 Oct 2026 11:51:45 +0100
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
In-Reply-To: <20261026221008.1143527-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793098306-BEC61757-C3420459/10/78276251493
X-purgate-type: spam
X-purgate-size: 1893
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 23:10, Stefano Stabellini wrote:
> bzimage_check() doesn't validate setup_sects, payload_offset or
> payload_length against the image size.  A truncated or malformed bzImage
> therefore makes bzimage_headroom() and bzimage_parse() read beyond the
> end of the boot module, which shows up as a fatal page fault, a bogus
> headroom, or a decompression failure, rather than as a bad image.
> 
> Reject such a header up front.  bzimage_parse() passes bzimage_check() a
> length which includes the decompression headroom in front of the image,
> so subtract it to check against the image alone.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - drop the UL suffix: setup_sects is 8 bits wide, so the multiplication
>   cannot overflow, and the offset is now computed the same way as where
>   bzimage_headroom() and bzimage_parse() use it

Upon looking again, I think this may have been a mistake:

> @@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>             hdr->version >> 8, hdr->version & 0xff);
>          return -EINVAL;
>      }
> +
> +    payload_start = (hdr->setup_sects + 1) * 512 + hdr->payload_offset;

The multiplication can't overflow, but the addition can. Question is what
the behavior should be in that case: Adding back the UL suffix would allow
payload_start to go beyond 4Gb, but that may not be what is intended. The
alternative would be to check for overflow in the calculation (easiest by
way of using __builtin_add_overflow(), yet then needing adjustment when
backporting to 4.20).

> +    if ( payload_start > len || hdr->payload_length > len - payload_start )
> +    {
> +        printk("bzImage payload %#x@%#lx past the image size (%#lx)\n",

As we prefer messages to be terse, may I suggest to also drop "the"?

Jan

