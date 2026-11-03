Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA368606A330
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bbJjgeIf
Received: from list by lists.xenproject.org with outflank-mailman.1469564.1678339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCoa-0007iy-S0; Tue, 03 Nov 2026 11:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469564.1678339; Tue, 03 Nov 2026 11:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCoa-0007ir-Os; Tue, 03 Nov 2026 11:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1469564;
 Tue, 03 Nov 2026 11:36:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOCoZ-0007il-7i
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOCoY-006y9d-Gj
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:36:30 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c728-8faa-0a2a0a5109dd-0a2a4507a5e2-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:36:30 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c73e-b4ea-0a2a45070019-d155dd33c051-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:36:30 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so2155464f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:36:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8bd8esm24735187f8f.42.2026.11.03.03.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:36:29 -0800 (PST)
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
        d=suse.com; s=google; t=1793705790; x=1794310590; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yh/gEcQvNsQFUfPrcQnHu1y8G7e5fB+TNySwBBot0c=;
        b=bbJjgeIfQvP2TYiqVNnxginFs66WKWMF8JiymmBV9O0cRXK8lIoS9E5+PUWN2ppnnO
         N9zKb/EFENg4cYAhr1FiNxVF2joZ87BAdaoQRu4U0hmttxiQIn6wbUhGLTqweX0lrMR3
         BABL20H6FGLa0JhgF+InKJCUmAetB70gBocq1v9qg3swOhP6y23xoW1pKwGV9wxNWaNB
         b8z5TrnAxgLRRggohprGXIo3XvFYfglbm3CiNk0IKnbXCF/PFz65HLOcXpBxb0ibouiu
         2vG0wroKeJq7cJkxS5SP8zVPTSqi669DCpVUGfdpGeZR8Dgg7OcVXkjFSxTmG8CAPbPs
         F0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705790; x=1794310590;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yh/gEcQvNsQFUfPrcQnHu1y8G7e5fB+TNySwBBot0c=;
        b=tTHdR+C1Wmtzk3MDF1ymHORXqlqcAMoBzYDExbbIhMlB6K8mxPIhnyi/wZv1knQewA
         +Z6GEpgt83Kzf5ohXZbZgnJlktbnswGRpaRqlL89LLMYsSWY2AlfxW3tlEmf4g5xxwWH
         AsPtcuSlhij5EsyNvIlMsbyL0xrDKIySS47nJV+Re1fxQ1wg2v5VA75IhynCHRYW3XbD
         LYUYyH52BgcmmeDBVSg6G6KE/y3zwME5UgavBylpo/0mVma0l7tbGJUn5PpxDzr2Op9+
         wVVJYdTx9YI5bvm055C39Tcg4qT7Y+eV39ufQMO28GLbZ9oEDis5M8+7VTdgt63fbKwp
         VEHw==
X-Forwarded-Encrypted: i=1; AKwUvBx8ldrEtJtMI8FCw1C+5IvL47c39t+nsWtv8AyPf3XH+bR3aytNwCGg+MzI/hjJK/TOZEpOFQ1ecPk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+exNk+Pq/Zhl8lL7SOKinJOrsJj13xI4sedIF6LzDgvHZRgPxl
	akSzi5+Nn/juSzuxZyVLHy07bygLAEZ3BdS2Maeu5TdIMCn1jgZFrwSB0rikkBWquw==
X-Gm-Gg: AYBFou1g1XeDDFxk73DM9/bKBzbWlydMEWuWzuDSbDxAhqwLFDJ/lJKxlyoLsJgFrFA
	hqZ3qOkMKfA4/pDqMMQ7nmntE1CL4Dv8KNdO+6FzOUzms31BppyrhxcMJyvqPKVHGFESpM9tZK8
	BJ+YpRVBpIaDxkPU/Rk4JhwKr+b45MK/xw8yMO0LV9xnpmacLmdnG+Ioz3CeclItU6kKNaXI9NL
	sWAG7oxyh8qhZsUJNYbgzowvrCvrFa0q078o+RINZCKcejDvioGivJiJr3WfyCc9FSn8y5pITq7
	54KJ/uawC9ArmTeJ6FMnJVlCGMoEpwIKltffNjCtafGN9CCUsJj22WZbnn03BSi5mns9eTPw/dD
	MItSPHdxC3Gmse0nZfT0YGpD7l6R8SDFUWT8MbQ/myjLCTE9E82aCzQt2cu+fqW28UVmiq19nMh
	39Uu/qvTKX1h1gPcJgdwb8WLAAEuVtLu5RFsljjjhmQZrIdNUb7WXwhrwbQ9ai/BYPsoIPCxpaQ
	ffmbeZPqFpN9K04H37Mwr6f1bu8S0Mcc5diqdDu2SEg/nf2cH5sgypVWgynolVZ8awxNRAGZSMM
	JhlVktWZljkeUZHJr9I9IS59M+UB2TmFIWvq3N9E1eof1bOHeWzjDuUOLu0Rk0U+4ELiv+9E2qz
	JdVn6FeucVCCAJaXG
X-Received: by 2002:a05:6000:128b:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e6e307437mr20793305f8f.16.1793705789733;
        Tue, 03 Nov 2026 03:36:29 -0800 (PST)
Message-ID: <3b08e987-30b3-411d-a9db-27a18196c5bb@suse.com>
Date: Tue, 3 Nov 2026 12:36:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Improve code generation in
 async_exception_cleanup()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102174234.1764070-1-andrew.cooper3@citrix.com>
 <b3e50554-a045-42b7-908a-7e7c34c0dd90@citrix.com>
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
In-Reply-To: <b3e50554-a045-42b7-908a-7e7c34c0dd90@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793705790-A7CD7AE4-F1EFBF5B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1450
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 12:00, Andrew Cooper wrote:
> On 02/11/2026 5:42 pm, Andrew Cooper wrote:
>> Use new helper functions to simplfiy the logic.  This removes an alternative
>> behind the scenes.

Does it? __scanbit() engages an alternative only when its 2nd argument is
BITS_PER_LONG.

>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> async_exception_cleanup() is complete nonsense.  It's not remotely close to
>> how interupt blocking works in x86.

Are you perhaps expecting something that (for PV) was never intended?

>> --- a/xen/arch/x86/pv/iret.c
>> +++ b/xen/arch/x86/pv/iret.c
>> @@ -31,8 +31,8 @@ static void async_exception_cleanup(struct vcpu *curr)
>>      if ( !curr->arch.async_exception_mask )
>>          return;
>>  
>> -    if ( !(curr->arch.async_exception_mask & (curr->arch.async_exception_mask - 1)) )
>> -        trap = __scanbit(curr->arch.async_exception_mask, VCPU_TRAP_NONE);
>> +    if ( !multiple_bits_set(curr->arch.async_exception_mask) )
>> +        trap = ffs(curr->arch.async_exception_mask) + 1;
> 
> This should of course be a -1 rather than +1.  Fixed locally.

Acked-by: Jan Beulich <jbeulich@suse.com>
(with the description corrected or you pointing out which other alternative
you mean)

Jan

