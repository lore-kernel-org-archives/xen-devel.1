Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080EC5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:28:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388898.1629866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4JO-00029q-8k; Wed, 12 Aug 2026 08:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388898.1629866; Wed, 12 Aug 2026 08:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4JO-00029j-5t; Wed, 12 Aug 2026 08:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1388898;
 Wed, 12 Aug 2026 08:27:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu4JM-00029d-PH
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:27:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu4JM-00BjbY-4v
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:27:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2e70-e002-0a2a0a5209dd-0a2a450ae3b4-46
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:27:43 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c2e7f-f2d2-0a2a450a0019-d155dd2fd8a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:27:43 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47fecbb7000so314311f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:27:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d72232sm5450024f8f.37.2026.08.12.01.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:27:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1786523263; x=1787128063; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxF9ThbimReP54YPIpZA2L6bkAmldFc0bCkBEL+nZTQ=;
        b=DD+D081h0YNG82rE04uvwGqlGajzG9ODHFMltyjzNctNyaPbbjadtmhgsS0yBbbejf
         1e2y7zlZMierJksm5X1x1LbMml8OFYwa0UxHWzww74h/TeftGc+xWzi2NbdOjZGULhvR
         qGEBpBuhZItidg1lHzaQMi0wsp9QsOjBFsZbC7E9aiptDAToSASp2ArJBDVvDH/U9P++
         Ejc38qzuPS8GBbUwaGgLT1qimHXGD0vA6ghj2ogS71TSNrtRYDqLI5CYn39XrE8as0Pb
         EVokQSCen28p35fl+n5knQW/BhxRVSPul+18MrBarwlpA5s6EdeFYnbX+CTyOwFw/6Sn
         jdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523263; x=1787128063;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxF9ThbimReP54YPIpZA2L6bkAmldFc0bCkBEL+nZTQ=;
        b=p0bBGxOt4937alsafKe7KO+XrwOKDknayJnrfKYLEFFvYtNI3aF6uoI0MpHOycpOVD
         QEoIC0r1yrJph03Uh3SdLW1zPzEeLrdO1rehQ5kMGAXd6vo/EsUpBTy22eFS5IyUH8EU
         AcIHRkMUgI803gPzXaJWdss4oCoz6PKYpYHyXOYho73RS8oNb5kfFhkNBCqVMkRsZxT4
         LYSkQ/0X+61s48cYz7QxpSm5fiIMRbb20NfghEe5vnU0+7JZmi4GQcPSGUdG8qvutJ2j
         k8rl2qSfSUGhNoSh9d81MabbbAD4YqvWYL4NFoKvs9OfrUaExcBJRMnCsx+DOtc0dn8s
         0bVw==
X-Forwarded-Encrypted: i=1; AHgh+RrjMEUHG/K5YY9E+unpohy6NXoVL81ijmCf3hmh7GqULTWSAC6XLEujaRp/85MwuARnIV4TeG4z3Ec=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj7myzt9xk7y2ScxIcxsSTSYuiI76bOKWPgKx7bumyB74OnlY9
	SRD3KzC84dnw3akr/PAsRZW6+su9gecCh/uj5DnIfqtXHHyd/ek0mwUGnzIe7nTR0w==
X-Gm-Gg: AR+sD12+s50mEIr96ZlfrhHw50wo37FYtIxeoZgkQX5r+s+5kAeTdkbevu1K1eHVrta
	LwlhFnmNYb/JU5Gs5wo134VkELPSBCprVF7peWkJlfLi205CxXhg5wCGGoj5K9re0yvxGk2ojx3
	II10uF0NoUCGlK9Np53Npzm6cMwGf1D1y1hgaIIuH1QncSBATuMYrS1XgWzbTh02pl/QiSNOzUr
	tq4exnG/gCM8jrrvmn5RZMcjw8Ybb9DR1eE5cWdAfsHYRZ0qAGOVXZ05BmAId4mWdzLFDgApZ30
	1LbBgEmji/5nMPy7ltlvBeHXxSrgLYZw8Ot6fkFnwRZLRoBE1TPQXGVR1a2Rrnx2gNLghAo0Xud
	IpgRIU9iSNkCPi8Ya8JORQsCsmGhNBjuwSBpNU6fl8hfgS8gzeEgX47oAHz1JCnEuKwtXPH2fr2
	RQLZT9Wh9J5HTmXpeu+YxeCU2+SaqxggOz7VgZ/Efu6sVqsgZN8l7u8n7HYsQwaJG81rtunOjs0
	XWV2lkHMlBJPuTMRau6unCvxjG30ZbwYSPqE6cybC3JT1Xvz9mf
