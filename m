Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1B5CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:23:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437166.1655966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtLN-0005lB-AH; Wed, 30 Sep 2026 12:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437166.1655966; Wed, 30 Sep 2026 12:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtLN-0005l4-7A; Wed, 30 Sep 2026 12:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1437166;
 Wed, 30 Sep 2026 12:23:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBtLM-0005ky-3d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:23:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBtLL-00EI92-Gk
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:23:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcff3c-e002-0a2a0a5209dd-0a2a4503d7dc-16
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:23:27 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcff3f-fae8-0a2a45030019-4a7de18dc398-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:23:27 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so29281745e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 05:23:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd6cd2bsm4102745e9.4.2026.09.30.05.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 05:23:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1790771007; x=1791375807; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BpmaPx6ltzuKIgdbHDqGSio72UxfSOikDrJFZ2pGos=;
        b=e3D+WLxw+j6prh59YldcPpAbsKFkjx19tpVJVDQlFVdELOr8TX23kJiOGmN8aldoTS
         2TMhCh8rzTdk5cvN3fizNxgnX6XFOby8DiG35YSIsK8Y5bil9Vm6cxtDyI/fLlrbePZB
         vqfemzqw05YGNchBWoOiTpwokHgqaJegQTUIMgkI65+yIFV24C05VxWTEe/F51vorU1G
         TnEQ/9a0WQnyG6KItJMCGpVjqDIBPLTcFrkELjShRDSJllDku2oTCne7Y7/qDUlVaOaI
         ecNvgByKnxh4+zraC7KQ7qN2bvDfF/nCZ6n6On/EFL9tpioTbtsQvg3RRRlTXi4HUAvX
         Qxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771007; x=1791375807;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BpmaPx6ltzuKIgdbHDqGSio72UxfSOikDrJFZ2pGos=;
        b=Zbj1wZ4hqEvtx69cZY9Ap9RhyhFn0uh/i3KwsblpdxImLTuJdstytW2/4GwnhBUda0
         c1FvRjpRbc70H/DfnOYyjry3ft55VDJbZEKAxwe/bjTyyUobxO3/vFabBLy4zzeBGGQ/
         hsIbAp1htOSY+XZaIx4w7gj6hDnjHnnH4u6/7TzClX8++sumwpBhgwX+C9G0u1PwlIno
         P/Inr69OhVdahpW2RiOU4LWjR/4yqcHo3xge1kuUGN4Hi9CF03p/TWskxf0O13QKaSz3
         qpg49BvaC/MiSprSP/RnT4UZGuFqXtDVnPgdNDbvXDrp4aaPUiSuTGwLOhkuzc+Ht9je
         XPOg==
X-Forwarded-Encrypted: i=1; AKwUvBxi2ScyGowAy44or/pr55Rog3ZEcAUOTCiDq6MYVkWIWvDe4cWEqYWKODEtKGK4C7QjVqvwNnwO/Nc=@lists.xenproject.org
X-Gm-Message-State: AFuF++ndcq6OvlrQMscH0lbWb4ioPC2qP1YyK/z9mNhL9VYWKcRwP91f
	KLm9dVCcB/O4rT98546nQOD9ToHNEkXw83bJm19snS14ItXElwM/1FSZZh7RBWN57w==
X-Gm-Gg: AYBFou1iBx7d7Q//pAlZgG0Qocelc04DkEAREeETkefklIVwkH/+39OeevcbF3NcOI5
	6Fe1P5xG409aPlmNzz2wUM8/SYW+SdWM4zDGYUIvD07BTOUnQqKlXEK2hxJQHd5GhoZy/0llUKh
	RwlIYEQt38zwvj6NrdmHKGu4xBPZpC7gbOp5ha28XmqiRmN6ukj678xkf1tJjmp6I6Vrj6aVAyJ
	2G1jOE1F/h99R/Q4t8ysy0UgdfkzdsjefsXaCqVDlRfhLbRj5jHP/CduzTmzRJOhytB5ZKBWe7v
	Q9YwNkwu61Jb0UaxehqRltdnvoYICH9Hr2+Lv9DxwSm/ALMX2H0YUUua/ZZlc2InDrAryW49lmd
	59oMq9oq4BwmYEIWzuPV6smH5MAJFbqkpLgRm9ut4ZDCRrTqduMsn7HF6IAKUhzyB55JbvAZ6+o
	OlRwG9yzo+7hLT2roj4jaoxfHxMJQ4pZYXPNSbv32z5CTAUqqrwAi4hPc4Zd4nqKUUFxGkOSKXN
	TW5iQaMy00k6r4s6JfIMRuyl9Bqio14xnRNd66vxqsAuBhXHQPzhwTuBXE7geiWpOYCYsb6eg==
X-Received: by 2002:a05:600c:a43:b0:49f:e69d:9df9 with SMTP id 5b1f17b1804b1-4a01aff0776mr19590715e9.10.1790771006828;
        Wed, 30 Sep 2026 05:23:26 -0700 (PDT)
Message-ID: <26dc6e8a-4845-4372-ad80-662750dbc8ec@suse.com>
Date: Wed, 30 Sep 2026 14:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@vates.tech>
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
In-Reply-To: <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790771007-762FD4E9-AE837658/10/78276251493
X-purgate-type: spam
X-purgate-size: 1949

On 29.09.2026 18:32, Baptiste Le Duc wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but
> setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
> fixmap) build leaf PTEs directly without going through it. Without Svadu,
> both would fault on first access.
> 
> Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> all cases for consistency with pt_update_entry() which sets it at runtime.
> 
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and for the temporary root entry
> built by check_pgtbl_mode_support(), instead of the equivalent raw bit
> lists. The latter drops PTE_WRITABLE, going from RWX to RX, but this is
> harmless, as that entry only has to make the current instruction stream
> fetchable between the two CSR_SATP writes used to probe SATP mode support,
> and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> carries A and D, a reserved PTE with A or D set would no longer be caught.
> Mask with the V, R and W bits explicitly instead, and factor the check out
> into pte_is_reserved().
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


