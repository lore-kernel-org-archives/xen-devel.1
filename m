Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD9C5DF94
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:40:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399096.1635296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymhl-00056t-JB; Tue, 25 Aug 2026 08:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399096.1635296; Tue, 25 Aug 2026 08:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymhl-00056m-GD; Tue, 25 Aug 2026 08:40:25 +0000
Received: by outflank-mailman (input) for mailman id 1399096;
 Tue, 25 Aug 2026 08:40:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymhk-00056g-Fo
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:40:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymhi-00AYTC-8v
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:40:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d54f2-e002-0a2a0a5209dd-0a2a4503ecaa-18
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:40:22 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d54f6-fae8-0a2a45030019-d155d033e1fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:40:22 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6a157f90752so7487060a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:40:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e0228f1sm8831048a12.10.2026.08.25.01.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:40:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787647222; x=1788252022; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k5L4MZXgoTsz0rrLeS+BAK7kXsIkRduO4K4YCMEgEiU=;
        b=aUXcCfrgWrXI3L5L9QAgiD9XpyMiWIT9ix3qIzQceF7UKQlxgnntHKRoHA9T+zL1g3
         QlV6YjUiwytIpgabHpaE1S+WhIddHLMjUVufvVyndMEhaMNWdlwn6J5UOwfmMYImEs8h
         74d7sxfcX0idHEkbF/8nGPaxtOHaGHA+HduWjZRufhXflX+UpoLU/us4AnU48MFvQZJV
         gIVD1quCGCG1Ck5xV5mSrIQ9vmP34JuvHZ2fOE1wp6hmmc4ADTQS+b83g7lJluTAhkpm
         h8v4Le1P+akk1Hg13Bket0tcShqEs5Zu0xD3FnZUaHkofUQ+yWcKTxObVKgBvcze2gU0
         6P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647222; x=1788252022;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5L4MZXgoTsz0rrLeS+BAK7kXsIkRduO4K4YCMEgEiU=;
        b=OKC5QmQGQBbkvEynl97z+UrYAl4DDgWX+qxcLUDqQAqgHA6VGkdgzbZveO754dt0LN
         65Qfs/SOJZz2leofA/9pUd9Lg0xnPcjGZFO8qRRbHFvjY7JrDqtrEaA0Assnf0VpO5d/
         Z+5ZzQnvIJP7QC/V7FEX90G29WuS/kxFEViaIHa7xxWpyzYR43e2IhiK4EbKe831uAcp
         brn2ZiSofmpxxMBZZ0rBr2yKx3spPGEbzvPnkXAwb+X427H4K+fo4PtdbbgMjQlg5nLq
         GFanUe4ygg6c+Lv9H0pnSQUqcZ4B1doNnJfCjVpACzYsVZ9BWxVcxZ+mhvUcjj7irN33
         tIKA==
X-Gm-Message-State: AFuF++lH58clwiZ/qRST4UrkUwQ+i1QeqRdNYldTjjqmSE2p+cxvvH3J
	Ckrnpvgf9nUq0OUhKrgDbDIdm99v+edycS6XDFCMoXU7h20wAyvvbd0ZqNdIxn6muJ3acyggS0a
	jAkIRSw==
X-Gm-Gg: AR+sD12htFUUr2MqS8cNhb34L9Jpiafhg+Ub2Q2pXqEU/kPrCiVQRFKNU5oRTM2UdoP
	LDAUN8wPo3l1v6lyUV8lE7NhGGlLVDS7EEF4hKWCvp8Yed7PhSs57Ea+kkZ5N4v7LBTsap92d1L
	x0gsjX2UGp04nJ3T3djVtzQ8l2Rj3oeByriJGsT0qOMZMwpYLAOPiFTAtGwzk9t0YX0sKWl/fv8
	Jn68jWLRxtkzQzi/7qic+MPuxChH64pExhr83kmQ5JF0WXqyuTZXB/hB8ubxQDdBuU/MtS5iKls
	PJXKnEwtTcjyFb7Iizd8NotLM/MMDCE5XthXezqF4Uq2E+u46cqWp+pi5dDhhlS7oi+1y8llp+Z
	OE3p8dNdAw4MUVMhH63xmB4Fl16wbowTwuwjzCiAgI0e+GfS3ANlDa5X/7dnTjCCtsyGgBGh5m4
	5Alhbpv4mIaXVIqpy6JN36vN2gQ1sn1dHQtQ/+/L2pC51HZcdI/6zUUxzXnuDu6eghJuG4Esl3I
	UFL2G5SjzTtmaTpBDkV/0zTd0dIzsLxhWI7uVampJ1aLdV/020k
X-Received: by 2002:a05:6402:50cc:b0:6a3:8525:b9da with SMTP id 4fb4d7f45d1cf-6a5c40b1a17mr5406572a12.4.1787647221665;
        Tue, 25 Aug 2026 01:40:21 -0700 (PDT)
Message-ID: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
Date: Tue, 25 Aug 2026 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] build: split and unify linking of final image(s)
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
X-purgate-ID: tlsNG-33051d/1787647222-75C804E9-91EBFDB3/0/0
X-purgate-type: clean
X-purgate-size: 592

The monolithic rules, largely but not entirely identical between ports,
were pretty ugly to fiddle with. Break them up, and use (largely) the
same rules for all ports (x86'es xen.efi being somewhat special, though).

The final two patches are related only in so far as they address
observations made while doing the conversion.

1: x86: split xen-syms/xen.efi linking rules
2: Arm: split xen-syms linking rule
3: RISC-V: split xen-syms linking rule
4: PPC: split xen-syms linking rule
5: build: move $(all-symbols-*)
6: RISC-V: place .sdata / .srodata / .riscv.attributes

Jan

