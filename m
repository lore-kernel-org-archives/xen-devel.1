Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308BE606A335
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cRJ9+tZx
Received: from list by lists.xenproject.org with outflank-mailman.1469699.1678451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODvl-0004m6-IK; Tue, 03 Nov 2026 12:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469699.1678451; Tue, 03 Nov 2026 12:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODvl-0004lz-Fc; Tue, 03 Nov 2026 12:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1469699;
 Tue, 03 Nov 2026 12:48:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xODvk-0004li-E1
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:48:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xODvj-00AmLW-D3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:47:59 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d7fb-e002-0a2a0a5209dd-0a2a4505d318-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:47:56 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d7fc-4cb1-0a2a45050019-d1558029bd4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:47:56 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so40451565e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:47:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba53d7sm31748375f8f.53.2026.11.03.04.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 04:47:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793710075; x=1794314875; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MusYXJrjMtyZXn4CwSiauONc+2R6UdvYrMkw9NX19VA=;
        b=cRJ9+tZxAb5bNEIyr5E3kQJgxWTP3GMe+8U6mMBQxm6neqtsaiMY2cIrPOyGMZEMmr
         DH2tbpks0G5MHtl4K89uyWGXtaiR2QrcMzXgOTmm66hXmF1+O7YqgQxx5yXFQqmTVJIH
         pc+ZxqmXSqMX76wR3UagkyUlw877mnLuwFKeLJTEAjOuwWdO3sS41E1C9fWLKrgm4Q4E
         7P0C+uhoOuPybdEnY/NKSKfxRdkIehBA0TlnuKb2F3Wn91pPpAhqTgVPr7K7qoXupGxO
         SYz68bH3HL0zYLEGqwSVvkyY1YyN+ZLKRUQlOfGxV8RRLbZwm9+H+xUjl4jx8/hvBHNF
         WgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710075; x=1794314875;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MusYXJrjMtyZXn4CwSiauONc+2R6UdvYrMkw9NX19VA=;
        b=htHDmDRatPARVtAMs3xPi08JLl7m4lPP4HqHavZefOswtm5pSFBzXwGWmNfpdgEdOR
         rwMiAe+sQBGWmZknNhecPvM6JUdqRQSeBS7TMMhKGBUdcEqmpv7+VyqbdeEQPQ36wU7M
         R+JV3bSfWT+PFK8WcACjgxMhSGQIHCYwCAOFcpkvXh2OyCFdVkPbklXSKSiBi6HzlLqt
         dbEkIA1qLT/ii9/cfHCeLi6w8v5xvNiHxdaxnEuNw3Fwq1GUbQV1r9hs7wNExn6a7bJZ
         GRrV5J6OcpQkEidAgYm+ET7JqDbrMsjm6nF9fhVmxQGb3E+suciUXRlDZ4/Wi/L8YIov
         ED9g==
X-Gm-Message-State: APuU4Z9fvUubUSI22xjjqmAz/4iTCmuWR9s6JHrt5x+56d1Bd4WK6IGv
	3Ib13/bCtKqqWU9iCEOxD71Wk8yKezqI4tH585AO3WkdDGKTWAI9br05BkPvSCd6T/uTPfvB+AH
	lu/2mEg==
X-Gm-Gg: AYBFou2wev7zDEGCYMKeflpbuZJfyNCridaYEMH00gHlFo/ccrU7AEm1JvSngL/k9I7
	k70KLWTezckhHsEYqNuCBb/eVxx6sgSFqAPAptlING6ejNQbyhfiZLOJrbXyoXbN6SI+bpKR0Dl
	lV+1+EmiTpF4FTjQGFfeA++EofE4/g2oLMHWe76JFBbYlthRRDGW1ojkP6mklMsJLo/nQm8kwwI
	qmYkrGK3P+NzbafoXGkceN2Tfyp0Yx/yOT7HEGRLDk3WYeFVSL4wBDd96LC2kblp5N3nNi89DDv
	qCQNcdnxnA+c/cLWxU1lYzYcOpqt7huxpKDc3V786BBQ+gFvUOHT+9tRdmZYf0+q/O+jHum3YFA
	pe0kQZNXk29KutXiQGPxHE3TrKMFBQkdGQPUByE49sOeu//KxPNQo7/oD9bXsaVAmAqzUcEEwCf
	TrqKuR4sK4mMt4HgS++w7Zt0us+at3IhiPJ9EeB6DqlkLlON5QPUpWbKc44oG14gBpLXJljgFvp
	qWiftribIRvnhCB8Tu1UrJgo+DM24ktduL5WwN6m/9V9OfXY7xgAsZ6WHmI7K6cci/6FnoZ8ND/
	+n+ke3Zi4u00PfhTn61OprRid3ErEsx7T3qrVRtTT+yLAPB+0LCc48I/Y0nSGhmJgChnZW6n7Pj
	9F2XHQjHu2sqhK7Y=
X-Received: by 2002:a05:600c:34cf:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ac150b38ebmr300338595e9.1.1793710075687;
        Tue, 03 Nov 2026 04:47:55 -0800 (PST)
Message-ID: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
Date: Tue, 3 Nov 2026 13:47:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] "brk" allocator
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793710076-734BC2A1-0A122F30/10/78276251493
X-purgate-type: spam
X-purgate-size: 280
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Derive for our purposes something similar to what Linux has been having for
a long while.

v4 addresses (hopefully) the final bits of feedback that kept trickling in.

1: common: introduce "brk" allocator
2: x86/EFI: replace ebmalloc()
3: xhci-dbc: use brk_alloc()

Jan

