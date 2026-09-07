Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E3EC79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 12:51:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410842.1641658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YoO-0002BI-24; Mon, 07 Sep 2026 12:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410842.1641658; Mon, 07 Sep 2026 12:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YoN-0002BB-V6; Mon, 07 Sep 2026 12:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1410842;
 Mon, 07 Sep 2026 12:50:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3YoN-0002B5-7K
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 12:50:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3YoM-009i7H-K8
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:50:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9eb321-8faa-0a2a0a5109dd-0a2a4508ed1a-40
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:50:58 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9eb332-f659-0a2a45080019-d155802fc166-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:50:58 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso30192725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d057f4778sm206232265e9.8.2026.09.07.05.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 05:50:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1788785458; x=1789390258; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDQnOlJQJah94QU/wb3zuGNWKdlBM18vyiNCWzXsH+o=;
        b=cHjQIUGBg09qflUncPykA1eeXnZTwyqznBpmPkoZt8ix2ZkI3FL7JA/mFRSuA3ub6B
         /wgWzx1J073cnR3I3RoGF8WhiphHPYCPA+aWRvIttar2NCfnu5Ys33u451GiNP6cSqFw
         uG5cyRMZo7aQT1vI3R4+Sfth5t3oWZM34GwM4yRf387NV7clcstJGPXiXdXJUBr2IwHK
         MeGiOt2OS/CzKSMbSFNwM/2YZOVL1CReQShsT2/Z3wnMl4jG158dHWTzn1ExXT9lFeLC
         evHPrO8Dilbpgi180Tt5J3R+3h8sOPz7Ga/RhhoiJX32nBUuOD7jn8agYAEYPS0F6HjV
         eQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785458; x=1789390258;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDQnOlJQJah94QU/wb3zuGNWKdlBM18vyiNCWzXsH+o=;
        b=ArnLEwj/dF5yHlEWWAcR3jZAjIsUfpC6RjxbY3MLi5PiDafqXGL4zLvAwh0kqCDuJS
         NLkyA32o0urfBMEtg+gltYsyl4oWbMqO7qoYNSGjJwqftZ9sp4tAZ4CftqyHp/irYl9K
         1+vRNELLbnEBY+N2FD/9vG5IZAcRKxUPDMdOwN1MpOYuAMfjgjW2b55kmFaIxoGoxXZr
         +KweHNxYqd1eIdEb6rS0owF271tICguScmKuoAiFFU9LyTnFEjUh1w7183h/zhQcgHbg
         81qdejc3JymC43uWc5qlfuRB/HkDMx0fYeI6lNrQXdx7hmOP7/A4y2FCdhahG8f7izL3
         KiBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwT7KLlEaLDmp8lzGDvs8K/MAuXAveNP9tpmWz6kFAqwMtRws7ZdwL9lMo0CzV+J6D/HY1XCrJBzo=@lists.xenproject.org
X-Gm-Message-State: AFuF++ndPFTI/ggZ31PR+fYANQcHQhPz4W43OrfEwYGVq1SjFD84Vj1X
	ysOqNq7s00PRqdwpAsjZFJ3SwltoOxnjYC1mDVsdiFyZPp3d0BtiGcfvZO7fCO4iyg==
X-Gm-Gg: AYBFou3MeNa5CuywPx+asG4pIrtlQ+ub06A9Fm0tpuJNHB/bAbQyfW5PfUhyWLlnU5J
	2kehWj1ZSHgBYWh4olzhJzduWP35VUOvwpiYQak5tRREzymFThxFWSCUA/tjdkkUdk72VPV0MDe
	m78BAUfMQPFnR1h2iTujOAsqxxJ7GarIl0MkPawUYJeZbrLaEItz00bEVbx/ACOPMzo82f0C5cF
	YIrsMQpifv4RTXcGoNUc55i/Skbdl4jaJB3CKE1JMoH1WaGqUzlzKEj9idiHDAZMcReIqGvJOVP
	d3pej+LeCH+PlzopahnJ9Jqdit/7zaDzQsTZ4J/6RDSDz+h41m9rqYd7OV+QAPrB4H8XszxEFVP
	aWHR3o1uV4FBvbctJR3Sybb7ZG9IdNiZvdZ4alUKiAAI18XC4nRDWIEC9o73+lPeMTBbDNFEnu0
	PIn3M1fn9vpIvtrerl5pue6S/9mAAs+35pNhSrgwpvPD+f6K0A1xglHAUt7BIjSDrSno22wHTnL
	h4zLV9CpCJM8oyBS7j63Wy9zwsyFCgSejebHB3jz/syAYG1ozckJOV+11cMeqY=
