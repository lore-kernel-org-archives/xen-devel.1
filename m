Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA4606A330
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yd33XKMb
Received: from list by lists.xenproject.org with outflank-mailman.1469393.1678221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBDI-0003EX-TS; Tue, 03 Nov 2026 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469393.1678221; Tue, 03 Nov 2026 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBDI-0003EQ-Qo; Tue, 03 Nov 2026 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1469393;
 Tue, 03 Nov 2026 09:53:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOBDH-0003EK-6t
 for xen-devel@lists.xen.org; Tue, 03 Nov 2026 09:53:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBDG-00ABiL-K1
 for xen-devel@lists.xen.org; Tue, 03 Nov 2026 10:53:54 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9af29-8faa-0a2a0a5109dd-0a2a4506b1cc-32
 for <xen-devel@lists.xen.org>; Tue, 03 Nov 2026 10:53:54 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9af32-195a-0a2a45060019-d1558030e59d-3
 for <xen-devel@lists.xen.org>; Tue, 03 Nov 2026 10:53:54 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso26151285e9.1
 for <xen-devel@lists.xen.org>; Tue, 03 Nov 2026 01:53:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a82cebc1sm68260865e9.1.2026.11.03.01.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:53:53 -0800 (PST)
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
        d=suse.com; s=google; t=1793699634; x=1794304434; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZPu4oNtqwwGBqL2eB4CJ9D+U/2UDdFECtUtLQpDzzw=;
        b=Yd33XKMbQXjie8wcsflLjIUTnd4IzFkrzxNLvmM1D2No3jGmh8aHQNzq2SXSTrq9yp
         y6T0f5XtuTdAqUW/Lompe+dssKuXKYV2gEQRWLus/h3o+Hm9tcjLswf21v3sZkYgucRR
         MzhGHw1d5Sj1Ngo3MdApLr8mY+ENVYHZYmTCbM5GtH6bLaBmcZE2Z7zmHxGAJgzwFGZY
         mWQidE8RC5AlM2KUksNAvts7NAlph8RvjzlMCnmoEvV0BMGP/Y8ZT43a4ko5GQDNxTon
         50LnmQ3rhTjr4QtUQoCCyswXZroZA39ee1Q3S6oNkxW1IHFo4pfRzL23mfc9G+Av3T+u
         Zqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699634; x=1794304434;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZPu4oNtqwwGBqL2eB4CJ9D+U/2UDdFECtUtLQpDzzw=;
        b=rT/t2q7qTrBOD2MAqnhAEH6SBJxRi9iPf/xUwFtbK/BIrR3wxlYx1amFfU7D9x5JoN
         wao3eN5F0ivP2kMUeetH3ePODc/Zfw/3KvwXb2G24kHvy4Md6/k+aq6Htz+FBDblyTKO
         CL3okn68x/eVtK34Y3azSihVhZtJP0mNfv95y0VwDefwETAireEVauy6wJSlHBtRcK2I
         JFXiCM+tx2I4LlRA0bTPviaUt31bhe/ZNg4u2AxlfQy2iLgFeorQHQkz8YckMWfdFw5H
         Ur9b10uChxPmXSuBD24EmuUQoMOu26SlKdTYdzLrgUdOJALCrpYvoFk4u9a9obPjux99
         0RUw==
X-Forwarded-Encrypted: i=1; AKwUvBzYNfzC/KpwWur1sgM/HbMRhhJuFMvVdN071rwtoQIrVe3pfc8gU4XIQOIhn3QLAh7xja98Wew9vvc=@lists.xen.org
X-Gm-Message-State: APuU4Z+tBu3kUjIXVqqs3jWQNgWWrB/CgUGS/1Db9ppoFLxQiT8eccNr
	zcBtP+sHVQvT3hs895R3BxdYF5KEov3qVzivyGV/JsNgfWZLGjWVVXrM0OZ5Pe9Y5w==
