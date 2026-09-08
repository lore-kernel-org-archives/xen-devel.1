Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9570AC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:03:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412159.1642657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xM6-0004Zx-08; Tue, 08 Sep 2026 15:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412159.1642657; Tue, 08 Sep 2026 15:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xM5-0004Zq-Tk; Tue, 08 Sep 2026 15:03:25 +0000
Received: by outflank-mailman (input) for mailman id 1412159;
 Tue, 08 Sep 2026 15:03:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3xM4-0004Zi-Nw
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:03:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xM4-00HZYe-2c
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:03:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa023ab-e002-0a2a0a5209dd-0a2a450cd188-24
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:03:23 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa023bb-f479-0a2a450c0019-d155dd2cdda3-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:03:23 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-482f9309813so4410387f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:03:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485aa2c9acasm870243f8f.36.2026.09.08.08.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:03:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788879803; x=1789484603; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDB8xtTNhXauDE129EoyiIX+KnpI6yb74jUIYhx9piY=;
        b=TIX4arOI455RnnDfjQKwvmhnWdbdIwCVhrHwq9iMv8/56GVzeGBVZ35HZ9Oc+Jz2IR
         SssFFFA+pV8Z4pev5q1tXSKh+NCIM4tJmKWR6KFR1JqN4Vt0qaaEQ5q3CHKMcAqju0gE
         uPD0KMDHn7tnrSntp8svF4INJPPl832AaTO3rt1dRkMq5+1C/9v16zjkyEQMnQK88PhE
         emp4FApizMH43N5Px1ZMZOp+wwXkhtVK0HT551MOO8m5Wsk3zCIwt/5cOKgB+9MN0j2k
         RekdMExuHnYifxhnkeL2j7Kk75Rzfr1GW85rjJsl5nQqJNwzj6YqbKfh/a0apn8iNy7a
         sHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879803; x=1789484603;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDB8xtTNhXauDE129EoyiIX+KnpI6yb74jUIYhx9piY=;
        b=aKKPGYmsJRMuqu1xf/VrWLROaNnBQ6xiO35mWDBAP0W8OuRPS/8gNg16sEyq0UcAWn
         +wb8rLe/63ogY0QlikGxd8MkeBAa28uyJcsp6HvjMJ2imwVGxSdsOPKq4vrEF2/ois+5
         +zs9AS4zwPoF0HzVVzJFHPIof8EFjONzV5NTr9TZO9IZ9hHMZigEXGPKjsmnQ4bequWA
         U+lND+geyFAcya4zd6dDalJnbK1Mcu/dxzu2Ua8YxYfV/d5OoEnmKIA1mmC5mCwYa49w
         MqgzcMwcjIamkb3SUEC4LhbPS1lAKrxvwJKxC6cgksJkNICRgaiD7qZMMizlEFeGHvzW
         9qOA==
X-Forwarded-Encrypted: i=1; AKwUvByECdQXJ7hxfysKIiheDFz8wGiYP82XNgUUQ7tWDsRKZPVwZmAv4K7H1wNJq1MAnVaUeTntXlWMB00=@lists.xenproject.org
X-Gm-Message-State: AFuF++nFM5+9ndqF8QPlTzXOWGazlIJ/U/jr1gk6KluTD98i4Qp/Um7T
	zXcolVIHX1nHXDJfw/6s7bcLoEXSGcgtHiwM7U0Y4HzwzkE1hKySC9XRyoZdFo390g==
X-Gm-Gg: AYBFou37s7Bk7r2h9E0LR3+89YES+U4YJH15GcMJBCzYM3wj7aYQIoTJgSocTAJrX0M
	p+ybYtcpIMjJvFaG5fHnxAxW+qIPf4oKp9/FAYEeBCxJ4kaTsVdqYfYI4b3Zi2bVXPfL4g4dj22
	FRq89OHWfx9HotOfkR93H219f3aOo2+e3I7NtVBeafh9iiGjI8uEtpjxaUrI2FrDKMvj3VJisNi
	QNNnbO9PxhqYQg+985N7U3GiOcwPrZsi05KjCbqLr49ducYU0iQ/N1gV59e6+XC/Wd62NP2DseV
	OiJkfNafv0974OEFU7J4mfiYj1/BIj3sDSKYPn2CZ/GlMRBHiFPzO4+Lvkne9IdB4uyb9vRWeLb
	0p8hpNj2SNH7rJyMZF0EqBBGb6VzhH1se4yCiX7asNlEnYV7UNLbyVyUmaFgEPJG2fbGnbW04uj
	Tg2PdEhk172o3Rn0fSmN+xmIZi3UjNZJxUzcM9T5txKX/iqa8UqH/0Lr/IIeHY2Qb9kXp08fu3J
	dGqblJBEL+GyvgAFEF86zL1gDzjqEbdm6jRAdFvVIZkz0t4iQp9
X-Received: by 2002:a05:6000:4601:b0:485:8c16:5ef8 with SMTP id ffacd0b85a97d-4858c1660eamr25700983f8f.50.1788879803278;
        Tue, 08 Sep 2026 08:03:23 -0700 (PDT)
Message-ID: <77fa3707-d224-4690-8cdb-0dbe703d853b@suse.com>
Date: Tue, 8 Sep 2026 17:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] x86/mm: purge unneeded
 destroy_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-8-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-8-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788879803-50520A5B-E1685535/0/0
X-purgate-type: clean
X-purgate-size: 1672

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> We want to change per-domain mappings to be per-vCPU mappings.  In
> preparation for that, we want to arrange that
> destroy_perdomain_mapping() work either with a single perdomain area,
> or with a per-vCPU perdomain area.
> 
> There are two calls made from domain-scoped contexts; both calls turn
> out to be unnecessary:
> 
> - destroy_perdomain_mapping() is not logically the undo of
>   create_perdomain_mapping(), as the name and its use in
>   hvm_domain_initialise() suggest.  create_ allocates a per-domain L3,
>   but destroy_ tears down mappings without freeing it; and since the
>   call here passes nr == 0, it tears down nothing at all.  The
>   per-domain L3 page is actually freed by free_perdomain_mappings(),
>   which hvm_domain_initialise()'s caller, arch_domain_create(),
>   already invokes on its failure path.
> 
> - The call in pv_domain_destroy() is redundant: arch_domain_destroy()
>   unconditionally calls free_perdomain_mappings(), which tears down
>   the same entries and additionally frees the page-table structures.

pv_domain_destroy() has a 2nd call site (the error path of
pv_domain_initialise()), but the situation is the same there:
arch_domain_create()'s error path also calls free_perdomain_mappings().

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Assisted-by: Claude Code:claude-fable-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

With the description amended:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

