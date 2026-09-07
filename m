Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518ABC79FA1
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 16:07:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410995.1641799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3brx-0003ND-Dy; Mon, 07 Sep 2026 16:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410995.1641799; Mon, 07 Sep 2026 16:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3brx-0003N6-BO; Mon, 07 Sep 2026 16:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1410995;
 Mon, 07 Sep 2026 16:06:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3brw-0003N0-8D
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 16:06:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3brv-00EMuy-L3
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 18:06:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ee106-2eae-0a2a0a5409dd-0a2a4502849e-18
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 18:06:51 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ee11b-6ca4-0a2a45020019-d155dd2db4e0-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 18:06:51 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48436251906so4250344f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 09:06:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfbe5b252sm276392875e9.3.2026.09.07.09.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 09:06:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788797211; x=1789402011; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLFr3OlASOjwaBAVPfUk7hR+IE8iW3XD8/uzk2PZJjI=;
        b=E2A5jq/KwWEMkdh1tCWcdSMiJTuyPURZs+Bn6+oXwkVNa+TYno6O4JFakI+5asdNWJ
         71y9Il5TGbViAZhugMLam34dhQP5h7UX0J3tWkT12r8FbRywyuJVvswpgWfzpi95Fx0w
         wM26noyNoTOpTkFsGKskvuPnR0h0vcAwPrCUyZBharYl5LGBfb78k2byi/f7ZjGTm5eJ
         oYNEphJ73YLY9GL+vixVmekI37bJK2PFYVX4BF3UrRigaXGxWAIL4lL8ofb1XtZdTgea
         M/ABO7nGbWSlB1hG9WK302H/f0Wg0e5jlUWnxxSylytKKg/dSf/VgL/pKOV1SgOeEN5a
         OnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797211; x=1789402011;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLFr3OlASOjwaBAVPfUk7hR+IE8iW3XD8/uzk2PZJjI=;
        b=PyaAa+7zJkbhVtuq/y4nCoL+6+OHyL8042n/2u9IFJqiSzqXzTbEHoauwSfbtO8DbF
         Fc8YRBIX6gdV5KnJrhRDUL68qoaB+xPoV7g2Ro4cATymXgcrDIDMJJysS9NmdsWu+4pM
         F3ldQsv7rQV8J0MNx5SJgmD8Zk/r+qIu3FislVJntFquhvMfy4Q/M86IzJh7YfYeC9EP
         m+FvynOAIEe3HixcAdhiV6Zd3pg7WDnIKWa53v0WsxKKK4otPxFKNaS1yPLjWUX3Hu43
         8GXnUgRwjjRpDrapuF1yoKccU4gwN75l25xlXdRDZLJTmL63XxXGE/grVUeLrZJBiC+w
         dBAA==
X-Forwarded-Encrypted: i=1; AKwUvBzXIkOmRAFpRytm8Zkz+LmovV3YCR5OZ8pSKW63VGcrp/LwVi2MpJPa1w2E8x9iSQ9dhZVTnGZ8B/Q=@lists.xenproject.org
X-Gm-Message-State: AFuF++nO8XAweh/Iz5cGaTnPiE8MNUnLY8/twtbehfvC7qm9SYFq9uV1
	T1TzKKZfyClPwMZHKWS4FEiu57c6KeJAkFANExtwOQrMJOhGmGfodYqLdWON+n24GQ==
