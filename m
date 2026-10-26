Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB3606A322
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gMWrFm+t
Received: from list by lists.xenproject.org with outflank-mailman.1460972.1671868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGsZ-0002n8-Ey; Mon, 26 Oct 2026 09:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460972.1671868; Mon, 26 Oct 2026 09:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGsZ-0002n1-Ax; Mon, 26 Oct 2026 09:20:31 +0000
Received: by outflank-mailman (input) for mailman id 1460972;
 Mon, 26 Oct 2026 09:20:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGsY-0002mn-Eb
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:20:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGsX-002W7F-Rc
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:20:29 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1b50-8faa-0a2a0a5109dd-0a2a4505bd04-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:20:29 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1b5d-4cb1-0a2a45050019-d155802ab1f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:20:29 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so16326575e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:20:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a4cb7bece3sm125050545e9.10.2026.10.26.02.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:20:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1793006429; x=1793611229; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZZtdeo0r13OowMhI6KbVaMLgC5sVk5HN/T3NQ7FqB4=;
        b=gMWrFm+t1mAaxAIh+sF73jIl7RthmR0/Cc9SHERBMlVxGgVe1PyTpaINv5mn0WiQxy
         DKBHF/Nm7DHmdAVhKkOx+gzfCCDYY8yCDYi01PIvgwblj7bHZKxKHv4IjtUdu95PFLXQ
         8aWhT82G/MBW3/e4FEMGNDC7LO0bcH094uZ1PoWurnKW4dG192xcpV820DWMYydZklBc
         dsHjyXOlR3c+aXh1XkC4RB+PAlPwHy/WjDwr4/1k+Ck5GyskJ/5NmFll+Wk6U2jXJCTK
         dwpDzXOoqFPKnbGIAlgjwveH5KvFkIG/bVZ01K2sQeJVSWEyuivPUI0hWB3u2vldv897
         Aa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006429; x=1793611229;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZZtdeo0r13OowMhI6KbVaMLgC5sVk5HN/T3NQ7FqB4=;
        b=u8WngVNj2pVLNNTuwYg8BjoDCbGzJ1J7BnfkQ8nY3BDL+Wyh1L3VId8byYfEj6BpdQ
         Z4ZQdsJu2gD2vg6kokBEQH4LycwUmHgCEOj6f/vHue2V5V9XVCvscJjYH6nAXRyZIewl
         RttS2R/aVSJy0bLQcabpnU7Q0PmtOUMYdFwdq5mee8qFv8+t3Y9RIkPlGoMXH5OrrSwQ
         BgpXjbX47idqWJxnZXsC+Qw+8D9Hf0PyCoTskgp4XY/6vlL+1GXL+c/TnjtLt9T/qE/a
         QxHfBicbo5pV8cXr/v1AiMvyh0A5th7Bw+ElrPlIuhKUQzIRT+6JGCnMWmrjqXzmxN9Z
         TdOQ==
X-Gm-Message-State: AFq9FYLvKyLgojdt2OVMcz/ejZPfx7/phTp2Rfv5EJ33l8LFa1+fztgH
	teK/rdKCdN9FjFLLmApeZlWAaviOkM0M6xR59F70TqHV7mhzSaCmRPcFBuorUqKrWA==
X-Gm-Gg: AYBFou2ZVdA+DhmUP50bFMTCBeY34kl4V4JtpGogJ/rCnTbu/8GoH037KjircHaRNAr
	SDRNdabJgQJ9b9Fiv1QKDLHPVPyxo+zz9hxk4wsIx9ZES25iQYPY5aTfqpIHJiAT6jKLG6lU0pE
	aZ0Ma9vY5BxmjS7rQcvNmtL/l8D+QHMh9I1kX7tzSzHvteB6pwvPvkCHYSyxdG68dXcQSWjeMYj
	Djd+fqm5awc3tYpPaamiJlAKsmGJNx+J+VKqdg6+1Ao5jwkXirax9IS6GFsf30G183PuhOIAPie
	+03bEcXLtFHHAApBaD/9POQftwlNlBCeCrG1cvVXfz95plqUpEUMRAEG2u7RBTrt2eJ7w/w2j4s
	IrDc+2q9GwF0Fj9pMN2kQ61KaneQ35k+1fHujlkG/yyXifN3i1KEuf+q7s4+d3kdHwNMZIKpuHM
	P5QVrXIOIar+a51dBHzdnhOJ9MyMBhFXCQkE69OIHSuEDPZW4UPkCNWen8OXu6v5l08HsejyMfq
	hC8DSJ6Xiwsb1KhLezvobfwMHK9PajIVsAVm7LNTZYvmtaSycYb1ibdpiueyez7sQ/Tv8+NEvEX
	PE24XWyDrcY0LvMN4p+TmoL2mYQAJxy+rYanEjlE1oY=
X-Received: by 2002:a05:600c:c09a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4a43a2d1805mr72509195e9.15.1793006429226;
        Mon, 26 Oct 2026 02:20:29 -0700 (PDT)
Message-ID: <8bb8d015-b9f5-419f-bfd4-e2810eda4fba@suse.com>
Date: Mon, 26 Oct 2026 10:20:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
 <2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
 <87y0bpte78.fsf@epam.com>
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
In-Reply-To: <87y0bpte78.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793006429-F64B42A1-908E9BB5/10/78276251493
X-purgate-type: spam
X-purgate-size: 920
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.10.2026 03:09, Volodymyr Babchuk wrote:
> Mykyta Poturai <Mykyta_Poturai@epam.com> writes:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -648,8 +648,8 @@ config SYSTEM_SUSPEND
>>  
>>  config CPU_ONLINE_OFFLINE
>>  	bool "CPU online/offline support" if EXPERT
>> -	depends on X86
>> -	default y
>> +	depends on !ARM || (!HAS_ITS && !TEE)
> 
> I don't think this is correct, unless RISC-V also support this.

I think this can be looked at both ways: Yours or "RISC-V implements
arch_cpu_keep_online()" (even if only as a stub right now). If there
were constraints there, they'd be added here as a 2nd "depends on"
if and when the stub is converted to a proper function.

> Maybe introduce HAS_CPUONLINE_OFFLINE as we do for similar features?

Irrespective of the above that's certainly an option. It might also
help with the unreachable code issue pointed out earlier.

Jan

