Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBF606A8AF
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W6M16Ica
Received: from list by lists.xenproject.org with outflank-mailman.1485886.1688928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVRo-00054N-GI; Thu, 12 Nov 2026 14:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485886.1688928; Thu, 12 Nov 2026 14:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVRo-00054G-CT; Thu, 12 Nov 2026 14:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1485886;
 Thu, 12 Nov 2026 14:06:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVRn-00054A-PK
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:06:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVRm-0074xc-Ih
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:06:38 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c7e7-2eae-0a2a0a5409dd-0a2a4503e87e-26
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:06:38 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c7ee-fae8-0a2a45030019-d155dd2ac16e-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:06:38 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so2627395f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:06:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835c37bdfsm16773130f8f.22.2026.11.12.06.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:06:37 -0800 (PST)
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
        d=suse.com; s=google; t=1794492398; x=1795097198; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxj7K62qqCscxdGLQ7Y5gP4o8MJFzRXhaqya2kTuafg=;
        b=W6M16IcaO9q7lzSD/fIz64rwKZ0uebrLw7mCcE8y31HST5/F4/qIM6pJclclW2gMqO
         u/hnh9wJsT62pw0k/1UjIZsWusf/UVdwfCeNaWziLfVPOHqB2CL1PcOWoJaDDTYAXEGa
         4UvnSm1wDXp1tQ3UhZXo0xTjvyqFe9kl+scb2nYRZ8dUzKDLVZc2icQbM4CDNzJ3ZPBK
         q6apCkOYorGE10SD48utTwr1PRkKPgshBuz2hMqAlJ+A1qCVUIdQWroEhWEjPf+frWxF
         oVjdtXR4GMjjc+f12oLIvtZs/d8XYJKyzl1mOlt+3yr+uW8YpQ7R346eHdWjhBQeCGgN
         m3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492398; x=1795097198;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxj7K62qqCscxdGLQ7Y5gP4o8MJFzRXhaqya2kTuafg=;
        b=ebvwZlv9lBbwT8phq9nHmhQBVCru9TiLjql+zLK+OjbU1JdsCPTNvktCQJwFIymHbG
         nY/noubYONScPmAFOY/9nt3RkJvOHC92LMkc7dlcUaZ7hDUcIWlsssJ7/1hqzJlfj/gf
         qDqQQoKN5MnMpcks/LqpBjWtGb3bldFG+UzQRyJuknKfswfh5liSbE2+ZZPjOrpynQho
         WnNYAK2WLB7SziU94pMUr+sriR5o83L86KvULxTJNbovSKWn6X2EgKCt0JtA4q2FrXr5
         ePxpag4nN/pnK2YU6DeEiJL6hwcQlfxleAe3CRxw16itGWVqyP/uTRe2bQzsnF4f1GFv
         DjBA==
X-Forwarded-Encrypted: i=1; AL+hErG1WogFeqFaKsFYL8pqPeogBKO+9p+0YFgKtYYygCoXgFEZShXJlrqwjTAW2Jky6X0oZwEri3BIFKk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9UwIclXTBTDTNvywVTtZNPPNxeAJzv2kFEWmRcxKZolxm8arFG
	gpK4Ljhei2zHtuOKGIGdb9UhBLIdIctk79rg5lMqCEHRp7nsjUkI69La3mvF3O0eXA==
X-Gm-Gg: AYBFou2PR3Oqka0B+NX0mfTme0XlvTSP6WvCrACqlau45izaQEC9H6j+O/luuRj699j
	q7/5YW2uff/THSU7D4gDkmjl9b2uU1671wS/tVkMLIw9AWQWwyUqv0j+BTRq99z0XNLjGdQZALn
	i0JnvFQlaI2nHzClt0pCaJH7Z9EyJCNOeeelza6FIDFKfikfUFfPKMSfTBTHtDR+2d5egrN4nfG
	b81ztBRvtD77erBe3O6YuyW0LHtdTeiAAJsBl6tFOypHnAQ1Zb3AAd4Qipp9j5/7Z96JZkbHzHJ
	3WxUcVo9u0LjBUucm5tBslabY0ObuC7SkUp51J/eDFVLyqn1UApFzHsk6vMBC4MyC9yc2FlstX5
	2iUjSX9EF/d7Rl1ZML0xsa35L6Xu6V+dsmGXOQOtz8P6GYgSgJauNuO+LhCh8Ka8xNgotFbx4OZ
	81rB++DsdbDB7S0J7jznrK61aO5tQbeQgfwb493TlUUiabAiyywBUUQkURJqaaWZqOOxAMfl+hG
	dZtHXfckiZsXrBOY1qDc60yR+7w0TPcGzszCUHKKw2WkkKLuYHbKNGgOwrxdxJHN1v6Xc0g4B8B
	HoF9nY46byACUcNIJ6n69mADPY6UcZqgLCuFWVCAsrCdPN1SeKnQ2OPVX2bHtsj3UIeRCGSuZTy
	/7MlB4/61UCRDvarj
X-Received: by 2002:a5d:5d09:0:b0:499:81db:47a3 with SMTP id ffacd0b85a97d-499c7271480mr11068398f8f.11.1794492397901;
        Thu, 12 Nov 2026 06:06:37 -0800 (PST)
Message-ID: <e2f8d1c2-fb3d-4232-ab64-ee53d2a4d86e@suse.com>
Date: Thu, 12 Nov 2026 15:06:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-5-kevin.lampis@citrix.com>
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
In-Reply-To: <20261112100005.324440-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794492398-7468B4E9-617191ED/10/78276251493
X-purgate-type: spam
X-purgate-size: 2194
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 11:00, Kevin Lampis wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4123,6 +4123,7 @@ long do_mmu_update(
>          case MMU_NORMAL_PT_UPDATE:
>          case MMU_PT_UPDATE_PRESERVE_AD:
>          case MMU_PT_UPDATE_NO_TRANSLATE:
> +        case MMU_PT_UPDATE_SWAP:
>          {
>              p2m_type_t p2mt;
>  
> @@ -4184,37 +4185,79 @@ long do_mmu_update(
>                       update_flags = PTE_UPDATE_PRESERVE_AD;
>                  else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>                       update_flags = PTE_UPDATE_NO_TRANSLATE;
> +                else if ( cmd == MMU_PT_UPDATE_SWAP )
> +                     update_flags = PTE_UPDATE_SWAP;
>  
>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>                  {
>                  case PGT_l1_page_table:
> +                {
> +                    l1_pgentry_t ol1e = {};
>                      rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> -                                      update_flags, v, pg_owner, NULL);
> -                    break;
> +                                      update_flags, v, pg_owner, &ol1e);
>  
> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
> +                    {
> +                        req.val = ol1e.l1;

If you didn't open-code l1e_get_intpte() here, it would become more obvious
that the INTPTE -> L<n>E done in mod_l<n>_entry() is simply being reversed
here. If ol1e was of type intpte_t, doing the update in update_intpte() (and
not UPDATE_ENTRY()) would become feasible. Since intpte_t is a mere alias of
uint64_t, passing &req.val into mod_l<n>_entry() directly would then also
become possible. Less redundancy would be the result.

> +                        if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
> +                            rc = -EFAULT;
> +                    }
> +                    break;
> +                }
>                  case PGT_l2_page_table:
> +                {

If changes next to these case labels would remain, please also add the so
far missing blank lines between non-fall-through case blocks.

Jan