X-Gm-Gg: AYBFou10BsW6S3HvMJcY9RD/My7DsOis7p9Rlhx58ijyCklHvS55XfOh6n0WUR7NTpR
	hOpgpk07TrpD1oADEraw5WYtEBL5B6v8OTBahnzFy1ng9GoFekniIw3KvV+LrKTSMSx1Xx0g8Hu
	jfagnvcxlLU1LKSC4gSANXNmvt5MZDnWxYwOUeqWxOOzp0Q/oZY+WoToj0AJzca/Kk9JNkBfe/H
	te4oDkbR4UNRkzOM1Jk+layoXmAQe/Qd6x0iDKT2fxqnaVgZSju09xSCMDdnd/ABLrtFKmUmPmT
	yfvRw8vW5lshTIUfzU7Rj2hD1mQFdOdXrCI0GbBCFq9ZmBKdeg3VKPgQbzKOuuWuMoDoF01Dsso
	LFxlhv9Br1uxYfbpxNAhpoAPo+wjWIEfDePNaysmoN4HIc4eHEwI56K7wcdcbEjAiQ9xehS4LfO
	Rp2+gkZyhTqCgJVsghiQurvI+elG6/TSvFR6ssYmk1OWnrBTeFPOaE/EAirmgcthw8RgxO0mEOJ
	9BH+HJaUOPC4vdSC9pxAUwD9Syk1Aji09INfKHxbJRLvcYeyiO4n/4AhnQq+KLJ5HlkLz/5Pyk8
	37Xv0CE5ooxbHN0jpm8G60v1q73tYiqplXDHmB40F/APtZwFH+PNpPt6Uk6BJ85lbKdqsGcPKBf
	pL2n0u/MfMLIIPI5VyhgVqitgtH6J6WE+ufAvMg==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr304436875e9.29.1793699634012;
        Tue, 03 Nov 2026 01:53:54 -0800 (PST)
Message-ID: <e438e9d4-8b9b-43fe-9100-9760709e001a@suse.com>
Date: Tue, 3 Nov 2026 10:53:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
 <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
 <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
 <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
 <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
 <ecfac9d0-eb72-4bb4-8aab-879cfa5dffd9@suse.com>
 <2a44faa9-9a9f-4681-84d6-8267acbec9b0@cortex-media.de>
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
In-Reply-To: <2a44faa9-9a9f-4681-84d6-8267acbec9b0@cortex-media.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793699634-F687577B-EFF1FAFC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2495
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31.10.2026 14:44, Peter Deggendorfer wrote:
> We now have some data points:
> 
> (XEN) [2026-10-27 13:42:10.588] MCE: CPU2 bank 23 status 0x830824448b48ffff
> (XEN) [2026-10-27 18:19:55.593] MCE: CPU2 bank 23 status 0xffffffffffffffff
> (XEN) [2026-10-27 22:11:10.596] MCE: CPU2 bank 17 status 0xffff832036a40048
> (XEN) [2026-10-27 22:11:10.596] MCE: unknown AMD error code 0x48
> (XEN) [2026-10-28 00:33:55.597] MCE: CPU2 bank 10 status 0xffff82d04022a8af
> (XEN) [2026-10-28 05:26:40.599] MCE: CPU2 bank 17 status 0xffff82d0402408e3
> (XEN) [2026-10-29 23:17:25.618] MCE: CPU2 bank 17 status 0xffff82d04022a8af
> (XEN) [2026-10-30 03:25:10.622] MCE: CPU2 bank 23 status 0xffffffffffffffff
> (XEN) [2026-10-30 10:05:55.625] MCE: CPU2 bank 10 status 0xffffffffffffffff
> (XEN) [2026-10-31 00:58:10.625] MCE: CPU2 bank 17 status 0xffff888100b872e8
> (XEN) [2026-10-31 00:58:10.625] MCE: unknown AMD error code 0x72e8
> (XEN) [2026-10-31 04:17:55.632] MCE: CPU2 bank 23 status 0xffff831f00006000
> (XEN) [2026-10-31 04:17:55.632] MCE: unknown AMD error code 0x6000
> 
> Only 3 of these would have hit the BUG(); the others have UC clear or
> an error code that happens to contain a type bit.
> 
> The values look like pointers rather than status registers:
> 
>    ffff82d040......  Xen text/data -- the prefix of every RIP in my
>                      earlier panic dumps
>    ffff831f........ / ffff8320........  same range as rsp in those
>                      dumps (e.g. ffff831fe6b3fc38, ffff832036a87c38)
>    ffff888100b872e8  dom0 Linux range?
>    ffffffffffffffff  looks like a failed read?
> 
> Two things that make me doubt these are real status values at all:
> 0xffff82d04022a8af appears twice, 47 hours apart, for two different
> banks (10 and 17). And all timestamps are congruent mod 15 seconds,
> i.e. this is the poller hitting it on a small fraction of passes.
> 
> I don't know where the read goes wrong.
> 
> /dev/mcelog records match the log lines one-to-one (same banks,
> same order, all CPU 2), but carry status zero in every case. The record's
> status comes from the second read in mca_init_bank(), before
> mcabank_clear(), so that second read returned 0.

Following this observation of yours I've created a patch to fold those
two reads. I've Cc-ed you on the submission, as I think it may be
worthwhile for you to include that patch for further debugging of the
underlying issue.

Jan

