Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF87C61DBE
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 13:28:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399236.1635395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyrCg-0002lJ-IO; Tue, 25 Aug 2026 13:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399236.1635395; Tue, 25 Aug 2026 13:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyrCg-0002lC-FP; Tue, 25 Aug 2026 13:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1399236;
 Tue, 25 Aug 2026 13:28:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyrCf-0002l6-PP
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 13:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyrCe-002jYd-Ei
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 15:28:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d987e-bab6-0a2a0a5309dd-0a2a450ae090-8
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 15:28:32 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d9880-f2d2-0a2a450a0019-d155da32b8ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 15:28:32 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so727126866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 06:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ab63sm1728728466b.50.2026.08.25.06.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 06:28:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1787664512; x=1788269312; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJggQA6AcIJyW0vWh0BHsMQ+AEm79IycoXNzRuRXB2k=;
        b=feXT1K6TnUdqfiuKG2Ce3us8QPjpt6BWNk39ljl+qxH/FUa6WuusO58LQmz03QuTFk
         r431puLgdRw27VYYHAmIqzgHuTIrEUKlFS8zrHO6GHGie2suBeBpw+973t2MZ9qr7ShB
         ze7c7otMUkSSiqum8e8ijTTfHzuWb6K+8AyQJldu9aBQdr87Rp5OZI6ACZMhd9lwulOd
         JOzWg3eDuEqr2+BdddzBL+u23t7f2LNEh0A9hHCYPFrJWATqc4DU/kyu/a7/6XXH/L2N
         yPLPKKvoY4IapahVOUeWcbipJhZX+upAs4s9yLcBbiqvcrYhoEMSb7gAq0IaudrFMZqk
         z7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664512; x=1788269312;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJggQA6AcIJyW0vWh0BHsMQ+AEm79IycoXNzRuRXB2k=;
        b=T7mFahIVUN+XC39QzHieljEFtEGFe3paNOR3udDfGT0qU9wwbOWVNNVoVvMe9O1HTX
         4Ldyy93dnEejSoE3JEDNqTYiIHCQkVUh8hPfjWI57HJ6m2GyQ/m9/uVGhunS9kTxprfn
         T4zFnZZ/gGh9N7EoofffGsZ25xV9g3WB4auJyR/dnumIjbCbiFW1qVMLI+4lUTngXlEZ
         K3+hYtKIqsMPM03vwxZrJE+Tt5KLURtQ++JwKqS21Roo1RjAfyWgbWHZ7SCtQUltMRTY
         FdX9G7WzBMzeurkNsRYuEVOeADR3uHAXcgkuWXw8/6Me8+wRVKh/oIroxy0bNMAHVPMN
         PrOA==
X-Forwarded-Encrypted: i=1; AHgh+RoVnREkm3kxyZowXsBvUVd6h6hMtcYv+2doOpWa6cVSgjR3d/6DejUTQIyxQ/JbJoNFmFsjGqgzi3c=@lists.xenproject.org
X-Gm-Message-State: AFuF++lG4DOsvjO77n3pXE3i3je5sXC3i7c8F5Uk37YiW931ZtTTU98z
	kQLP8zZG2sewzUjzltSA2nrLZZg0Eq5jVDrjGKgtk6GJwalzTl2r85cxr6/pkN4mOg==
X-Gm-Gg: AR+sD10vx97GrQmj0TbZ2pcGeKVzl60mLh4d/HDSH4Lno2Ei+YnypqLfwPWA5jMOAVu
	tuCnDLG144+i20GPXJVFoMQSv8z6wk0x/eK3GTfFIK3/PbkccwFCC69i5dKwLQa7l2LlLy41OmW
	+ADhXcl8S1NVL4zwwX0Y6iF+8agEir+/KB+VB8YpQe1l+xVzJdOOaxIHZHXhp6Trhz0KAavDPBe
	V/7mUeFHmoseZ0y6BscZKhaysLaizGfjf4YAktokwSwzYn/0ctfCpp00Ac06WLh6FNmLXg5p1AA
	CyZuK7NbkzbKLmxyBLc8JbCXeNZJYZ7kPOaoKAfR4rhfJNV3qcKgQSCodT92Bh3VQFbe5hzRp/y
	x0goVA8aH+xeWNe+W1QK4CQyrG5adUo4GJ+efN/o17Ypsq6diUsfS0YQjkOlO38fCwuaDlEpn2o
	x4CAd3/JS4Or2qOaAThmVYn9zmqFg5gTUaq0Yrm5BQdq2X7C+R448QwEP9z0Ujr3OrzBLtKYJuG
	TC2RIRuSXeR4semoHUpUOg86b06WFHo8ID5Q5kGsOiGX72yl5yM
X-Received: by 2002:a17:907:ea8b:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c246a5f4515mr4267561966b.8.1787664512080;
        Tue, 25 Aug 2026 06:28:32 -0700 (PDT)
Message-ID: <f34b38e3-4f77-49e2-a69f-aea153f53787@suse.com>
Date: Tue, 25 Aug 2026 15:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
 <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
 <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
 <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
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
In-Reply-To: <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787664512-51EC2CFC-112D4314/0/0
X-purgate-type: clean
X-purgate-size: 2899

On 25.08.2026 13:42, George Dunlap wrote:
> On Mon, Aug 24, 2026 at 10:02 AM Jan Beulich <jbeulich@suse.com> wrote:
>> While these percentiles in particular of course look very tiny, they are
>> applicable only on systems having no meaningful gaps in the physical
>> address map. And even more generally I find all of these calculations
>> only partly convincing, not the least because you start out from numbers
>> which look pretty contrived when comparing to actual systems which would
>> run the new code. (Using more realistic real-system values may end up
>> going in favor of what you want to convey, or it may not.)
> 
> To be honest, I'm inclined to think that they're not very convincing
> because you don't actually have an idea what the problem is.  You
> didn't specify what you were worried about, so I tried to guess a
> scenario that I considered 95th-percentile worse case.  I don't know
> what kinds of sparse memory layout machines you have in mind -- are
> they written down anywhere, so that contributors can read and
> understand what they need to consider *before* implementing?  Even now
> you haven't even said what about my scenario you consider unrealistic,
> much less told me parameters you think are more realistic.

What I specifically considered unrealistic is that you use huge pCPU and
vCPU counts. Yes, you're trying to do a worst case estimate, yet at the
same time you're assuming huge amounts of memory to be available (which
doesn't represent a "worst case").

As to sparse layouts - ones which have led to the two forms of PDX
compression are well known (I think). The need for more recent (offset)
form is a good example of what could go wrong here: New machines can
always come with new layouts, potentially requiring new compressions
approaches. So what I'm concerned about is effectively _any_ sparse
layout that we may encounter without having a suitable PDX compression
method readily available.

> I don't even know exactly what failure mode you're worried about.  Two
> kinds of potential failures I know about:
>  - Performance impacted because pages can't be NUMA-local
>  - Toolstack operations (including domain creation) fail because
> xenheap has been exhausted.

One thing I can't help thinking you keep overlooking throughout your
reply: xenheap and domheap aren't separate. There being only a
relatively small part of it needed for the worst case estimate you did
means nothing as to exhausting the xenheap in practice: Almost the
entirety of it (with the DMA reserve being somewhat protected) can be
used to build domains. Once in that state, allocations would fail no
matter that large swathes of domheap might (have become) available
(again).

That said, with what you indicated at the very bottom of your reply,
it looks like this part of the discussion has become largely moot.

Jan

