Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FDF606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BIxI8D6s
Received: from list by lists.xenproject.org with outflank-mailman.1474137.1681321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsUT-0006eP-IO; Thu, 05 Nov 2026 08:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474137.1681321; Thu, 05 Nov 2026 08:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsUT-0006eI-FR; Thu, 05 Nov 2026 08:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1474137;
 Thu, 05 Nov 2026 08:06:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsUR-0006eC-Hi
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:06:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsUQ-002pCL-Up
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:06:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3905-e002-0a2a0a5209dd-0a2a45049556-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:06:30 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec38f8-b57f-0a2a45040019-d155dd31d554-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:06:16 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e47347279so897768f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:06:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecac1a1csm8357312f8f.12.2026.11.05.00.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:06:16 -0800 (PST)
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
        d=suse.com; s=google; t=1793865976; x=1794470776; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6+Zl7fwUtq3UYi9FIJP2j29UMwyKYMiUj5q0PWhwR0=;
        b=BIxI8D6sqh8rg4yWLcIf0aPYZbek57ABhr7t+2ErUoRamnrTpnE6TcGM4ERu/lwmOR
         zfKA5Ikay4oett8YZwoAdIPmo6/a5Zo4tPE8CFyI71+Rs8wR0AKyuoo6HtFTQRqTblIH
         M7YzPoKseVuZCNlaJjFpmnBFlqdVLNYUeikVpyHKNSaNx4HeslCOnnuOuN4AWdnK9m/H
         jTYf59nmfeLi9CyPeeC41/mZaFAwXiKpwmDXe18ndWV1q5ikNWoJo83LBZqZWVOzlK3G
         eqTakz6pIvyCaszt/lJuhFDIvfxnd8WZScEVOtvXOaU1XptOaEfQ0P9xH/RTeUWXOFF7
         gkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865976; x=1794470776;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6+Zl7fwUtq3UYi9FIJP2j29UMwyKYMiUj5q0PWhwR0=;
        b=rjHUT3KZ407sFXUMst2VcRJihl1+HKVeopcWUce1vwwRX6+tVn4ZlOxUDAnb/Vl7l9
         +sp+GYZ9vyb/BQ2cEel8tg1kO0QyiKNm8lStRnNhLY96MuIB2ueUKG8qB3ncGQrDkKxr
         IPZdZY6w1vFy4dkSS7CkbXQHZDy8T1Vf+ZCrH8BMefqLfcvlyACYmP4srMzW9XZKAbcw
         HdnNawnzvidRKYL9VPEFk8WVPUc0QRZZ4NLDxH2KJGsB2aEGdppC/uY0mqrNk3hKeH4c
         yqdSoN8rtszrTPOqedxb5aNbTXm6tGljgG5HgWcn6lEJ+BVUpf3gkyJcZ1+cJQhFMzBl
         3biw==
X-Gm-Message-State: APuU4Z/yHLUurQ4ucDuLYIu6c1M5iqlBuye8W8Q3NN4CTWozkYF48yiv
	D54xkkxFvXYk+DUl7m8TqMk2Kg+JKnQgGoQg7fCfacdRd29ZNGo7GFmEKUj+31RFyQ==
X-Gm-Gg: AYBFou0mKo1g26aOtorljpUUv1xBQqnb1wi/2ooa+DgNVb2nyKnLiVCQOKCMTdOMtYz
	cBG6nCoKYTMmn1zVlr1cPAjNhjJPuv5GmN2j3wcXS+nsExgKTOvkcFwHPgbdAlkPB3RXxOMgqVP
	YSScNlxsdjMJ5SEPNBs72iCvre0dInAmLogYxykwbFfHYJoZligwqBVA62axm0w13rq0qMdJc2B
	v3xDlreMd6ak+G7dPkYTBx0hqg7/Zpnn1uYrApvqlz0BaPdDME3wMtcm15SZizdPsKk55u7jx4s
	ecwlxbgA35vkXnYXnY8tqog54a1ALrueX0+0Uu/nPcknfVyQACLYj2sOV8/Xwr3KlMYOcj3Nr6q
	WEQIcEHnFac4majEdcW9C8MpjkkZk6rFWA7M2oweYKM63mIxi+aJVEN0X70rF8G9Ijh0yXUSj3V
	9/ovo91vC1oJbEq22zL/QYmjdOdPBEdcU7k3b4YETB1BwV4wO14DCsT5uJRChQHfBVHzVeyMvOb
	GHez6DPkH6GoqkCZxTLkHNK2M5LqLkXhKFakvLyRi0v2Ay1rCsb4sqNccdrK/LWq/PjEBsWdsaY
	DN1R2VaELyS8lToExohBOttKO6/UpJAqXoFV5yu41PYiYkvzp17SxcTsbFV3Uy50KcjH2LfVMXE
	e7VAxYczUdheGmcw=
X-Received: by 2002:a05:6000:40dc:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e6e2fa50dmr40296781f8f.20.1793865976428;
        Thu, 05 Nov 2026 00:06:16 -0800 (PST)
Message-ID: <ac9eb028-6585-4318-b0ee-e6c86624722f@suse.com>
Date: Thu, 5 Nov 2026 09:06:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEADbxD4mL_bXy6@Mac.lan>
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
In-Reply-To: <atEADbxD4mL_bXy6@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793865976-52AC8B50-8C08F2F0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1071
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 18:32, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>> Why does find_memory() go upwards, while find_kernel_memory() goes
>> downwards? And why do we use the lowest part of the region found by
>> find_memory() rather than the highest part?
> 
> find_memory() should probably start downwards from 4G.

In the course of replacing that find_memory() by pvh_steal_ram() (while
converting to rangeset-based tracking) I learned the hard way that this
isn't possible, even if it ought to be. Linux won't cope with parts of
start-info (at least the module array) living outside of the first Gb
(in 32-bit Linux it may go farther, depending on CONFIG_PAGE_OFFSET).
See pvh_level3_ident_pgt[] having only its first direct-map entry
populated, and pvh_start_xen() also only updating that one entry. Which
causes xen_prepare_pvh() -> init_pvh_bootparams() to fall over anything
living beyond the 1Gb boundary. (.memmap_paddr would apparently have
the same issue, just that for Dom0 we don't set that.)

Jan

