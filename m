Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0604E7DEFB
	for <xen-devel@archiver.kernel.org>; Mon,  2 Feb 2026 16:13:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1218782.1527635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwXb-00006P-Fe; Mon, 02 Feb 2026 16:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218782.1527635; Mon, 02 Feb 2026 16:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwXb-00006I-Cp; Mon, 02 Feb 2026 16:12:43 +0000
Received: by outflank-mailman (input) for mailman id 1218782;
 Mon, 02 Feb 2026 16:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmwXa-00006A-DS
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:12:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff2f9a87-0051-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:12:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-480706554beso50375625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 08:12:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdebf86sm379995865e9.8.2026.02.02.08.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:12:38 -0800 (PST)
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
X-Inumbo-ID: ff2f9a87-0051-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770048759; x=1770653559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pd+7lDo3eVZCdnGTkinNTQCz7LqpDSPn8kZe3Ij/Qc=;
        b=NSHiYlfFto9K/NCxZAfV+mc6M6yflFlqrKXO7s0LiPvA64l3KeZG5G7hkk0goeeN2v
         fto7Dz7vj8vspEFV8SV8NKMpX1vltt5dhh2v4Dcdf1WB0ARGFDgL7zCPyPTauP2h9ELo
         06lmoepQTQPh+z6JdvDrZXnoZ9lRrYiY+WB5ygRZ42J8fm87+ARg2qI9wrUmM4t34zP5
         +uIlnMP2/P6tM4RJKW/n8F5ppO3VcNEmnY9DfqtcMmig24YAujUgqGhDGBdC6vQ82030
         4N+nqV4M+TuVRi02uo3aVyWZxhUqsloHunJcAUxcY4bPgbWgH2eVgsUZLYxGvs2KAjqw
         YbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770048759; x=1770653559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Pd+7lDo3eVZCdnGTkinNTQCz7LqpDSPn8kZe3Ij/Qc=;
        b=fFzwloIt0lH1ijIJuIj0CTxUYSnVQK1ftDrbH5J5LyVux4OClGgXLukXciqgmkS2gx
         9thQs9nELYUkQTDrftM3oRD9n581QGv5Qsrfpt/lMMWsHUtAbCNK6XfhVbmzXTFdTWCO
         YEZji6xR4yNs43kB3JTgMSdB1npyo6NrA7JXTpuiVMYrJ6JOQdjhvFHOOijYqAfbcay4
         rRBaiBb+Oi213xCZtgJtT01jEWnlpMp9mD+zOUdMLUrJA6BjVpcNPtYYeQAp1s8qYA1A
         Emjx29Gz0/JwoWEStqWigMjYpIgR8CD+x0hIaDnULXOsmfjbpJRHmRvpM6quvLPY9ff+
         FsUw==
X-Gm-Message-State: AOJu0Yy+QCkhOab/vaQBmkSvLJ71KL0sJYXaEeDWFGBqLQc5p6u35CYG
	TFv5pRAeoD3+C9G1sX8hg3/+jTVNww5IYPQjMwDFbU84/Gji8ML5gHlJpCRIg7I3Bw==
X-Gm-Gg: AZuq6aLEpyuE4PEeJ90gtUUJeQ5wfiE1k7VUfJog3EZbgwjhu3015m2BTQ8fdmwhFMZ
	6zCJnTyogF0EP2RKVtixK/XH6/V+/1nq5galU1xxvMUx9D7EoRFo1tb4fi+oWpNa/ow19O1cv3W
	xKv7XTahUz5f8OKIne/NpVTumM2GeTFyb/aqSmFPuhVG9oVUwJchVYeD5EKuKA4Gqn3BjbVjrCY
	dx+32oIiH2K3w7WnS3myHfi1Z9w7iuS7pz2qjvb5Rr0Q+KZlzF6pcbznvbXXqUK2HQuKTBDBPqT
	dEXC6iaCYjvgGCf4waHoaRcAzFgNjad/SSeGr4/eXZ9B1ZNCoekzouB8Oqm2MVldYUjFrfrftRH
	Pu2YRYP8/4KMYk7tnFmOWdjMCjFOBAq8VGnbWkyYiFGDeVzUMIs5X7MEkdrelSyRcW8c3SV4JN6
	xbbvZ1RzTX7+Yr4gX/Hba/pAbYvMn2LuUy0+9u/x4CIG5cbP166Dvf5BwtKaZ2/mYJzX6GNjBUO
	2M7yYOuXRpF+g==
X-Received: by 2002:a05:600c:3552:b0:47e:e970:cf28 with SMTP id 5b1f17b1804b1-482db4a3834mr145369605e9.30.1770048759337;
        Mon, 02 Feb 2026 08:12:39 -0800 (PST)
Message-ID: <858301e5-2ca0-494d-9032-bf5802771e8a@suse.com>
Date: Mon, 2 Feb 2026 17:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MSI: adjust permitted vector range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <52227196-dbc9-4f6d-9c64-a5da5037b1ec@suse.com>
 <aYDIusUCsFZaSaQH@Mac.lan>
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
In-Reply-To: <aYDIusUCsFZaSaQH@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.02.2026 16:54, Roger Pau Monné wrote:
> On Wed, Nov 12, 2025 at 04:45:05PM +0100, Jan Beulich wrote:
>> It's really FIRST_IRQ_VECTOR vector which is meant here, i.e. effectively
>> there is a form of open-coding in use right now.
>>
>> No change in practice, due to the present aliasing.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> While doing the HPET work I had to fiddle with this, even if in the end
>> no vector below FIRST_DYNAMIC_VECTOR is being used there (for now at
>> least).
>>
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -158,7 +158,7 @@ void msi_compose_msg(unsigned vector, co
>>  {
>>      memset(msg, 0, sizeof(*msg));
>>  
>> -    if ( vector < FIRST_DYNAMIC_VECTOR )
>> +    if ( vector < FIRST_IRQ_VECTOR )
> 
> Should vector also be rejected if it's > LAST_IRQ_VECTOR?

That's a good question for which I don't have a good answer. I can't exclude
that composing an MSI message (for purposes other than using in an MSI
capability) might make sense with a vector above LAST_IRQ_VECTOR. Originally
(as hinted at in the post-commit-message remark) this change was part of the
HPET work, where it was an actual functional change as in an early version I
needed to move FIRST_IRQ_VECTOR down (i.e. decouple it from
FIRST_DYNAMIC_VECTOR). There the "composed" message was used to fill
HPET_T<n>_ROUTE. Something similar might be wanted elsewhere, and it's not
quite clear to me whether in such a situation LAST_IRQ_VECTOR would then
also need moving (likely it would).

Right here I'm really only after the semantic, but non-functional change. If
we can settle on also enforcing an upper bound, I think that would then want
to be another change on top.

Jan

