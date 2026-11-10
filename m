Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEA606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DbOmE9IM
Received: from list by lists.xenproject.org with outflank-mailman.1480998.1684780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhvo-0001Dk-HY; Tue, 10 Nov 2026 09:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480998.1684780; Tue, 10 Nov 2026 09:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhvo-0001Dd-D8; Tue, 10 Nov 2026 09:14:20 +0000
Received: by outflank-mailman (input) for mailman id 1480998;
 Tue, 10 Nov 2026 09:14:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQhvm-0001DX-J2
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:14:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhvl-006b80-O3
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:14:17 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e05d-e002-0a2a0a5209dd-0a2a4508bac4-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:14:17 +0100
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e069-f659-0a2a45080019-d155d02ae8d3-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:14:17 +0100
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6b5973a4b4cso2049183a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:14:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c990sm3789769f8f.3.2026.11.10.01.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:14:16 -0800 (PST)
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
        d=suse.com; s=google; t=1794302057; x=1794906857; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYrIDufEWont3lGq9cKWksAPGwEn1G1NQCY1pRGiDEU=;
        b=DbOmE9IMLJgEwcedRbRHl+TA3i6nTPOXQs27+irWclM6PsUhDL60p9jeTDLKA9Ez1K
         AypsPZukx6K4zEX4Gte9Q9WfRoj8sXj3FxHDsS1d4bFvCnFuckuVrG3mNocX7masH/0h
         7BdnyIDaB0nR0GuwHtk4Br/RFCi60PbN4wQwc5qs6SonwPT+upKrYDStiyJnNRe4aaqe
         WK1TlrJadUdke6MCOU9ho+s9mWxd+IgKT0deSVUh+VWQPnjmPaEKNn2WO9ybqgrzaFsI
         FtOW47PCRyiaFsmI8Mw+Xuv5mLE9s0GKWjLcSabMTfpIKuwxVWTrjEpUHS5221Ye4kUJ
         EamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302057; x=1794906857;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYrIDufEWont3lGq9cKWksAPGwEn1G1NQCY1pRGiDEU=;
        b=pgx2etktYW7WA1BydFYXAHZnwsSY6azEkL44//8KNVJHvOUsKgG8wLfs8CGgeXayYO
         iDbnBae9/si77HYeCQtWsFiAwCJvOYygTzQcB9xy7H6LtWT6mmfxiiEXKPotNYe+1wDa
         C81RX5tBkiQFFVuM72WJgBVMQb+tpoLBlMGPWwyTJiI5vbVPnNtFAmMZdagHJJsUbq2D
         /h4D3ik1Pc/+CaTMHpv99iA961axahHgqXV1UHa6Q/k5bYk7KAIqdgffLyX2NZpzPsGP
         0ae2EKwRJN3UU3/BRikEKaGjwPp+fyx+qV1pZhckk7f0Kqf6a+BrF8uzmSFYj7L+2z+1
         JaZQ==
X-Forwarded-Encrypted: i=1; AL+hErG6O56MaCTBAlUtVcA3y+3b7oKftr9mL9gEW0dIxFxDuOe6iMNTsUQxs4eJLPkIiJVPU+YBWBAzP4s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/GZeLKwdTpw/gHvCrBgSOCrQg3zRxS4qIje872Auehbzy2X14v
	msHffWzPD6YAOhCoZsNYhErxJcRzc30t1RxmrB0utgudNZLfUVxdBqety0QFQ85fsMUrYaT1dnA
	k1nrfJw==
X-Gm-Gg: AYBFou1/eAQF5deFSNJOUWM5B4HWwl0I6UPpJWGqJbvTM3wIB7s7C2OjjTj4lVIpWmm
	sps+er5c1fVnur2GcnpSaiuqb69IlJTx54MC11EZ+OuwFPkS6ZGWmNoT7CFKQL383YdczFUaFWj
	7CPx2ysnywCoXDpqL4VUladJ4NIA9m5A0DY7ie6JiAIA39aiCOmHh28Ux4bnypJYGEMeRBvbcgd
	/PP9RraMIuRH7we2bBjzEDOPm0Emidz9xe6FsQqECK3LuCxuF2z+B7beSlV+COsNSG+L660uyGS
	elgJi9j/JDZAvQkSsolYNIacr9TqLiAGvr9tZxOfWwGOWLcJEM36ToaA71QWKzTnG3U8f+WWq5G
	HeOW7NkQRYUvR8H8qTXyBEyVdke+Vq4OtMG2HvsSJiPtjHX3jKHuuRv0fXRwnSxOQoSyraxqElo
	2seF9aP5ZPA95vUDYjICiqaqCYUesrdLMpvpnXQnvcJfYGEZ+eQ6udq6o89FE407UM5uj1QMOJ8
	3VjaaFLk3aFRhNQypnjmIT2ISQpvvSoWVqkX99Gmc5rCBjxAP6Au7X2yy0CFMKxgMfrJpoGTYkN
	qDCD7JgfRbrgfPRBojT4CVrpOYuwK/bGy0AgxvemHR8VE6+8B/83weJ5NP/P11cIwIq7M15CivN
	7qN8RTqIMqVQNaYYx
X-Received: by 2002:a05:6402:2422:b0:6b5:8247:7bc7 with SMTP id 4fb4d7f45d1cf-6b756ae5d97mr1646322a12.44.1794302057059;
        Tue, 10 Nov 2026 01:14:17 -0800 (PST)
Message-ID: <aa64acd9-8595-421e-925f-878d548feffe@suse.com>
Date: Tue, 10 Nov 2026 10:14:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
 <20261016164815.3109065-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20261016164815.3109065-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794302057-CC57487B-C37D134C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1282
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 18:48, Kevin Lampis wrote:
> @@ -4212,37 +4213,80 @@ long do_mmu_update(
>                       update_flags = PTE_UPDATE_PRESERVE_AD;
>                  else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>                       update_flags = PTE_UPDATE_NO_TRANSLATE;
> +                else if ( cmd == MMU_PT_UPDATE_SWAP )
> +                     update_flags = PTE_UPDATE_SWAP;
>  
>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>                  {
>                  case PGT_l1_page_table:
> +                    l1_pgentry_t ol1e = {};
>                      rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> -                                      update_flags, v, pg_owner, NULL);
> +                                      update_flags, v, pg_owner, &ol1e);
> +
> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
> +                    {
> +                        req.val = ol1e.l1;
> +                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
> +                            rc = -EFAULT;

Because of the earlier copy_from_guest(), __copy_to_guest() will do here. Also
you only mean to copy back .val, so __copy_field_to_guest() is all you need.
(Same further down, obviously.)

Jan

