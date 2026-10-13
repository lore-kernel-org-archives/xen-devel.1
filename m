Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A16BCA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:43:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446966.1663108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZyN-0007qi-RT; Tue, 13 Oct 2026 10:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446966.1663108; Tue, 13 Oct 2026 10:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZyN-0007qb-Nh; Tue, 13 Oct 2026 10:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1446966;
 Tue, 13 Oct 2026 10:43:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZyM-0007qV-VX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:43:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZyM-008SRk-8T
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:43:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0b2e-8faa-0a2a0a5109dd-0a2a450a99c8-26
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:43:06 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0b39-f2d2-0a2a450a0019-d155dd33a492-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:43:05 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48b02a2359aso2617005f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:43:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa9f9sm4596010f8f.19.2026.10.13.03.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:43:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1791888185; x=1792492985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKdOjTrFDv1gnxofkiRE7WHkmPOI2o+TjSz9NKa2zTU=;
        b=WoNIk8BuFAipgyEvmyL0CuVjJHyrkKdY6ZSASjUlJi1KcQMAo7LfNxmO1JM5ag6d20
         zs/FeVONGXIod/bSiuQIF1M2qax4TYaoikskIZ0wEJ/teCyRAe1+FC3GnVj6smpJOMth
         FmyLqw5zuUBPdT5AuEp7PlDBGzWY6NWaRI57WEVe+zH8hgJywm+3lIaKq9OSEvpN47Tm
         ub8iptSMs5daNaVNk7F4fKsOkfSoKNk0Zcz7QbSoT8YgxHtvi7izouPRFC7E4GEho6cJ
         vmHSw6i3aeI2OlfGkyd4O5LldY/59bsCUQOJBe1h2iPFFtLc0simvbqjkthj8hhrJias
         JelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888185; x=1792492985;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKdOjTrFDv1gnxofkiRE7WHkmPOI2o+TjSz9NKa2zTU=;
        b=f5Wvk+RoGmVkC0zW8+H83QxDq1Np3UJOy4h7+ib+/7nf913HrXYs7f/HhGBhTmD+Rf
         CsWBSYpq03eguTKgtfeoMyV1P4livbnMoUX79EspgyTo1TfHJVra4a7Wew568JdoSv7P
         JZ10b7cnMvWGtxcWPE1mYuVqnHN6c4bGV5KWikvE4GE2CzF42sVuwflho5pGEF+9qqqe
         Uh2Dw7U41Pn8UpK+3xcOukWC9aXRb8XnTEFoPej8uj1iHBKTBbPhCRqpfNkJY9gfWOT+
         8P3rEAlAjZnvPKSZJ5cLrH3ycHPESU++7P40SLntW3gnjDvLj8qaPujO8ITCNgzhNatM
         HWgg==
X-Forwarded-Encrypted: i=1; AKwUvBxz1lrLHuA2a/6BoJz/vDHA6cfFeDP1lJdWMtAbhVle4YKXuLrmuFHdMXtzUM9UYHvNs/fUv+aRKf8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI3RoT4OUghCSErGh0TEvniabtXRKXtPuJm64Lfo8D2LujqXvWi
	Ge7CgvW3uiPHcPgMxUget0H4K0XLHlW2MINXS2iyJS/xLKxKSGOzlOwvyl2Q5B9LxA==
X-Gm-Gg: AYBFou305DKKLoGt52lSufWTKlMffWTrl0bYRwELk1EBJ/hawmPELJfhhxWjbMBgAPS
	warbyuybrWgroJJ326Za4WAaviof9syAvQoFvY4V0ZoKcWp0NdvKzz40BeiJDeZ1I5UY+WU+WoZ
	9/Orhc4NXfQyB0mGZr8GRN3PFcQA9B6wDpwXviBuOQOsoaMccY7OsEpCTCkqhuYFyHQAk2ZVpwf
	Ujfv6KU5KmqRjDin7kh4fBPh2kgeCo4AL2ei1YW5eiR4LsJiNtlQIGzGGydmTZ/Aad88ANZPiJS
	v2/qb25RM0fb2TDvoWW2mLwgAO2z0b07l1FEj0OmPKUzBWIAZmfdecABqAB4Aov2ZQO3RbtWyDT
	PeWsdm8mI9kGiYlyZZWIB826u35iCT9hYtWqiO7T8VDGGVLGg/x7sFWeGtS0PAG2g9wtaLxM9nh
	KvHnhSNxHda1+00iE8QbMcM865fo9kuXOVNvSF4dVSKheL4NSfEl2tPlrxTBnLpfxEHfkeN6Jil
	f0RYcSrsPApb281XX/RmID+XzP1U8CJwQT4yetlhnTKIgbF9mlo/NFP1zhjcyU=
X-Received: by 2002:adf:f789:0:b0:48c:4a62:9b31 with SMTP id ffacd0b85a97d-48dba9e66femr16904139f8f.5.1791888185040;
        Tue, 13 Oct 2026 03:43:05 -0700 (PDT)
Message-ID: <f03043d3-740b-4e85-ab53-a7a19adc5f6c@suse.com>
Date: Tue, 13 Oct 2026 12:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
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
In-Reply-To: <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791888185-516C6CFC-8F5E863E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2958

On 13.10.2026 12:07, Baptiste Le Duc wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but three places build
> leaf PTEs directly without going through it: setup_initial_mapping() (the
> boot page tables), check_pgtbl_mode_support() (the temporary root entry
> used to probe SATP mode support) and arch_pmap_map() (the fixmap).
> 
> Without Svadu, all three fault on first access. For
> check_pgtbl_mode_support(), the fault is raised by the instruction fetch
> right after the SATP write, before any trap handler is set.
> 
> Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> all cases for consistency with pt_update_entry() which sets it at runtime.
> 
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and check_pgtbl_mode_support() to
> use PAGE_HYPERVISOR_RX for its temporary root entry. The latter drops
> PTE_WRITABLE, going from RWX to RX, but this is harmless, as that entry
> only has to make the current instruction stream fetchable between the two
> CSR_SATP writes, and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> carries A and D, a reserved PTE with A or D set would no longer be caught.
> Mask with the V, R and W bits explicitly instead, and factor the check out
> into pte_has_reserved_rwx().
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v5:
> - no changes, already reviewed and waiting to be merged.

I'm puzzled by this, also seen in the next patch: For one, nothing is said
anywhere that patches 3 and 4 are independent of patches 1 and 2, and
hence could go in ahead of those. And then, formally, neither patch is
ready for committing - Oleksii's R-b isn't enough at this point. I would
have ack-ed the last patch if that didn't - contextually - depend on the
one here. I'm only going to ack the one here once either it is clarified
that it's independent of the first two patches, or once agreement was
reached on those earlier patches. (If this was independent, though, I
would have expected it to have got moved to the front of the series, to
disambiguate whether it may go in already.)

Jan