X-Received: by 2002:a05:6000:4022:b0:47f:d0fb:ea33 with SMTP id ffacd0b85a97d-48152c75ef4mr4014071f8f.20.1786523263332;
        Wed, 12 Aug 2026 01:27:43 -0700 (PDT)
Message-ID: <193c0981-f5dc-4598-abc6-58ccbbe1a372@suse.com>
Date: Wed, 12 Aug 2026 10:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
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
In-Reply-To: <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786523263-506CECFC-B2E5C686/0/0
X-purgate-type: clean
X-purgate-size: 3859

On 07.08.2026 23:28, Teddy Astie wrote:
> HYPERVISOR_mmu_update passes a set of request, where each request has a pointer
> to the PTE along with a sub-command.
> 
> The PTE alignment padding is used to transport the sub-command while the rest
> is used as a address to a PTE entry. The current documentation state that the
> 2 first bits are used for sub-command, hence the other ones for PTE which
> imply here a 4-bytes alignment on PTEs.
> 
> On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
> off-by-4 PTEs addresses are always incorrect. Non-PAE PV32 guests used
> "legacy pagetables" which had 4-byte aligned PTEs. However, support had
> been completely removed since Xen 4.0, and were only available when Xen was
> built in 32-bits non-PAE mode [1].
> 
> Current Xen logic behave as if 3 bits are used as sub-command, thus all
> off-by-4 PTEs are actually rejected as being unknown sub-commands.
> 
> Adjust the documentation to match the current logic implemented in Xen,
> also expanding the documented sub-command parameter to 3 bits.
> 
> [1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target.")
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This happens to be a complete rewording of [2]. I'm not sure what to do exactly
> regarding the signed-off.

I think the patch here nevertheless should have been v2, with original authorship
retained. It looks largely okay to me (with Frediano's nits addressed). I think,
though that ...

> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -218,16 +218,16 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   *                     x == 0 => PFD == DOMID_SELF
>   *                     x != 0 => PFD == x - 1
>   *
> - * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command.
> + * Sub-commands: ptr[2:0] specifies the appropriate MMU_* command.
>   * -------------
> - * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
> + * ptr[2:0] == MMU_NORMAL_PT_UPDATE:
>   * Updates an entry in a page table belonging to PFD. If updating an L1 table,
>   * and the new table entry is valid/present, the mapped frame must belong to
>   * FD. If attempting to map an I/O page then the caller assumes the privilege
>   * of the FD.
>   * FD == DOMID_IO: Permit /only/ I/O mappings, at the priv level of the caller.
>   * FD == DOMID_XEN: Map restricted areas of Xen's heap space.
> - * ptr[:2]  -- Machine address of the page-table entry to modify.
> + * ptr[:3]  -- Machine address of the page-table entry to modify.
>   * val      -- Value to write.
>   *
>   * There also certain implicit requirements when using this hypercall. The
> @@ -264,17 +264,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   * mentioned above. The argument is MMUEXT_UNPIN_TABLE for all levels and the
>   * pagetable MUST not be in use (meaning that the cr3 is not set to it).
>   *
> - * ptr[1:0] == MMU_MACHPHYS_UPDATE:
> + * ptr[2:0] == MMU_MACHPHYS_UPDATE:
>   * Updates an entry in the machine->pseudo-physical mapping table.
> - * ptr[:2]  -- Machine address within the frame whose mapping to modify.
> + * ptr[:3]  -- Machine address within the frame whose mapping to modify.
>   *             The frame must belong to the FD, if one is specified.
>   * val      -- Value to write into the mapping entry.
>   *
> - * ptr[1:0] == MMU_PT_UPDATE_PRESERVE_AD:
> + * ptr[2:0] == MMU_PT_UPDATE_PRESERVE_AD:
>   * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are ORed
>   * with those in @val.
>   *
> - * ptr[1:0] == MMU_PT_UPDATE_NO_TRANSLATE:
> + * ptr[2:0] == MMU_PT_UPDATE_NO_TRANSLATE:
>   * As MMU_NORMAL_PT_UPDATE above, but @val is not translated though FD
>   * page tables.
>   *

... at least retaining some reference to the non-PAE situation would be helpful.

Jan

