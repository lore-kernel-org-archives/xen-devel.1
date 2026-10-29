Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7B606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJGpZBbA
Received: from list by lists.xenproject.org with outflank-mailman.1464446.1675143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMO80-0005X6-3C; Thu, 29 Oct 2026 11:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464446.1675143; Thu, 29 Oct 2026 11:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMO80-0005Wz-0H; Thu, 29 Oct 2026 11:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1464446;
 Thu, 29 Oct 2026 11:17:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMO7y-0005Wt-SI
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 11:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMO7y-006A7U-8w
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 12:17:02 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae32b2b-2eae-0a2a0a5409dd-0a2a4501a83c-6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:17:02 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae32b2d-5984-0a2a45010019-d1558036e070-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:17:02 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so17808645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 04:17:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94eb8a60fsm93109935e9.3.2026.10.29.04.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 04:17:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1793272621; x=1793877421; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSkLkZDEkmBMrgmXTeq2XFXp5vmN6xBD+I1u0VWPlow=;
        b=gJGpZBbAxOXsD5vvvSJUWp8Y2Yv0KvHQcm+AoOLXoNpnww9Alt0aXr5NH7pBdOA+ss
         PuOQkFiBx1D4AMTGGTjnstNzu1KdaY2q3vojt9LsfB9h6EuMPAP8wq+lvMFaXI/CxvgW
         7OU1bbVpW3g3CM8FvBzJH9aC63DCjhXLgMih8rsYLUI9DI845x9ZUowRIOZtr6t8XP6K
         GZ/CwCouy0AP/Jr9dhoppeUczF8Ubk8Z6nBYAC8WvP/dVZTTxNKHFGGsY3FuIX9u+38N
         y0FpsHxmB87PRGEg5fHbzj0EeRVnrt4tqzUJN81Nu3D9GYKBzHGatay1PDj71SirPDTC
         QReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272621; x=1793877421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSkLkZDEkmBMrgmXTeq2XFXp5vmN6xBD+I1u0VWPlow=;
        b=GQoxaDEpKu1XNUdGYon4qx/T+eykadwmEQgq7bVcSDlUBvuursJEObqpBu/WMvZ+06
         BhaiwOPGlI+/rgLa1R31e04HyXAmYutpWR40jPRp0xhR4MZTos8hRQyLMn4CTP2ZF5HO
         VFG8tTEeh0czcrDrxykHoPXEXvf9clmg/SPYzfc+VMWCRN3/wXNH0OBUBNtvqHhe3mXa
         jqyQoTW2cVlEUjOa+7hbEHYHRr4Uts622U8uLOvsaJtcXq6yacte2GQ1UUCX2DLUNRq2
         wwVI/Jvt4LwHDXPRbPQsqFlJG5sSZC686mjxDp1d7SWAV//1aphRK0sEwPY91+e27PA4
         81Pg==
X-Gm-Message-State: AFq9FYKsQsVPRAQl4P1VVthHkFinX4vrZCO53nj4jKkzespSJ/47B1oq
	BIt2xL4Le1Ixrupk/f5RJUhzD8/4ic04Z6He8s3VtEzkiKD/OeagXMll2P30Wkirxg==
X-Gm-Gg: AYBFou3X57yEtrcc3+H2meL6VfOLGcWtKphjJN2fCXGWx2SvBFpBbb/DK78ICg5Cdjh
	YyydrraU38TyvP/9QXd57VaAOGBTbX+TDWN5QGO+dBhbvK9O5/noF5FreOD3YyNMsdjAw8O/E9e
	eUemIAoZIdurtlVC3kZWv/awgW85ScBRa8wBliIJwpCwYd4oURR1GWQjbG6XhQUsyOS+IsuwiBf
	tRP5qubzaPL9GXvvyKHC2rqulx3XMKSmpDNK0b+ujNBTcDblJprykltBC57DHkOIGnQOumcJYAz
	C0nmg6iG7ssXkD/u4EBbsKJiHQargGtwQFw3QFWQz+nIU3sHqZN5/AOiMBpDRZKk9YwYZr0LEvT
	JXqlsD2cDA1gtOFafaH46CU0FzR5z18sfMHBeGCo1RKuj3o2PkP1GHGQ+8aEUQCjykzatXnUaPi
	wkElCpEJjO6L/0aEjWJ3DnwAQV1JuafOgAj1OazphlGb0Q+cw9mbuuZy8MCPBRvAC9ewdjt8rIc
	AviSgKfsI29mIf6kdHQnxtzufNbgyFe0n2TuZ91ePA9uJVB57NT8M3zUewuOOpPfaZwgnEI6cu7
	ug1HB7p2u1bSGW+DQsfsEbM+XW/c3PX1mzVAJDrQDApZ943fRRUOPshghKnHmtUt132RT+T92KW
	g4kuj7FmF1i/ETmyB
X-Received: by 2002:a05:600c:190a:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4a966586d1bmr111159595e9.12.1793272621559;
        Thu, 29 Oct 2026 04:17:01 -0700 (PDT)
Message-ID: <4ab81f7c-ec26-48b7-971f-1d548362ad57@suse.com>
Date: Thu, 29 Oct 2026 12:17:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: invoke xenheap_max_mfn() unconditionally
To: George Dunlap <gwd@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
 <CAFLBxZYC2ZASN37oUERKPta=HSYVt8n6XjqFUTDGd6D9yCftaw@mail.gmail.com>
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
In-Reply-To: <CAFLBxZYC2ZASN37oUERKPta=HSYVt8n6XjqFUTDGd6D9yCftaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793272622-BCF47757-F5F9AEAB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1328
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 11:56, George Dunlap wrote:
> On Mon, Oct 12, 2026 at 12:12 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Calling the function only conditionally can, when highmem_start isn't set
>> and when hotplugged memory appears above the boundary where the "short"
>> directmap ends, result in Xenheap allocations to yield memory which isn't
>> accessible through the "short" directmap. Accesses from PV guest context
>> would then either fault or access guest controlled memory.
>>
>> With this the bifurcation done by 88e3ed61642b ("x86/NUMA: make
>> init_node_heap() respect Xen heap limit") can also be undone:
>> end_boot_allocator() can be called from a single place, and system_state
>> is bumped right afterwards.
>>
>> Fixes: adc5afbf1c70 ("x86: support up to 16Tb")
>> Assisted-by: Claude Opus 5.5
>> Reported-by: George Dunlap <gwd@xenproject.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: George Dunlap <gwd@xenproject.org>

Thanks.

> As an aside, Claude notes that highmem_start isn't clamped to 5TiB; in
> theory if somebody put `highmem-start=6T` on the command-line, it
> would cause problems.

True, and we may want to do better there. Still various other cmdline
options, when used with inappropriate values, will cause mischief as
well.

Jan

