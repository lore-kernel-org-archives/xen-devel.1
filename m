Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF49606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LUcNuS8R
Received: from list by lists.xenproject.org with outflank-mailman.1501854.1697869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW7gz-0006f2-Pa; Wed, 25 Nov 2026 07:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501854.1697869; Wed, 25 Nov 2026 07:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW7gz-0006ev-Mm; Wed, 25 Nov 2026 07:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1501854;
 Wed, 25 Nov 2026 07:45:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW7gy-0006ep-MF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 07:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW7gx-007osy-NM
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:45:23 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069206-8faa-0a2a0a5109dd-0a2a450a9ae4-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 08:45:23 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069213-f2d2-0a2a450a0019-d1558032c471-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 08:45:23 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so47301915e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 23:45:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b2c5sm493697085e9.5.2026.11.24.23.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 23:45:22 -0800 (PST)
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
        d=suse.com; s=google; t=1795592723; x=1796197523; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkHKq98N1UkqLNwAa9XbXanGM8SdRSZ8FEQ8JzVuubY=;
        b=LUcNuS8Ryq84rU8TLDAQ6qoD3yWVasfQndSJKbHpUnJt5XkjXh+OKyLCL97VQSWsx0
         yUU+IQKk6Q319oqXhsuvnlJm5aN06qnlW4sNL0MVqjpyhkVIF1S3Rak4HZRAZ0lggRLp
         DTvx/MpxiFNFPxsTCSksamqgpks844sM9lWDmE71abMZ3vftV/Zjq6auvfumwHbx0cVP
         PUx0tgezg0BSeoF/Zg/01LR1cPYJPGe6vRsofc7zD853y17fIT3gfWIxCDKZSNgawqvP
         KE74Lg8SfzXGWqJvNaMkcQsNT/AQH0xHgxSsmyv3Ej6oO7htpaEUDgKexqFBFegRz2Kv
         TcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592723; x=1796197523;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkHKq98N1UkqLNwAa9XbXanGM8SdRSZ8FEQ8JzVuubY=;
        b=tYaxBqpPEoTDSeeqZncS8rJ1OMDKVKW2S9ZNP50+X7v/pHtygMnqVAV0splZSbQPuH
         LlTdvv53/PaZcp/lCYZru++8FiYdHUQy49jSFki27vRiMkvZqiXfUMhMimVae1OHaX+I
         LpKRG7MeBwQhAoseH4GFg4DMvwY809XTpiwCcIXCPHkeJ1hDydhOlBv/TLR9wXJGTxnP
         uf5/3y6QJF19PNTCGOm+wdNhcb4AZucs+0chyE47ZuVopGnYhYdZE6F4sicSqowx/fUR
         jQTbpmMRUoNujL/lmBs+C9IVJdzlm6TLNg8SABtFGhyj+k6+bWaBnnoILpN0LJpBbcWG
         pYDQ==
X-Forwarded-Encrypted: i=1; AL+hErGnSE1EJ7dCNZaKqhg+cr2MYOaM9e86T6Ae5ACXUeh8OBOkk08JHsVy3gwEYQU8GIhzPX3UBgzkbdE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9lRb+Iz8+cyUJuj92CEqlLivxv/Yk61RX61NcPmLCXDBKlWc20
	CzvlWDX8oatIERnFDwpbBuqD3j8ZY4N7KdtQMfeROiU5SOOGJj8kEo4+oXV/6Li8vA==
