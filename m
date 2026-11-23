Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAD606A332
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cNvQE1r3
Received: from list by lists.xenproject.org with outflank-mailman.1500400.1696559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU15-0002ls-EZ; Mon, 23 Nov 2026 13:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500400.1696559; Mon, 23 Nov 2026 13:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU15-0002ll-Bb; Mon, 23 Nov 2026 13:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1500400;
 Mon, 23 Nov 2026 13:23:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVU14-0002lf-JO
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 13:23:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVU13-001tpX-HG
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 14:23:29 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043e4d-e002-0a2a0a5209dd-0a2a4501d768-12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:23:29 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043e51-5bcc-0a2a45010019-d1558032b175-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:23:29 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so25174465e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:23:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm346771975e9.15.2026.11.23.05.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:23:28 -0800 (PST)
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
        d=suse.com; s=google; t=1795440209; x=1796045009; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NeFDFV4pN1CuS/Ov29JQOpEPfhbDU03sUvtbKzKl+jI=;
        b=cNvQE1r31CKR+ea47WNVZG5KwRW3HEzUx/JcdlOSJlsIAoJM+x7coVkzwLkncoQbjb
         vfCpsi4+XJHHqwnMs4NLRIst22joULlB2GsP8OXAEkB1xpPIcM0HB5ihSZUfsIHgHUcX
         S57o/E+gG0kBlKv/f9Ohh5FUQZEx0YzefNKay7jD4gdGJ1wfKtyXz49bNR0Ge5/AzN7E
         85ZLOU60s14Olcr5HnkyPcYl+hJT9KJIfH9tqRRISlQ0WiujJyEkRWd1j54WlXJO5+Km
         3TN/5ZTx3RU6DaVjWpAM6QNW1Ra01G2T57qhrqPuVvIMPiUFp0/IlTnjUiCdrq4mNXyj
         Sxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440209; x=1796045009;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeFDFV4pN1CuS/Ov29JQOpEPfhbDU03sUvtbKzKl+jI=;
        b=1gV1QwtPMIgIdWavFpJNXGV8y9d7fQOyiEXbA8W/kD+jCXqkDsJObYJ3pEiGANdPl6
         mTGeqvi4WjVCbHw8LBgpThYQHQ5glOucr21OzVuX/rKukEKUUJgaR9+L0iYz7sz0x/X9
         IwDFQj+PPlZ0rJlovX8yFMNeQNXjdF/dc9D6rMnvAmbzVUSt5H/0CFmaK+/CwcX4JLUV
         0cgRitOINeOmIajpN8gxjHcbMDqeb181GfScJJoRxqqJEqeTeeQkp8BO6X87hWsw5z7H
         zLOmtT3oOhIMDcPlkaowiZLTpIV8QH0Eaz2hAYNYXBb0bZBoqGClYndPss/bNSkx47VI
         VG6g==
X-Forwarded-Encrypted: i=1; AL+hErGgO1AP9juynNtOopZk2qyj3gbaFws80BZJeT+j4vV2FVzrUsPW0MQcEZLr5B4DbHwNni412MQFH3s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/l6gCxJs0NQmy02dhGUO0cwmwkPQcXB4YAHjDrqX424ewREfod
	NQDBTKiY8obscKUP9GA+8UaJY0gbs2YRRZf8Mxq27WrkvnoPXAbGz94oDZkIif0VrA==
X-Gm-Gg: AZFdTZefvKyRsvGGWkni0NXHwY9j6radZ+r7k1rgiGhav7vViW6nJZ7ZOA2lQco3jO0
	AiZzMJqrerPlOqaUwJe++QkQavzAHta9VnRWRNMwkb6Vc17bcuIq54KPY1IrZSOhj0P6Pigq8KT
	lzSTlHrmyme3p819zr/hLkTdYUCXHKGv/j8Q7hrEBDvsabCZ1ny1w1UhBYjV1cq30Ozo0/lDZJz
	hJn/7NBE1R8vyL+ho94ZMd6c8eDyxQdBhTuwpo6Ji8Ly7j51K2+SxnWHJyTAGF7C7G/qp/AbK4J
	kXaxChAhJxLAd09sWIlY8Rk0n5h3LN/FPuuIOOOsQiE3gjNX5G/VoIDbBnICDnbR2UWr08GL+2Q
	h3oYxhyzxgeCTORIN8fb68HbTbu1NBa5Ltqk93H3EkAtmBLrPSPgikWHMU588Nnb8kjAcrBJwrN
	j26wv+fki7duc/MGtd7afcsptsM8SVkud/K08CbWIkG6fYQXrv3/4JLykQtleoyisc5h2qBPaBu
	tGMz1JzXiSr7h/7tTPcz4yicUfYwYjbOWesz+NMfcYQVugSLw2MjyLK/63pgWS5i1G72uuKcZBj
	gEZ8F62VvMzbgpXL9LTj0JYePFmu1E/Ul7bUVGryABi/JTzNuzS8r27MRTjQpXSvUdcLlUPmlQj
	SXx6mKLFkc/AGxi7H
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr234357485e9.22.1795440208862;
        Mon, 23 Nov 2026 05:23:28 -0800 (PST)
Message-ID: <4739bbe4-f69d-4f6c-9878-4da1e620937c@suse.com>
Date: Mon, 23 Nov 2026 14:22:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/p2m: don't request mapcache invalidation for altp2m
 removals
To: =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <ml@icedev.pl>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20261123040805.23963-1-ml@icedev.pl>
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
In-Reply-To: <20261123040805.23963-1-ml@icedev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795440209-4D55D5FD-D1CAE9A0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1671
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.11.2026 05:07, Michał Leszczyński wrote:
> From: Michał Leszczyński <ml@icedev.pl>
> 
> Since commit 588d961d15d1, p2m_remove_entry() requests a mapcache
> invalidation for every removal, including altp2m entries removed via
> p2m_change_altp2m_gfn(). Device models map guest memory through the
> host p2m, so such removals cannot leave them with stale mappings.
> 
> When the request is issued by another domain, every vCPU of the guest
> synchronously broadcasts IOREQ_TYPE_INVALIDATE on its next hypercall.
> DRAKVUF triggers this whenever it removes the last breakpoint from a
> page.
> 
> This was measured on Xen 4.22.0 with QEMU 9.1 and a 2-vCPU Windows 10
> guest, benchmarking a dummy application which calls NtCreateFile in a loop
> while DRAKVUF's filetracer plugin is tracing those calls. On every such
> syscall entry, the plugin places a temporary trap on the return address,
> to be able to observe syscall's return value. The trap is removed after
> the observation is made. Thus, every syscall translates to altp2m entry
> addition and removal under this benchmark scenario.
> 
> Without this change, each traced call took about 8.1 ms.
> With patch it goes down to about 0.19 ms (~43 times faster!)
> 
> Only request the invalidation for the host p2m.
> 
> Fixes: 588d961d15d1 ("IOREQ: refine when to send mapcache invalidation request")
> Backport: 4.15+
> Signed-off-by: Michał Leszczyński <ml@icedev.pl>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Aiui the argumentation equally applied for nested P2Ms, even if the description
doesn't mention that case at all (but the code change covers it).

Jan

