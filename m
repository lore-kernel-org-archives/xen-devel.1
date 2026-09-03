Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184CDC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:08:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407241.1640318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x286M-0002gI-KZ; Thu, 03 Sep 2026 14:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407241.1640318; Thu, 03 Sep 2026 14:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x286M-0002gB-HW; Thu, 03 Sep 2026 14:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1407241;
 Thu, 03 Sep 2026 14:07:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x286L-0002g5-TQ
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:07:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x286L-00DG2V-62
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:07:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a997f22-bab6-0a2a0a5309dd-0a2a45078df8-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:07:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a997f28-b4ea-0a2a45070019-d1558036e0ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:07:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so28021425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 07:07:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60d9c6sm75787505e9.11.2026.09.03.07.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 07:07:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1788444456; x=1789049256; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YmDbX/3sWw3eSQ2aEyIQQaWSLPoFgJEsBjsN3OV+4o=;
        b=NPM24fnx7xDOnZcSSscuUvdFnnaFymSrWzFCZqMKECcAw4qxvF4Ko19NygWpo5GTtJ
         IKTa+k2ySgCq3BGs0kW+dITAoDeKOXrhe050W1w0xyxeaabFytA58nxviK2mnKkBTqX1
         XZWhVwMpL83QhnbYVTbCAVszW8b4wUyAwoqMukUbsSzPWqAWis5D5tnq7/G+oh3sl6yb
         o+sfKQNVxYwYKlJ+rUUqHMkpytB98s/Q+v/rWPtpKkAgdAUIKORXs3vm+x8CW5Mh++9P
         lnajmDX4XCIuD6Fos3YtneVmsarwk3wiO504AiPn27QJ4mRtTZIvFTtoJVSVOWlSg3Ey
         ZLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444456; x=1789049256;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YmDbX/3sWw3eSQ2aEyIQQaWSLPoFgJEsBjsN3OV+4o=;
        b=if5WCeDxD35i4FkgDKPDdBl4C7nVAO8gVGdUWtw3QgL9cJSInLlWTRBhiGPY4XxYQ0
         jb3j/QDkvpJyPAdGUkJDihMzxCm7P207z5kpWV+CWamFCTXR1WvER8aP1nMCzC9PBeT5
         RO2IRf8DHxaWdP2223MsBUPKBkjg1qOIxhYG2wrgJZJofGhvaNsL1cdEDXKocdmJu065
         3wwVqBZG7RxJWxb9fedk2XDv5PvkmPhww1PhhyMYWhK9dGzPBZsVqErChsIhVEb7r5IP
         bQzGDOqLhZqy3Xsg5D6s17iJo+WTwuuxtR9ZHxTBziWOr9POBEPGYtlWpNis56eu2AYz
         lJEg==
X-Forwarded-Encrypted: i=1; AKwUvByx7cl4ucVG222TKrZxNKmdXT/P4v6IkWlFbJmwBWfsGPWvYvn7EqIBVe0v2NpObaYnx6MqngyXtA8=@lists.xenproject.org
X-Gm-Message-State: AFuF++nwNKgl/zPs6TquSxxxwiF8Qio5gbq6lYxQa6muih1H6b4T/eZm
	yFV31weVnpwT7Z/3RVQ9Y7T1yOs4NPWc75wyAQLkks7ihg6UCn4kLZ/QN86ci8EsOQ==
X-Gm-Gg: AYBFou1ChBHsv9T0oUaG3O8BVD2dCWXpKd/+uDvgKbfmUGxLH++dzEOs4hfIxxHUWtR
	qBz16NZ02Vgm4B0mcIv5d/MxGYPFfuEblqhziYvq4AAJHpkLFVB3CusWiVyXIpi8uUQRgf1rEUC
	nBx6KgxaeB9/9nLkymYIUBCv1YcKLk3ALH9Bq8uCbm1jtU8lp5yHzDfOtw1PbML/fNdnSTXey1v
	TL6U/qxCee8j67MKVrW9Pbtz93/np29Ze4qWHBlbR9+A2cjQWACro94Q++uEbmU7pausbI/IeJB
	650qInKL/jGQYTeYa/MrXLWmpip8/nSTa/IzYDV+UIfKm2UNCLHgDEWua2EU+MNbm7tCLJTn0Ad
	oyh9uBp+xYqXC9EkBjTETf/voDTtoFVAUSnFfeItpCqnITrVxXQwAFe2fMA0ddCaZE9j2gyi61J
	DRxj6p4HmPfV59xaxcOA/Vp+uyU6a2yANV1SbrTDEXXROZll8dwN1Em37cLbFJh1croVFERF99K
	8G4Kku9hbMa54OHjIKLbXT7v/7ZmKuRYjxAqA==
X-Received: by 2002:a05:600c:34c5:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49cf5b7935cmr5702775e9.7.1788444455450;
        Thu, 03 Sep 2026 07:07:35 -0700 (PDT)
