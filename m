Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90602CD6E4A
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 13:06:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324997.1590509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOpJ-0004RR-1t; Tue, 02 Jun 2026 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324997.1590509; Tue, 02 Jun 2026 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOpI-0004RK-VZ; Tue, 02 Jun 2026 13:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1324997;
 Tue, 02 Jun 2026 13:06:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOpH-0004Qr-Al
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:06:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOpG-008Dw7-NY
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:06:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed551-5cb7-0a2a0a5109dd-0a2a4503b44e-48
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:06:34 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed55a-672d-0a2a45030019-d155802bad2a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:06:34 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso6507335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 06:06:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3563cb9sm34294080f8f.29.2026.06.02.06.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 06:06:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405594; x=1781010394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1EqCLt4TDvZg3NjwVa5KXHahNjPkPkeZlkZ8i74JxM=;
        b=eqhzlQw2ARDxO/39F2/iNnjOupVyRmY4G6wnbNZoPRvJCerU4pYBVw+nExcOCLyA8X
         jeFXIMKk+8Y/8+HixXZKCqOIrHLcKjX3EeWeS/ziiFdvBeNrmAzdVyCF7/ata0EtBbZt
         I+P7TsnQCDRB/+4fYRd0V8xmQSmszaLvJs/OKXlpBT/H3icD9VFy22qs/PlUTAI4CvYi
         SVyDFEt8DdHXTLNlz+aFZqzPkr+oCLxb0QLwB2i5AK1ipxOwFvnA8+Rt2o/np4WnvLCG
         oaWfKw7dW+Ygz2ZX1pAfzYespQ7TPLJDlDu9py9NXcxt2qkFq0XR5oj8wWdgu6n0P5UV
         QEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405594; x=1781010394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1EqCLt4TDvZg3NjwVa5KXHahNjPkPkeZlkZ8i74JxM=;
        b=MVuqbcSlvLqpTVdVRHhiyfX2CdMg8RTXkP/kvWzP/3GRGxgvFXum9mraCKP/vy0otF
         y4x6Rrz8tde+MxwRckqMAEAutRTxGhcV1b85glzqiwn5P6vC4FUJjTh0giJFNg0roqpd
         FYGoq2ZysfYFCQfh3IUOxXNYEhFfIXjw3L8/9rg5GV4PzmwsBOurJAaQ5uOk8apn7FSt
         vqJzsB2lCiI+xEJkqU7E/AbU2urEi/RR8AoMF9vcjd3k5wFcb3WA/mm92tTE/oSgHh28
         7DwcV3AGAfJfBjs/FambqVHRFhxvvWdy8xhnbXBwegQpqEpX4/yNvDB5o9jtXNamSVZx
         MjBA==
X-Forwarded-Encrypted: i=1; AFNElJ+kRa2mxEN325SUNDfYDMSRwuqw+rxKQkeBZzlsC5GV4E+YeydCYZYj6aNNwQL23lklfHQP4hetoLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXBRP9VZHaIrussbJYy7yBaZPvgDZF0Iha7qRvjK2IsnGqvP3T
	TK5DT9ov/lJBd5l0JCYfi7VZNaJ66eJRLsJPtDWnp6n0njQVdVeVhZw45OQC+jxAZg==
X-Gm-Gg: Acq92OEuqqEoq5JIU/nxGqHVXLpt6Y7kAyc0XMCDh1MVZl5l+cas9PmEsJNjhcpQ90d
	mhW+osyWvAgFCv5BSwCN+5UzVStHH2dj3eqhixVGS8S0Y3vbsq34m9RiKW2deSZ+r5I89cnUUjI
	mInJV7jZWK5FWkLOHDZUkdHw84N20DKl50S9Q93CY4tW7QJuvjbfd1ekPigsmbvYKfcxd6QXHoS
	8cB9UOMkiTWTcsXhD5MKrlJlyqtVpUQic/WiBodWudeHPzFFQOrxbWb14mWCIZE+D/4b2psLvWH
	NnmLy3IyBWSqgFedVLCtCLI3w1WQ3aQHG7NgrhLa+9U4JvwOuEWaXzMGxdT3+Rh580Y79zKqo4N
	bp/mJY5dcwOl5l9Je1UvIHv3Ur41Z+IIsLsPe3yQOLKtnYzOe7TB4htAFvguzZqiKMMm4cF1lB0
	E9ez6PSZNe+Bbtvmr9X30In0nXpKjn1qF+aCWE0s+A89XyLSB/mJZsQQhWBocbtGnfOpWtfeTZZ
	VS4BEp9KshuW76IyWnhlqBA8A==
X-Received: by 2002:a05:600c:a315:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490a2912132mr207101725e9.5.1780405593715;
        Tue, 02 Jun 2026 06:06:33 -0700 (PDT)
Message-ID: <d32a8834-2f97-4ba2-8836-151f32daeb88@suse.com>
Date: Tue, 2 Jun 2026 15:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] public/xen.h: Update mmu_update comment
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260528075539.10209-1-frediano.ziglio@cloud.com>
 <fe9e3f66-5f69-43e2-b367-af8a8e152c41@suse.com>
 <9915b0a4-0219-4c91-b070-d39c74b84d03@citrix.com>
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
In-Reply-To: <9915b0a4-0219-4c91-b070-d39c74b84d03@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780405594-3AF62938-5021A812/0/0
X-purgate-type: clean
X-purgate-size: 1454

On 02.06.2026 12:05, Andrew Cooper wrote:
> On 02/06/2026 11:01 am, Jan Beulich wrote:
>> On 28.05.2026 09:55, Frediano Ziglio wrote:
>>> Frediano Ziglio (2):
>>>   public/xen.h: Update page table layout comments
>>>   public/xen.h: Update comment for mmu_update hypercall
>>>
>>>  xen/include/public/xen.h | 17 ++++++++---------
>>>  1 file changed, 8 insertions(+), 9 deletions(-)
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Considering these are (doc) bugs, I think I'm going to shovel the patches
>> in without asking for a release ack.
> 
> Patch 1 is fine, although I think it ought to go further and not try to
> not-invented-here explain what an x86 pagetable entry is.

Shrinking what's said there could as well be done separately. Correcting
obviously wrong numbers imo wants taking right away. Objections?

> Patch 2 is an ABI change, which is why I didn't include this in the docs
> changes I put in prior to tagging rc1.

What is the "ABI" here? What's written in the header, or what has been in
use since before 6aec3334b3e (no real title)? From there being only L1 and
L2 table handling that is being moved there, that must pre-date 64-bit
support. I.e. 64-bit Xen has used the low 3 bits forever.

> At a minimum it needs to explain that this is dependent on the pagetable
> format, and is safe enough following the removal of the 32bit build of Xen.

Frediano, please extend accordingly.

Jan