X-Gm-Gg: AZFdTZf6RNKIFVkz2uPRAx2vDBQRDoSeDz3BG7JNtJyZalYwHgzfbCyHbvoGMfO2UqC
	A6oTxLLT9VtNiXrl58PrbMG7rqneGAAZKkvleKafFjk7ylMAk/llB3UlvJxJxiaG2Dz7VKBj/KT
	dB4TdzzWPpX4kgfDHtL41pIzaK+QkcmhB/JguuRD0kokjE40LRUFa2K8O3e8Be0l92yqhCPVBRY
	8RU9/w99dq6Ez+OnaRljgWDqi3FiVzhhhPt9kvZim8fir7m2NEAkSgz27LCzk2a33yMhauNpnow
	OJ/M9pcM//n9Y0AgNZH98HutNa66tUnAAwNElclp5CXXyYARzxgEUiNUObqyBMqyHMBvaqhi8ff
	iZ6FVNZ63hlvqR1/wcGC1NN02x034aX0GODqbjeKpoCGl5go8+oDJAriOMwBk52dZTbS4iD+3Ca
	kOKQjnV7Jexj+OmPO7ZV6zjyGnSSCHIqxvLDnDTxHK0VCZpjs6K9/lLpEXIt7BOghiNBOOQkQRo
	eS+QlwY1Uu9tQBK4mWg/9ur9UygNhlTzrvwNirUiEwzSdwEEIF1b+/+ilNLyioLporaJGYVrmHf
	MxWGAZLi9Ih4nNDWtjTkFN/tVrN5VWIi0vWfHs+E0I+pyIptGV03sXR0iXx/jVhtL/lQk0t+J30
	ptr+1zwZtQUrsF7j9
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr366587715e9.19.1795592722902;
        Tue, 24 Nov 2026 23:45:22 -0800 (PST)
Message-ID: <2b95c2a2-f1f8-43d6-940f-3def09fd2eb1@suse.com>
Date: Wed, 25 Nov 2026 08:45:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/PV: correct descriptor read sanity check
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
 <ef9d7231-32c5-4b7d-aa8c-b54cc0c48349@suse.com>
 <1341e7c0-cde4-4f70-9a6d-141ddddb4ea0@citrix.com>
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
In-Reply-To: <1341e7c0-cde4-4f70-9a6d-141ddddb4ea0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795592723-526DECFC-05EF53C6/10/78276251493
X-purgate-type: spam
X-purgate-size: 2529
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.11.2026 18:11, Andrew Cooper wrote:
> On 24/11/2026 1:30 pm, Jan Beulich wrote:
>> Checking what LAR returns against what we read from the descriptor table
>> requires that we check unaltered values. The clearing of L therefore needs
>> limiting: Do that just in *ar, and use the then unaltered desc.b in the
>> BUG_ON() instead.
>>
>> Fixes: 8d6e195a2def ("Adjust emulation code to deal with compatibility mode guests")
>> Reported-by: Roger Pau Monné <roger.pau@amd.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/pv/emulate.c
>> +++ b/xen/arch/x86/pv/emulate.c
>> @@ -37,11 +37,12 @@ int pv_emul_read_descriptor(unsigned int
>>              return 0;
>>      }
>>  
>> -    if ( !insn_fetch )
>> -        desc.b &= ~_SEGMENT_L;
>>  
>>      *ar = desc.b & 0x00f0ff00;
>> -    if ( !(desc.b & _SEGMENT_L) )
>> +    if ( !insn_fetch )
>> +        *ar &= ~_SEGMENT_L;
>> +
>> +    if ( !(*ar & _SEGMENT_L) )
>>      {
>>          *base = ((desc.a >> 16) + ((desc.b & 0xff) << 16) +
>>                   (desc.b & 0xff000000U));
>> @@ -57,7 +58,8 @@ int pv_emul_read_descriptor(unsigned int
>>              asm volatile (
>>                  "larl %2,%0 ; setz %1"
>>                  : "=r" (a), "=qm" (valid) : "rm" (sel));
>> -            BUG_ON(valid && ((a & 0x00f0ff00) != *ar));
>> +            BUG_ON(valid && ((a ^ desc.b) & 0x00f0ff00));
>> +
>>              asm volatile (
>>                  "lsll %2,%0 ; setz %1"
>>                  : "=r" (l), "=qm" (valid) : "rm" (sel));
>>
> 
> This is a TOCTOU race, which reads the GDT/LDT 3 separate times.

Yes, hence why it's debug-only code.

> Nothing prevents another CPU issuing do_update_descriptor() against this
> descriptor, and hitting the BUG_ON() despite the care taken in this
> patch.  Nor is it legitimate for there to be such an interlock.

Non-malicious code isn't going to update descriptors when they may be
in use on another (v)CPU.

> I suggest we just delete the CONFIG_DEBUG section.  Because the segment
> registers aren't architecturally available for PV guests, this check
> simply cannot be made safe.

Sure, we can also delete the section, but double checking our "manual"
calculations seemed like a good idea to me back at the time, and still
does. Hence if you want the section removed, may I suggest that you
send a patch with what you think is a suitable justification? I'm okay
to ack such a patch, but I'd be less okay to make one.

Jan