X-Received: by 2002:a05:600c:a40f:b0:49c:fa21:e74b with SMTP id 5b1f17b1804b1-49cfa21e9a7mr152484925e9.33.1788785457867;
        Mon, 07 Sep 2026 05:50:57 -0700 (PDT)
Message-ID: <39118b9f-2c63-4523-a7c6-76cc25d43163@suse.com>
Date: Mon, 7 Sep 2026 14:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] x86/pv: set/clear guest GDT mappings using
 populate_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-4-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-4-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788785458-CDB4987B-C402601F/0/0
X-purgate-type: clean
X-purgate-size: 3879

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Until the previous patch, update_xen_slot_in_full_gdt() used the

Please can we avoid "previous patch" (also again below) and alike in
commit messages?

> stashed pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming
> vCPU's page tables with Xen's GDT; this was previously necessary
> because map_domain_page() couldn't be called in a context switch.
> Having a handy pointer to an always-mapped version of the GDT/LDT L1
> table, other sites which modify the table started using it for
> convenience, even if they weren't called from within a context switch.
> One example is pv_{set,destroy}_gdt().
> 
> The previous patch switched the main user of the stashed reference to
> use populate_perdomain_mapping() instead.  Continue that process by
> switching both pv_{set,destroy}_gdt() to it as well.
> 
> pv_destroy_gdt() currently loops over the L1 entries directly,
> extracting the MFN from each, dropping the type and reference unless
> it was the zero page, and replacing the entry with a read-only mapping
> of the zero page.  Rather than reading from the stashed L1, drop the
> references using v->arch.pv.gdt_frames[] instead, and install the
> zero-page mappings with a single populate_perdomain_mapping() call.
> This makes gdt_frames[] consistently the source of truth for MFNs.
> 
> Note that we must maintain the invariant introduced in cf6d39f819
> ("x86/PV: properly populate descriptor tables"): pv_destroy_gdt() maps
> the zero page read-only in torn-down slots rather than unmapping them,
> so that LAR/LSL/VERR/VERW on a selector beyond the guest's limit clear
> ZF as on native rather than taking a #PF-converted #GP.  (And since
> pv_set_gdt() tears down the old GDT before installing the new one,
> guests never see unmapped entries, only zero-page entries.)
> 
> In the case of pv_set_gdt(), we have a slightly awkward situation with
> types.  The ABI with the guest uses unsigned long[], but
> populate_perdomain_mapping() wants an array of mfn_t.
> v->arch.pv.gdt_frames being unsigned long means we can just copy from
> it across the guest ABI with no conversions.  We could in theory
> convert it to mfn_t[] instead, and then pass v->arch.pv.gdt_frames
> into populate_perdomain_mapping(); but then we'd need to add a
> conversion on all the places where frames are copied out.  We choose
> instead to copy frames into a temporary mfn_t array on the stack to
> pass into populate_perdomain_mapping().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> Signed-off-by: George Dunlap <gwd@xenproject.org>

With the adjustment above:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -49,33 +49,42 @@ bool pv_destroy_ldt(struct vcpu *v)
>  
>  void pv_destroy_gdt(struct vcpu *v)
>  {
> -    l1_pgentry_t *pl1e = pv_gdt_ptes(v);
> -    mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
> -    l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
> +    const mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
> +    mfn_t zero_mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];

I wonder if having an initializer here might not result in better code. The
array could likely be filled with REP STOSQ here, and ...

>      unsigned int i;
>  
>      ASSERT(v == current || !vcpu_cpu_dirty(v));
>  
>      v->arch.pv.gdt_ents = 0;
> -    for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
> +
> +    for ( i = 0; i < ARRAY_SIZE(zero_mfns); i++ )
>      {
> -        mfn_t mfn = l1e_get_mfn(pl1e[i]);
> +        zero_mfns[i] = zero_mfn;

... the live range of zero_mfn would reduce to about nothing.

Jan

