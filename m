Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC2606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GkRpgj8u
Received: from list by lists.xenproject.org with outflank-mailman.1490260.1691197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsFG-0004nP-14; Mon, 16 Nov 2026 08:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490260.1691197; Mon, 16 Nov 2026 08:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsFF-0004nI-Tg; Mon, 16 Nov 2026 08:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1490260;
 Mon, 16 Nov 2026 08:39:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSsFE-0004nB-9e
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:39:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsFD-00HOWU-H2
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:39:19 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac135-2eae-0a2a0a5409dd-0a2a4501e396-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:39:19 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac137-5984-0a2a45010019-d1558032dcb8-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:39:19 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso10544395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 00:39:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb666a3ca1sm191866805e9.9.2026.11.16.00.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:39:18 -0800 (PST)
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
        d=suse.com; s=google; t=1794818359; x=1795423159; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/5ixcRW/CaLEWdT74mfJquVa+n2zcG0diGHhYkbc3M=;
        b=GkRpgj8uVT1ugt9gYzU8MOUbnltrjSeSdfp0hyoCP7r5VGHDFO5NozgPjx3SQN1b49
         s7apaGZTRmFHvKvUCAnCs4L0HPQ9X2GKI2ChXn3IrrfNa+3mH90y1DB4AMstMNmVwnBn
         0NX/zKpybWnst4cuIhFK3vXeES+Knm+KJ0eI/s+57XTIU2RcywfA2l+eccM7JvHYwWqo
         glzXjbGlRIjZsLOH3VCjg7e4Yg9WC+Sc1hHabzzM6knYWblNOdwwCxNYzwClWfrivR1s
         BTsBonGkmjm0Ag55apr6eLctO7BhlO3JuIrGIACXnIJHmVvzBProA+TqA6cGhx1p90gb
         karg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818359; x=1795423159;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/5ixcRW/CaLEWdT74mfJquVa+n2zcG0diGHhYkbc3M=;
        b=SFb5QAqh0e0wtCGpasyGkErrBqPTXQy/6hz7pqww0iDgBjgGuHGtwAxOOQ3+QsdJYa
         B0pVkBHF9bxDOMlh6m7AepzkhTNKboYMc6ksXyhyB0qC4eCZ6d6ttPJ4bdoAaBfmuoM0
         3uxVJMhUeqEpFcfcI1xM3KtNNFvJTAEnPxlHE/QdyApivPgd8spccgyBIZolcclBXvOu
         /Biw7tpgmhUApeKu7BrAAPpwTvTbSsEiMAqI9cvLg47uxFfPr7Uer9oFXELRNWnshsu6
         5AnplNnnecvp91j7xRdl6/YU2DwH6WSrE//2nKSii9593w1kns0chr2TMGuTxnBpoxeP
         Qf7w==
X-Forwarded-Encrypted: i=1; AL+hErFjrs9dEpISweZYE3dqa0RuitJduzwG72Z3PF2KfXe/+8goD9Rku5WNsjV55JOWHgKvyqSFCJ3GIEM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9fWTc9P0+quJ11vSwejqqNLsqAVgiGySboo9ocLRDxu8ILwjH8
	Mo5XvBfTa8HZ9tQpEi2FF3iqBOjxmL7RBNLH29YBXgB1DWPe7TgqhcDigEJjLKHRng==
X-Gm-Gg: AYBFou02JxaNs0Zl8xGO9UGkLyEbDdVvR5vuoYFktdygrzo1Z8ydNpNxeWF1bfhSBMz
	V2NTSAPVQZwn3tYJzJhuOkpk8iau90+xKKtTCk4qUdE6kjxgz2GJ7yXuM/zA9AhSZML2CHkF5Bz
	JmBbAGDoq8yDzGU5vK4GsTWRd/4hnWY2rs31Gmw06mF/h0QMMUP1BPGC8IqXbdmDJJq7IRoHp2n
	GyXtGynCh+1SOIyfTnmNmYhI448vXm8zfqof9070Bd9k/ZSzfQu84OvWDvM8fea8ig+eS4GvLsC
	tVePAjVXm1914eTvh2cNnP8JB5Sse7R0byHyVMF/IGYjhH96V+rfQLH/e54wNXRaQmqgac9XKKk
	VrTl2vMdha0rtf0fDtNi99MZQWqoXP/bAUfkp7D4ch/Fo5HJxzEEK8bkkRSp3HWMEAaDZ1mcr+q
	QXe56dI3nXRl3vFtGpoLIN2lhPC7lwMQfGiRhO/p0xDBndJlVLPj8a0o21oqz1SlWCOfmv7itcP
	Ou7hGiRUNP2c5UUpJDXCQ7NApY7VEl9pzOY/F5Euh+igWupMwD6pLCFHQ9zhU8iOhHgmNDe6Xot
	sZb6VGy34Jhndbs+kR1izzYPN6pnu/LTkM46iuixdVGRDAxRydMxDEkVWdcwogozpkloRFi8cUV
	9aUFi8h+Wo/eN9tB9
X-Received: by 2002:a05:600c:483:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb55a4f499mr143275235e9.16.1794818358644;
        Mon, 16 Nov 2026 00:39:18 -0800 (PST)
Message-ID: <349e1546-ba81-4082-894d-7c820d319d22@suse.com>
Date: Mon, 16 Nov 2026 09:39:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
To: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
 <21557e4f-305e-4a21-8c57-aadcb77fabd9@suse.com>
 <6afad02b-03d6-4813-ae03-65562578db90@epam.com>
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
In-Reply-To: <6afad02b-03d6-4813-ae03-65562578db90@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794818359-1F262757-34CEBE72/10/78276251493
X-purgate-type: spam
X-purgate-size: 1695
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 09:25, Dmytro Prokopchuk wrote:
> On 11/10/26 11:58, Jan Beulich wrote:
>> On 10.11.2026 10:25, Dmytro Prokopchuk1 wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -335,6 +335,10 @@ still non-negative."
>>>   -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>   -doc_end
>>>   
>>> +-doc_begin="A 0-or-1 Boolean operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=, <<=, >>= is safe. See docs/misra/deviations.rst for the full explanation."
>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||add_assign||sub_assign||mul||mul_assign||shl||shr||shl_assign||shr_assign||lt||gt||le||ge))", "src_type(ebool||boolean)"}
>>
>> Imo this wants shortening by making use of regex-es (provided such can be
>> used here).
> 
> Unfortunately no. Unlike file() or macro(), which take ^REGEX$
> matchers, operator() in ECLAIR only accepts operator identifiers or
> predefined operator collections.

I see. Then, to help readability, would something like

-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||add_assign))", "src_type(ebool||boolean)"}
-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(sub||sub_assign))", "src_type(ebool||boolean)"}
-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(mul||mul_assign))", "src_type(ebool||boolean)"}
-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(shl||shl_assign))", "src_type(ebool||boolean)"}
-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(shr||shr_assign))", "src_type(ebool||boolean)"}

work?

Jan