X-Gm-Gg: AYBFou2drGbvli1IfqgdU7BjMTciMjR6DxHgaOaGrvJ1KoY3E4CvMferD1bvG9xrkgJ
	F1644W7OEgIDPf4Q5DQvZI95U2ezasVXOIF+liq646Vmov8Uvtfzn/EYw8pGC6hsoiAeRzwp35G
	sKqaxDgLKHcdvsRwFppewsvnKWZh1p62TMjMMNc08uS55D9Qs9hMr935yw02gnTcVO0SnZqrJcm
	B7GKHiKkJJ9il+5dopwPAzYe5wU5b52ofAgj8jy4//O/LMkFPYO4d3ePgsJ+ZZWPHWNjc0WjJA1
	4+iecKEhIGA4u2DZIRWE3oLqmmPMMi1ALWQyIqKHCn5yC1QMO3+N622EUelKE7yIRH/43BqObhn
	+FaVPfW629Gfyg9k0k12bAHLc3kunY2qKwdEXUwOgE+SLK/9JB7M6g5w9Wb0ddrjyrw24euHStC
	pvNuZn/kau8qtZHBOoabVTshGeHsGVcapRvloO349fgcbTSSWPeg84COh82DYzBVHKbNAY0mSFN
	4l/MCsPG4XSg1dn1vxKx9ByXekcbZdEESgrhWaAM39PetxbdoXjqjMbBiJNteVA
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr518591815e9.16.1788797210898;
        Mon, 07 Sep 2026 09:06:50 -0700 (PDT)
Message-ID: <99a68a9d-79f0-4090-b0ed-3afdddb57fd6@suse.com>
Date: Mon, 7 Sep 2026 18:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] x86/pv: update guest LDT mappings using
 {populate,destroy}_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-5-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-5-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788797211-F28B42AC-73030BB8/0/0
X-purgate-type: clean
X-purgate-size: 3148

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Until two patches ago, update_xen_slot_in_full_gdt() used the stashed

With wording at the start here and ...

> pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vCPU's page
> tables with Xen's GDT; this was previously necessary because
> map_domain_page() couldn't be called in a context switch.  Having a
> handy pointer to an always-mapped version of the GDT/LDT L1 table,
> other sites which modify the table started using it for convenience,
> even if they weren't called from within a context switch.  These
> include pv_map_ldt_shadow_page() and pv_destroy_ldt().
> 
> Continue the process of switching users of the stashed reference to use
> populate_perdomain_mapping() instead.
> 
> pv_map_ldt_shadow_page() is, by definition, always modifying the
> currently-running vCPU: it runs from the #PF handler for a descriptor
> fetch on the guest's behalf, and running the guest implies its page
> tables are loaded.  So it could simply write the linear recursive
> mappings directly.  Go through populate_perdomain_mapping() anyway, to
> keep a single writer for the per-domain area.
> 
> For pv_destroy_ldt(), use destroy_perdomain_mapping().
> 
> Previously, pv_destroy_ldt() used the L1 LDT entries themselves to
> determine which MFNs to drop type and count references to.  Rather
> than reading from the stashed L1, keep the MFNs corresponding to L1
> slots in an array in the vCPU structure, as we do in the GDT case.
> (Note that unlike the GDT case, these are not part of a public ABI, so
> can be mfn_t, avoiding a recast-and-copy.)
> 
> Note that mappings_dropped (the return value of pv_destroy_ldt()) now
> reflects the *number of valid MFNs in this array*, not *the number of
> non-empty L1 entries*.  This introduces an invariant we must maintain:
> pv_map_ldt_shadow_page() writes both the array entry and the mapping,
> and pv_destroy_ldt() clears both, so the two stay in lockstep.
> 
> Also note that, unlike pv_destroy_gdt() from the previous patch,

... here adjusted as per the comment on the earlier patch, ...

> pv_destroy_ldt() doesn't fill in the values with zero_l1e (see
> 61031e64d3), so there's no change here.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

On the basis that ...

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -541,6 +541,8 @@ struct pv_vcpu
>      struct trap_info *trap_ctxt;
>  
>      unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
> +    /* Max LDT entries is 8192, so 8192 * 8 = 64KiB (16 pages). */
> +    mfn_t ldt_frames[16];
>      unsigned long ldt_base;
>      unsigned int gdt_ents, ldt_ents;

... this not really insignificant size increase is okay-ish as long as
struct hvm_vcpu is about three times the size (i.e. is still more than
double the size after this change).

Jan