Message-ID: <918e1522-3028-4d8c-9ba3-1c679b61861a@suse.com>
Date: Thu, 3 Sep 2026 16:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] x86/domain_page: introduce IRQs-off variants of
 {,un}map_domain_page()
To: George Dunlap <dunlapg@umich.edu>
Cc: George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-1-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-1-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788444457-A7CD7AE4-E181A958/0/0
X-purgate-type: clean
X-purgate-size: 4894

On 02.09.2026 11:43, George Dunlap wrote:
> From: George Dunlap <gwd@xenproject.org>
> 
> Currently, map_domain_page() cannot be called in the context switch
> path.  However, Xen already needs to update the slot of an incoming PV
> vcpu's GDT during context switch; and when we soon switch to per-vCPU
> root pagetables, we'll have to modify two more places.
> 
> Xen currently solves the problem by special-casing the GDT/LDT L1
> tables to be allocated from the xenheap, and stashing a pointer to its
> address in the xenheap in the domain struct.  Rather than add more Xen
> pagetable pages to the xenheap, introduce a version of map_domain_page
> which can be called from the context switch path.
> 
> The reason map_domain_page() cannot be called from the context switch
> path is x86's lazy context-switch state.  Mapcache mappings are
> created in the page-tables that are loaded on the pCPU.  When Xen is
> in a lazy context-switch state, current is the idle vCPU while the
> previously-running vCPU's page-tables remain loaded.  If in this
> state, another pcpu wants access to the lazily-swapped-out vcpu's
> state, it will send a FLUSH_VCPU_STATE IPI to the processor, which
> will call sync_local_execstate().
> 
> sync_local_execstate() is implemented internally by calling a full
> __context_switch().  In addition to copying the processor state into
> the vcpu structure, this also switches the loaded pagetables to the
> idle vcpu's, which would in turn cause mappings created before the IPI
> to disappear mid-use.  Therefore, mappings cannot be held in the
> mapcache when a FLUSH_VCPU_STATE IPI may execute.  To this end,
> map_domain_page() calls sync_local_execstate() itself proactively when
> it detects a lazy context-switch state.  This guarantees that the
> pagetables will remain consistent at least until the next context
> switch.
> 
> But of course, that synchronization must not be triggered from the
> context switch path itself: sync_local_execstate() ends up in
> __context_switch(), so a call made while a context switch is in
> progress would recurse, and the assertions along that path (current
> being the idle vCPU) don't hold there either.
> 
> A full synchronization is sufficient to prevent a FLUSH_VCPU_STATE IPI
> from switching the pagetables; however, it is not necessary.  It
> suffices to maintain interrupts disabled from before the page is
> mapped until after it is unmapped.  This condition is satisfied for
> the mappings used on the context switch path.
> 
> Introduce {,un}map_domain_page_irqoff() variants for callers which
> guarantee that interrupts remain disabled from the map until the
> matching unmap.  Under that guarantee the synchronization is
> unnecessary rather than merely inconvenient: no IPI can be delivered
> while the mapping is in use, so the lazy state cannot change under the
> caller's feet, and this_cpu(pgtable_vcpu) accurately identifies the
> mapcache to use (see 622c9a5ba95d "x86/mm: accurately track which vCPU
> page-tables are loaded").  The variants assert that interrupts are
> disabled on entry; the rest of the contract remains the caller's
> responsibility.
> 
> This will be used by the next patch, which introduces a function which
> will be used to modify the incoming vCPU's per-domain mappings from
> within __context_switch(); it will also be used in future ASI
> patches (tearing down and establishing per-CPU stack mappings during
> context switch).
> 
> No functional change for existing callers.
> 
> Assisted-by: Claude Code:claude-fable-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one aspect for further consideration:

> @@ -59,7 +68,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>  #define MAPCACHE_L1ENT(idx) \
>      __linear_l1_table[l1_linear_offset(MAPCACHE_VIRT_START + pfn_to_paddr(idx))]
>  
> -void *map_domain_page(mfn_t mfn)
> +static void *do_map_domain_page(mfn_t mfn, bool irqs_off)
>  {

do_...() commonly (but sadly not consistently) mark top-level hypercall
handlers. Personally I'd prefer if the "do" (but not the underscore) were
dropped here and ...

> @@ -165,7 +174,19 @@ void *map_domain_page(mfn_t mfn)
>      return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
>  }
>  
> -void unmap_domain_page(const void *ptr)
> +void *map_domain_page(mfn_t mfn)
> +{
> +    return do_map_domain_page(mfn, false);
> +}
> +
> +void *map_domain_page_irqoff(mfn_t mfn)
> +{
> +    ASSERT(!local_irq_is_enabled());
> +
> +    return do_map_domain_page(mfn, true);
> +}
> +
> +static void do_unmap_domain_page(const void *ptr, bool irqs_off)

... here. Identifiers with a single leading underscore (and no following
upper-case letter) are designated for use by static functions, after all.

Jan

