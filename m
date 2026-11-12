Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76790606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aUhoC6fe
Received: from list by lists.xenproject.org with outflank-mailman.1485498.1688710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRSCI-0007S7-P6; Thu, 12 Nov 2026 10:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485498.1688710; Thu, 12 Nov 2026 10:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRSCI-0007S0-MJ; Thu, 12 Nov 2026 10:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1485498;
 Thu, 12 Nov 2026 10:38:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRSCH-0007Rt-MI
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:38:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRSCH-00CPht-2u
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:38:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af59716-e002-0a2a0a5209dd-0a2a450bd09c-46
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:38:25 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af59720-b7e8-0a2a450b0019-d155802cb475-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:38:24 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so44326145e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 02:38:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498362eb158sm15665111f8f.36.2026.11.12.02.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 02:38:24 -0800 (PST)
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
        d=suse.com; s=google; t=1794479904; x=1795084704; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRNdrRLVs1XU3292BWj6wd7lAPcnf29IH4cpZCkTm8k=;
        b=aUhoC6fea7aSym/yRXKSxIcE/oC1Ce4hE5TwMmLOzhNpgzlGKBx8NiQkpUNAGKaMTE
         0zMfL7xQ/lfTk5Wd2y36riG+67/+h97PgvueairjFcc5IQLY3AjyWOItyqJb28UrImev
         7+TeWL7lhV0GNZT8y+t6E6+B2zqHDznQLw9bOaaglLTa3XzndIhGKvwjzqpoKI2iyK6/
         i71ya1MuV+8aJcTFSXT5ycXu1frMe7NKYPpKjejffFNrGtDUJkKZBLkHsy23C+Jw39eV
         ZjF+zVXyEPFNR9Yr3bjhP7B8vwmK1i+yf6oq2ejO94Fsy9mg151cI2WvpO+0c7fGcxHk
         SRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479904; x=1795084704;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRNdrRLVs1XU3292BWj6wd7lAPcnf29IH4cpZCkTm8k=;
        b=mkKQxdQBeCnq6z3GhSKEI77oBBYcayiFZPq0QkWdJIDtdJnhbCmWR1aHUhvL/kFKzv
         YFVy76NFnl84F3tCOHLLPx9wigID9GNvJADldYJSKUTjeMEXswOWWCZc7BP3tFbt+WiH
         B+OFpP2z1W5uqJwERytpYBvrPa3OWfojYa8ZsVTAfhqUx+eCJptv4OyRLjF5nNJ9O3lR
         mYY/9ypKdoiCo1s2SOjy0DYrTZrEm7aG4SnhoKS4Bmeyjf2N21iAGQeE00AUuwLXrG49
         Y8AqcnPMkB722SNhCa9iD43VdUTnUVa1HEro7iByCjJ2K50ngJzD+E0o3YiT7SnGok8E
         73CQ==
X-Forwarded-Encrypted: i=1; AL+hErGDXhbSYFtPxivxrxc61SpXA+LdJBBQhfXdxRVaNMErYQbmFm4nEc6xf8MKp2zEC4emZAIu70F9Pfo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8ydqHAKjDKSr1fkTYXf2mHLhcEgMBGROfHDPMXxChx/giMaeHq
	5eQiDXqqI+7uGvkOhkJYbxhDZrts7A36S4Et989Z7MR1ABDKBHcy8BKAHMIHUzcZbd1O356W6j9
	1NR6gPw==
X-Gm-Gg: AYBFou1LDScTm83lu7SNX29ThCxsf6ZnByGTLJ1zTO0xWCoB5BJTI+5571eZOyAgJMk
	Ix9Q0hkjvG0w+HwVtnzRsqUTLA+STEsbNfvDgu0uuZzKc/ufGuO0jXoo6enLUPbCZMNhseE4kxz
	j24KB1HtA+EDydiWnvSxIpQw2jQ//Vpf2ocBpSr2A81+JlOs80D7e7Tnn12YJm40O+B94Gyql1K
	I69vPAKiRPfnVO4Sh5s6Dxvv40LXDxTekpio0nFSlHxNlv6vPPr1h2XRWSekEQqJecHQg1g77zC
	i1ZqJjYIAAkw2TMIUVz93kMMbH74ve0/EZT5G8kicCnQC5QKlMYQFpB5ve2WIfBbYv5O+0coYq/
	8DElSpZHWJjQi7KyC+u8DuHmCeA8q57MlHULY2AqUONH/yeVqFh0T8TtMRmFbtsk+BjYZ9Au+XP
	uhJ7WGruFCzIdZ8mMJLjzzvx2BqDgaefC4wqtOn17bV4Z+vHiSO3XhY/POkwZQoCp7pFHo6ObIu
	tdSLycZiSzTnZW5hiZ80vxnUS3k9baUZbocpqqFJ+49NE+LZj/JCM7xkSgnp5O34nmndksoEYd7
	wI51DLgC7Q3TjAvrylF+JcbrQRhUg23QSbIJ4J1vYRr+Gm73z3OhNHTI9aV+84BFP8Qcwl/8qut
	PyNFiT3LtkOhb6oFDNA==
X-Received: by 2002:a05:600c:b99:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ba09363ffcmr87340675e9.10.1794479904292;
        Thu, 12 Nov 2026 02:38:24 -0800 (PST)
Message-ID: <90380d1f-cf67-4026-aed8-1a1ba1e388f4@suse.com>
Date: Thu, 12 Nov 2026 11:38:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Treat the vector of INT imm8 as unsigned
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org,
 ross.lagerwall@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <47ed6cbd-77af-4328-858c-80d0ecae50c3@suse.com>
 <20261112103134.113023-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261112103134.113023-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794479904-18AC89EA-8980C06C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1831
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 11:31, Stephen Cheng wrote:
> On 12.11.2026 10:29, Jan Beulich wrote:
>> On 12.11.2026 08:23, Stephen Cheng wrote:
>>> The decoder sign-extends all 8-bit immediates (SrcImmByte). For INT
>>> imm8 the immediate is the vector, which is unsigned. So INT $0x80 to
>>> INT $0xff put a negative vector into the event (e.g. -128 for 0x80).
>>>
>>> hvm_inject_event() then fails its "vector == event->vector" assertion,
>>> and a debug Xen panics. An HVM guest can trigger this with the forced
>>> emulation prefix (hvm_fep).
>>>
>>> Cast the vector to uint8_t, as is already done for the port of IN/OUT
>>> and the operand of AAM/AAD.
>>
>> I'm afraid this isn't sufficient: At least x86_insn_immediate() is also
>> affected, and then also for the other insns you mention above plus quite
>> a few more (in particular uniformly for 0F, 0F3A and XOP08). I think
>> this needs sorting in x86_decode_onebyte() for all of the former (some
>> of which I then need to mirror into the APX series for Map4), and in the
>> switch() below setting ctxt->opcode and s->desc (where decode_*() are
>> called) for the latter three.
>>
>> There'll then want to be a 2nd Fixes: tag for the commit which
>> introduced x86_insn_immediate().
> 
> Thanks Jan, I see. I'll move the fix into the decoder and add the 2nd
> Fixes: tag in v2.
> 
> Two questions:
> 
> 1. Which other one-byte insns do you mean by "quite a few more"? I can
>    see the shift/rotate counts (C0, C1). Are there others?

Having done the APX side change, it may indeed be just those in the base
opcode map. "quite a few" covered the other opcode maps which I did
mention.

> 2. Should I keep the existing (uint8_t) casts at the IN/OUT and AAM/AAD
>    use sites, or drop them?

I'd prefer if they were dropped in exchange.

Jan

